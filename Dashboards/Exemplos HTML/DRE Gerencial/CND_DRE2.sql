SELECT SYSDATE AS DTREF,
       A.AD_CONDOMINIO,
       A.REFERENCIA,
       A.CODCENCUS,
       A.AD_SKJV2,
       A.NROUNICOBP,
       A.CTACTB,
       A.DESCRCTA,
       A.CODPROJ,
       A.SKJV,
       A.AD_CATEGORIA,
       A.STATUS,
       A.CODDIRETORIA,
       A.DIRETORIA,
       A.CR_NOVO,
       A.CODEMP,
       SUM(A.REC_BRUT_MC) AS REC_BRUT_MC,
       SUM(A.REC_BRUT_U) AS REC_BRUT_U,

       SUM(A.REPASSE_UNI) + SUM(A.IMPOSTO) AS DEDUTORES,

       SUM(A.IMPOSTO) AS V2_DEDUTORES,

       SUM(A.IMPOSTO) + SUM(A.REPASSE_UNI) AS REC_LIQ,

       SUM(A.IMPOSTO) AS V2_REC_LIQ,

       SUM(A.CUSTOS) AS CUSTOS, 

       (SUM(A.IMPOSTO) + SUM(A.REPASSE_UNI) + SUM(A.CUSTOS)) AS LCR_BRUTO,

       (SUM(A.DESP_ADM) + SUM(A.DESP_COM) + SUM(A.DESP_OUT)) AS DESP_OPER,

       (SUM(A.IMPOSTO) + SUM(A.REPASSE_UNI) + SUM(A.CUSTOS) + SUM(A.DESP_ADM) +
        SUM(A.DESP_COM) + SUM(A.DESP_OUT)) AS LCR_OPER,

       (SUM(A.REC_FIN) + SUM(A.DESP_FIN)) AS RESULTADO_FIN,

       (SUM(A.IMPOSTO) + SUM(A.REPASSE_UNI) + SUM(A.CUSTOS) + SUM(A.DESP_ADM) +
        SUM(A.DESP_COM) + SUM(A.DESP_OUT) + SUM(A.REC_FIN) +
        SUM(A.DESP_FIN)) AS LCR_ANTES_IR_CSLL,

       SUM(A.IR_S_LCR) AS IR_S_LCR,  
       SUM(A.CS_S_LCR) AS CS_S_LCR,

       (SUM(A.IMPOSTO) + SUM(A.REPASSE_UNI) + SUM(A.CUSTOS) + SUM(A.DESP_ADM) +
        SUM(A.DESP_COM) + SUM(A.DESP_OUT) + SUM(A.REC_FIN) +
        SUM(A.DESP_FIN) + SUM(A.IR_S_LCR) + SUM(A.CS_S_LCR)) AS LCR_LIQ,

       SUM(A.IRPJ_CSLL) AS IRPJ_CSLL,

       (SUM(A.IMPOSTO) + SUM(A.REPASSE_UNI) +
        SUM(A.CUSTOS) + SUM(A.DESP_ADM) +
        SUM(A.DESP_COM) + SUM(A.DESP_OUT)) AS EBIT,

       SUM(A.DEP_AM_EX) AS DEP_AM_EX,

       (SUM(A.IMPOSTO) + SUM(A.REPASSE_UNI) + SUM(A.CUSTOS) + SUM(A.DESP_ADM) +
        SUM(A.DESP_COM) + SUM(A.DESP_OUT) - SUM(A.DEP_AM_EX)) AS EBTIDA,

       SUM(A.AJUSTES + A.AJUSTESPERDA) AS AJUSTES,
       SUM(A.AJUSTES) AS AJUSTES_PERDA,
       SUM(A.AJUSTESPERDA) AS AJUSTES_REPASSE,

       (SUM(A.IMPOSTO) +
        SUM(A.REPASSE_UNI) + SUM(A.CUSTOS) + SUM(A.DESP_ADM) +
        SUM(A.DESP_COM) + SUM(A.DESP_OUT) - SUM(A.DEP_AM_EX) +
        SUM(A.AJUSTES) + SUM(A.AJUSTESPERDA)) AS EBTIDAAJUS,

       SUM(A.IMPOSTO) AS IMPOSTO,
       SUM(A.CUSTOS_SER) AS CUSTOS_SER,
       SUM(A.CUSTOS_IND) AS CUSTOS_IND,
       SUM(A.DESP_COM) AS DESP_COM,
       SUM(A.DESP_ADM) AS DESP_ADM,
       SUM(A.DESP_OUT) AS DESP_OUT,
       SUM(A.REC_FIN) AS REC_FIN,
       SUM(A.DESP_FIN) AS DESP_FIN,
       SUM(A.REPASSE_UNI) AS REPASSE_UNI,
       SUM(A.REPASSE) AS REPASSE

  FROM (SELECT NVL(CUS.AD_CONDOMINIO, 'N') AS AD_CONDOMINIO,
               DRE1.REFERENCIA,
               CUS.CODCENCUS,
               CUS.NROUNICOBP,
               CUS.AD_SKJV2,
               PLA.CTACTB,
               PLA.DESCRCTA,
               DRE1.CODPROJ,
               DRE1.SKJV,
               DRE1.AD_CATEGORIA,
               DRE1.STATUS,
               DRE1.CODDIRETORIA,
               DRE1.DIRETORIA,
               DRE1.CR_NOVO,
               NVL(SUM(DRE1.REC_BRUT_MC), 0) AS REC_BRUT_MC,
               NVL(SUM(DRE1.REC_BRUT_U), 0) AS REC_BRUT_U,
               NVL(SUM(DRE1.IMPOSTO), 0) AS IMPOSTO,
               NVL(SUM(DRE1.CUSTOS), 0) AS CUSTOS,
               NVL(SUM(DRE1.CUSTOS_SER), 0) AS CUSTOS_SER,
               NVL(SUM(DRE1.CUSTOS_IND), 0) AS CUSTOS_IND,
               NVL(SUM(DRE1.DESP_COM), 0) AS DESP_COM,
               NVL(SUM(DRE1.DESP_ADM), 0) AS DESP_ADM,
               NVL(SUM(DRE1.DESP_OUT), 0) AS DESP_OUT,
               NVL(SUM(DRE1.REC_FIN), 0) AS REC_FIN,
               NVL(SUM(DRE1.DESP_FIN), 0) AS DESP_FIN,
               NVL(SUM(DRE1.IR_S_LCR), 0) AS IR_S_LCR,
               NVL(SUM(DRE1.CS_S_LCR), 0) AS CS_S_LCR,
               NVL(SUM(DRE1.IRPJ_CSLL), 0) AS IRPJ_CSLL,
               NVL(SUM(DRE1.DEP_AM_EX), 0)AS DEP_AM_EX,
               NVL(SUM(DRE1.AJUSTES), 0) AS AJUSTES,
               NVL(SUM(DRE1.REPASSE_UNI), 0) AS REPASSE_UNI,
               NVL(SUM(DRE1.REPASSE), 0) AS REPASSE,
               0 AS AJUSTESPERDA,
               DRE1.CODEMP
          
          FROM CND_DRE1 DRE1
               INNER JOIN TSICUS CUS ON CUS.CODCENCUS = DRE1.CODCENCUS
               RIGHT JOIN TCBPLA PLA ON PLA.CTACTB = DRE1.CTACTB

         WHERE (PLA.CTACTB LIKE '3.1.1.01.%'
            OR  PLA.CTACTB LIKE '3.1.1.03.%'
            OR  PLA.CTACTB LIKE '3.1.1.05.%'
            OR  PLA.CTACTB IN ('7.1.1.01.00001', '7.1.1.01.00002','7.1.1.03.00001','7.1.1.03.00002')
            OR  PLA.CTACTB LIKE '4.1.%'
            OR  PLA.CTACTB LIKE '5.1.%'
            OR  PLA.CTACTB LIKE '5.2.%'
            OR  PLA.CTACTB LIKE '5.3.%'
            OR  PLA.CTACTB LIKE '5.4.1.%'
            OR  PLA.CTACTB LIKE '5.4.2.%'
            OR  PLA.CTACTB LIKE '5.5.1.%'
            OR  PLA.CTACTB LIKE '5.5.6.%')
                    
         GROUP BY NVL(CUS.AD_CONDOMINIO, 'N'),
                  DRE1.REFERENCIA,
                  CUS.CODCENCUS,
                  CUS.NROUNICOBP,
                  PLA.CTACTB,
                  PLA.DESCRCTA,
                  CUS.AD_SKJV2,
                  DRE1.CODPROJ,
                  DRE1.SKJV,
                  DRE1.AD_CATEGORIA,
                  DRE1.STATUS,
                  DRE1.CODDIRETORIA,
                  DRE1.DIRETORIA,
                  DRE1.CR_NOVO,
                  DRE1.CODEMP
               
     UNION ALL             
       
        SELECT CUS.AD_CONDOMINIO,
               PER.REF AS REFERENCIA,
               CUS.CODCENCUS,
               CUS.NROUNICOBP,
               CUS.AD_SKJV2,
               '' AS CTACTB,
               OPC.OPCAO AS DESCRCTA,
               0 AS CODPROJ,
               '' AS SKJV,
               CUS.AD_CATEGORIA,
               (SELECT STATUS FROM AD_UNIDADESBPS WHERE NROUNICO = CUS.NROUNICOBP) AS STATUS,
               C.CODDIRETORIA,
               C.DIRETORIA,
               CR.CR_NOVO,
               0 AS REC_BRUT_MC,
               0 AS REC_BRUT_U,
               0 AS IMPOSTO,
               0 AS CUSTOS,
               0 AS CUSTOS_SER,
               0 AS CUSTOS_IND,
               0 AS DESP_COM,
               0 AS DESP_ADM,
               0 AS DESP_OUT,
               0 AS REC_FIN,
               0 AS DESP_FIN,
               0 AS IR_S_LCR,
               0 AS CS_S_LCR,
               0 AS IRPJ_CSLL,
               0 AS DEP_AM_EX,
               0 AS AJUSTES,
               0 AS REPASSE_UNI,
               0 AS REPASSE,
               NVL(SUM(VLR), 0) AS AJUSTESPERDA,
               PER.CODEMP
        
          FROM AD_LANCPER PER
               INNER JOIN TSICUS CUS ON CUS.CODCENCUS = PER.CR
               INNER JOIN TDDOPC OPC ON OPC.VALOR = PER.TIPO AND OPC.NUCAMPO = 9999996744
               INNER JOIN VSICUS_COMP C ON CUS.CODCENCUS = C.CODCENCUS
               INNER JOIN DEPARACR CR ON CR.CODCENCUS = C.CODCENCUS
           
      GROUP BY CUS.AD_CONDOMINIO,
               PER.REF,
               CUS.CODCENCUS,
               CUS.AD_SKJV2,
               CUS.NROUNICOBP,
               OPC.OPCAO,
               CUS.AD_CATEGORIA,
               PER.CODEMP,
               C.CODDIRETORIA,
               C.DIRETORIA,
               CR.CR_NOVO) A

GROUP BY A.AD_CONDOMINIO,
       A.REFERENCIA,
       A.CODCENCUS,
       A.NROUNICOBP,
       A.CTACTB,
       A.DESCRCTA,
       A.AD_SKJV2,
       A.CODPROJ,
       A.SKJV,
       A.AD_CATEGORIA,
       A.CODEMP,
       A.STATUS,
       A.CODDIRETORIA,
       A.DIRETORIA,
       A.CR_NOVO