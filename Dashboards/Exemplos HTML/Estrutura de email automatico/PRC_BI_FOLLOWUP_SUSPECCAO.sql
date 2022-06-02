CREATE OR REPLACE PROCEDURE PRC_BI_FOLLOWUP_SUSPECCAO AS
  P_ASSUNTO       TMDFMG.ASSUNTO%TYPE;
  P_EMAIL         VARCHAR2 (500);
  P_CONTEUDO      CLOB;
  P_MENSAGEM      TMDFMG.MENSAGEM%TYPE;
  P_NUMSUSP       NUMBER(10);
  P_NUSUBSUS      NUMBER(10);
  P_NOMEPAP       VARCHAR2(500);
  P_NOMECONTATO   VARCHAR2(500);
  P_DHAGEND       VARCHAR2(500);
  P_DESCROCOROS   VARCHAR2(500);
  P_SDRRESPONSVEL VARCHAR2(500);
  P_CONTADOR      NUMBER;
  P_CORPO         AD_TMBMOD.CORPO%TYPE;

  CURSOR FOLLOWUP IS
    SELECT SUSP.NUMSUSP AS "Nro.Suspecção"
         , DET.NU AS "Nro.Sub Suspecção"
         , PAP.NOMEPAP AS "Suspect"
         , CTT.NOMECONTATO AS "Contato"
         , TO_CHAR(DET.DHAGEND,'DD/MM/YYYY hh24:mi') AS "Data/Hora Agendamento"
         , OOS.DESCROCOROS AS "Atividade"
         , SUSP.SDRRESPONSVEL AS "Usuário"
         , LISTAGG(USU.EMAIL||CASE WHEN USU.EMAIL IS NOT NULL THEN ',' ELSE ' ' END) WITHIN GROUP (ORDER BY USU.EMAIL) AS EMAIL /* Email do USuario para receber o BI*/

      FROM AD_TCSSUSP SUSP
           INNER JOIN AD_TCSSUSPDET DET ON SUSP.NUMSUSP = DET.NUMSUSP AND DET.CODPAP = SUSP.CODPAP
           INNER JOIN TCSPAP PAP ON SUSP.CODPAP = PAP.CODPAP
           INNER JOIN TCSCTT CTT ON DET.CODCONTATO = CTT.CODCONTATO AND CTT.CODPAP = SUSP.CODPAP
           INNER JOIN TSIUSU USU ON SUSP.SDRRESPONSVEL = USU.CODUSU
           INNER JOIN TCSOOS OOS ON DET.CODMOT = OOS.CODOCOROS

     WHERE DET.DHEXEC IS NULL
       AND TRUNC(DET.DHAGEND) = TRUNC(SYSDATE)

  GROUP BY SUSP.NUMSUSP
         , DET.NU
         , PAP.NOMEPAP
         , CTT.NOMECONTATO
         , DET.DHAGEND
         , OOS.DESCROCOROS
         , SUSP.SDRRESPONSVEL;

BEGIN
  SELECT CASE WHEN EXISTS (SELECT 1        
                             FROM AD_TCSSUSP SUSP
                                  INNER JOIN AD_TCSSUSPDET DET ON SUSP.NUMSUSP = DET.NUMSUSP AND DET.CODPAP = SUSP.CODPAP
                                  INNER JOIN TCSPAP PAP ON SUSP.CODPAP = PAP.CODPAP
                                  INNER JOIN TCSCTT CTT ON DET.CODCONTATO = CTT.CODCONTATO AND CTT.CODPAP = SUSP.CODPAP
                                  INNER JOIN TSIUSU USU ON SUSP.SDRRESPONSVEL = USU.CODUSU
                                  INNER JOIN TCSOOS OOS ON DET.CODMOT = OOS.CODOCOROS
                            WHERE DET.DHEXEC IS NULL
                              AND TRUNC(DET.DHAGEND) = TRUNC(SYSDATE))
              THEN 1
              ELSE 0
         END
    INTO P_CONTADOR
    FROM DUAL;

  IF P_CONTADOR = 1 THEN
    OPEN FOLLOWUP;
      LOOP FETCH FOLLOWUP INTO P_NUMSUSP, P_NUSUBSUS, P_NOMEPAP, P_NOMECONTATO, P_DHAGEND, P_DESCROCOROS, P_SDRRESPONSVEL, P_EMAIL;

      EXIT WHEN FOLLOWUP%NOTFOUND;

      P_CONTEUDO := P_CONTEUDO || '<tr><td><center>'||TO_CHAR(P_NUMSUSP) ||'</center></td>
                                       <td><center>'||TO_CHAR(P_NUSUBSUS)||'</center></td>
                                       <td><center>'||P_NOMEPAP          ||'</center></td>
                                       <td><center>'||P_NOMECONTATO      ||'</center></td>
                                       <td><center>'||P_DHAGEND          ||'</center></td>
                                       <td><center>'||P_DESCROCOROS      ||'</center></td></tr>';

      END LOOP;
    CLOSE FOLLOWUP;

    SELECT CORPO INTO P_CORPO FROM AD_TMBMOD WHERE CODMOD = 6;

    P_MENSAGEM := '<div class="container"><div class="table-responsive"><table class="table"><thead><tr><th><center>Nro.Suspecção</center></th><th><center>Nro.Sub Suspecção</center></th><th><center>Suspect</center></th><th><center>Contato</center></th><th><center>Data/Hora Agendamento</center></th><th><center>Atividade</center></th></tr></thead><tbody><tr><center>'||P_CONTEUDO||'</center></tr></tbody></table></div></div>';
    P_EMAIL    := P_EMAIL;
    P_ASSUNTO  := 'Agenda Follow UP de Suspecção';

    P_CORPO := REPLACE (P_CORPO, '{V_TITULO}', 'Agenda Follow UP de Suspecção');
    P_CORPO := REPLACE (P_CORPO, '{V_SUBTITULO}', '');
    P_CORPO := REPLACE (P_CORPO, '{V_CONTEUDO}', TO_CHAR(P_MENSAGEM));

    Insere_Msg_Fila_Bimovel2(P_ASSUNTO, 0, P_EMAIL, P_CORPO, 'E', 3);

  END IF;
END;

/