    SELECT
        CUS.CODCENCUS,
        
       CUS.DESCRCENCUS,
        
       CUS.AD_CATEGORIA,
        
       CUS.AD_SKJV2,
        
       CASE 
            WHEN (CUS.CODCENCUS >= 1000000 
            AND CUS.CODCENCUS < 2000000) 
              
            OR (CUS.CODCENCUS LIKE '3%' 
            AND CUS.AD_SKJV2 = 'S') 
              
            OR (CUS.CODCENCUS LIKE '4%')
              
            OR (CUS.CODCENCUS >= 10000000 
            AND CUS.CODCENCUS < 11000000) THEN 24               
            
            WHEN (CUS.CODCENCUS >= 2000000 
            AND CUS.CODCENCUS < 3000000) 
              
            OR (CUS.CODCENCUS LIKE '3%' 
            AND CUS.AD_SKJV2 = 'J') THEN 25              
            
            WHEN (CUS.CODCENCUS >= 5000000 
            AND CUS.CODCENCUS < 6000000) 
              
            OR (CUS.CODCENCUS >= 15000000 
            and CUS.CODCENCUS < 16000000) 
              
            OR CUS.CODCENCUS = 13001000 /*POLO TECNOLOGICO*/
              
            OR (CUS.AD_CATEGORIA = 'O') THEN CUS.NROUNICOBP
       
        END AS NROUNICOBP,
        
       CUS.ATIVO AS CR_ATIVO,
        
       CASE 
            WHEN (CUS.CODCENCUS >= 1000000 
            AND CUS.CODCENCUS < 2000000) 
            OR (CUS.CODCENCUS >= 10000000 
            AND CUS.CODCENCUS < 11000000) THEN 'S'
            
            WHEN (CUS.CODCENCUS >= 2000000 
            AND CUS.CODCENCUS < 3000000) THEN 'J'
            
            WHEN (CUS.CODCENCUS >= 3000000 
            AND CUS.CODCENCUS < 5000000) THEN 'M'
            
            WHEN (CUS.CODCENCUS >= 5000000 
            AND CUS.CODCENCUS < 6000000) 
            OR (CUS.CODCENCUS >= 15000000 
            and CUS.CODCENCUS < 16000000) THEN 'U'
            
            WHEN (CUS.AD_CATEGORIA = 'O') THEN 'O'
       
        END AS TIPO,
        
       CASE 
            WHEN (CUS.CODCENCUS >= 1000000 
            AND CUS.CODCENCUS < 2000000)
              
            OR (CUS.CODCENCUS LIKE '3%' 
            AND CUS.AD_SKJV2 = 'S')
              
            OR (CUS.CODCENCUS LIKE '4%')
              
            OR (CUS.CODCENCUS >= 10000000 
            AND CUS.CODCENCUS < 11000000) THEN 'CENTRAL SANKHYA'
            
            WHEN (CUS.CODCENCUS >= 2000000 
            AND CUS.CODCENCUS < 3000000) 
              
            OR (CUS.CODCENCUS LIKE '3%' 
            AND CUS.AD_SKJV2 = 'J') THEN 'CENTRAL JIVA'
            
            ELSE UNI.DESCRICAO
       
        END AS DESCRICAO,
        
       UNI.ATIVO AS UNI_ATIVO,
        
       UNI.STATUS AS UNI_STATUS,
        
       CASE 
            WHEN TRUNC(CR.CR_NOVO,
            -2) = 10001100 THEN 1 /*PRESIDENCIA*/
            
            WHEN TRUNC(CR.CR_NOVO,
            -2) = 10001200 THEN 2 /*DIR. CRESCIMENTO*/
            
            WHEN TRUNC(CR.CR_NOVO,
            -2) = 10001300 THEN 3 /*DIR. DELIVERY*/
            
            WHEN TRUNC(CR.CR_NOVO,
            -2) = 10001400 THEN 4 /*DIR. TECNOLOGIA*/  
            
            WHEN TRUNC(CR.CR_NOVO,
            -2) = 10001500 THEN 5 /*DIR. DESENVOLVIMENTO DE NEGOCIOS*/
            
            WHEN TRUNC(CR.CR_NOVO,
            -2) = 10001600 
            AND CR.CR_NOVO <> 10001601 THEN 6 /*DIR. FINANCEIRA*/
            
            WHEN TRUNC(CR.CR_NOVO,
            -2) = 10001700 THEN 7 /*DIR. PESSOAS E CULTURA*/
            
            WHEN TRUNC(CR.CR_NOVO,
            -6) = 3000000  THEN 8 /*INVESTIMENTO SK*/
            
            WHEN CR.CR_NOVO = 10001601 THEN 9 /*RECEITAS MATRIZ*/
            
            ELSE 10
       
        END AS CODDIRETORIA,
        
       CASE 
            WHEN TRUNC(CR.CR_NOVO,
            -2) = 10001100 THEN 'PRESIDENCIA'
            
            WHEN TRUNC(CR.CR_NOVO,
            -2) = 10001200 THEN 'DIR. CRESCIMENTO'
            
            WHEN TRUNC(CR.CR_NOVO,
            -2) = 10001300 THEN 'DIR. DELIVERY'
            
            WHEN TRUNC(CR.CR_NOVO,
            -2) = 10001400 THEN 'DIR. TECNOLOGIA'  
            
            WHEN TRUNC(CR.CR_NOVO,
            -2) = 10001500 THEN 'DIR. DESENVOLVIMENTO DE NEGOCIOS'    
            
            WHEN TRUNC(CR.CR_NOVO,
            -2) = 10001600 
            AND CR.CR_NOVO <> 10001601 THEN 'DIR. FINANCEIRA'    
            
            WHEN TRUNC(CR.CR_NOVO,
            -2) = 10001700 THEN 'DIR. PESSOAS E CULTURA'  
            
            WHEN TRUNC(CR.CR_NOVO,
            -6) = 3000000  THEN 'INVESTIMENTO SK'
            
            WHEN CR.CR_NOVO = 10001601 THEN 'RECEITAS MATRIZ'
            
            ELSE 'OUTROS'
       
        END AS DIRETORIA            
  
    FROM
        TSICUS CUS,
        
       DEPARACR CR,
        
       AD_UNIDADESBPS UNI       
 
    WHERE
        CUS.CODCENCUS = CR.CODCENCUS
   
        AND CUS.NROUNICOBP = UNI.NROUNICO
   
        AND CUS.CODCENCUS NOT IN (
            1001100,2001200,5000000,5001000
        )
   
        AND CUS.AD_CATEGORIA IS NOT NULL
 
    ORDER BY
        CODCENCUS