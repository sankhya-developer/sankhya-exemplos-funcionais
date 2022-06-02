SELECT SYSDATE AS DTREF,
       NUNOTA,  
       CODPARC, 
       CODCENCUS, 
       CODNAT, 
       CODPROJ, 
       CODEMP, 
       DTNEG, 
       CODTIPOPER, 
       TIPMOV, 
       VLRNOTA, 
       NUFIN,
       PROVISAO,
       RECDESP,
       VLRDESDOB,
       DTVENC,
       DTBAIXA,
       HISTORICO, 
       PENDENTE,
       TIPO
  FROM (     
        SELECT CAB.NUNOTA,  
               CAB.CODPARC, 
               CAB.CODCENCUS,
               CAB.CODNAT, 
               CAB.CODPROJ, 
               CAB.CODEMP, 
               CAB.DTNEG, 
               CAB.CODTIPOPER, 
               CAB.TIPMOV, 
               CAB.VLRNOTA, 
               FIN.NUFIN,
               FIN.PROVISAO,
               FIN.RECDESP,
               FIN.VLRDESDOB,
               FIN.DTVENC,
               FIN.DTBAIXA,
               FIN.HISTORICO, 
               CAB.PENDENTE,
               'EMPREITO' AS TIPO
          FROM VGFFINRAT FIN
               INNER JOIN TGFCAB CAB ON CAB.NUNOTA = FIN.NUNOTA
         WHERE CAB.STATUSNOTA = 'L'
           AND CAB.PENDENTE = 'S'
           AND CAB.TIPMOV = 'P'
           AND FIN.PROVISAO = 'S'
           AND FIN.DHBAIXA IS NULL
           AND CAB.CODTIPOPER IN (103,106,108,146,147)
     UNION ALL   
        SELECT CAB.NUNOTA,  
               CAB.CODPARC, 
               CAB.CODCENCUS, 
               CAB.CODNAT, 
               CAB.CODPROJ, 
               CAB.CODEMP, 
               CAB.DTNEG, 
               CAB.CODTIPOPER, 
               CAB.TIPMOV, 
               OSE.TEMPGASTO*(SELECT SUM(VLRUNIT) 
                                FROM TGFITE I
                               WHERE NUNOTA = CAB.NUNOTA
                                 AND (SELECT CODGRUPOPROD FROM TGFPRO PRO WHERE PRO.CODPROD = I.CODPROD) IN (5010, 5012, 5051)) AS VLRNOTA, 
               CAST(NULL AS INT) AS NUFIN,
               '' AS PROVISAO,
                CAST(NULL AS INT) AS RECDESP,
               0 AS VLRDESDOB,
               DTEXEC+1 AS DTVENC,
               CAST(NULL AS DATE) AS DTBAIXA,
               '' AS HISTORICO,  
               CAB.PENDENTE,
               'MEDICAO' AS TIPO
        FROM CND_MED_FATPEND OSE /*ITENS DE OS's FATURÁVEIS QUE AINDA NÃO FORAM FATURADAS*/
             INNER JOIN TGFCAB CAB ON CAB.NUNOTA = OSE.NUNOTA
       WHERE CAB.TIPMOV = 'P' 
         AND PENDENTE = 'S' 
         AND CODTIPOPER = 104 
     UNION ALL   
        SELECT CAB.NUNOTA,                 
               CAB.CODPARC, 
               CAB.CODCENCUS,
               CAB.CODNAT, 
               CAB.CODPROJ, 
               CAB.CODEMP, 
               CAB.DTNEG, 
               CAB.CODTIPOPER, 
               CAB.TIPMOV, 
               CAB.VLRNOTA, 
               FIN.NUFIN,
               FIN.PROVISAO,
               FIN.RECDESP,
               FIN.VLRDESDOB,
               FIN.DTVENC,
               FIN.DTBAIXA,
               FIN.HISTORICO,    
               CAB.PENDENTE,
               'LU_EAD' AS TIPO
          FROM TGFCAB CAB 
               INNER JOIN VGFFINRAT FIN ON CAB.NUNOTA = FIN.NUNOTA
         WHERE CAB.CODNAT NOT LIKE '1104%'
           AND CAB.CODNAT NOT LIKE '1105%'
           AND EXISTS(SELECT 1 FROM VGFVENDAS_JOIN_G WHERE NUNOTA = CAB.NUNOTA AND DEVOLVIDA = 'N')
           AND CAB.TIPMOV = 'P'
           AND CAB.CODTIPOPER NOT IN (113, 84,85,114,117,236,237)
           AND NOT EXISTS(SELECT 1 FROM TGFVAR WHERE NUNOTAORIG = CAB.NUNOTA)
    )