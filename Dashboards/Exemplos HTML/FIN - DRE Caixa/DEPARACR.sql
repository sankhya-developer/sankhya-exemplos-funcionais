    SELECT
        CASE 
            WHEN CUS.CODCENCUS IN (1001106,
            2001206)                            THEN 10001201 /*COMERCIAL*/
              
            WHEN CUS.CODCENCUS IN (1001107,
            2001207)                            THEN 10001202 /*MARKETING*/
              
            WHEN CUS.CODCENCUS IN (1001105,
            2001205)                            THEN 10001301 /*CENTRAL DE PROJETOS*/
              
            WHEN CUS.CODCENCUS IN (1001124)                                     THEN 10001302 /*IMPLANTAÇÃO*/
              
            WHEN CUS.CODCENCUS IN (1001104)                                     THEN 10001303 /*SERVICE DESK SANKHYA*/
              
            WHEN CUS.CODCENCUS IN (2001204)                                     THEN 10001304 /*SERVICE DESK JIVA*/
              
            WHEN CUS.CODCENCUS IN (1001129,
            2001224)                            THEN 10001305 /*SUCESSO DO CLIENTE*/
              
            WHEN CUS.CODCENCUS IN (1001103,
            2001203)                            THEN 10001306 /*UNIVERSIDADE*/
              
            WHEN CUS.CODCENCUS IN (1001112,
            1001113,
            2001212,
            2001213,
            1001127) THEN 10001401 /*NÚCLEO SOLUÇÃO*/
              
            WHEN CUS.CODCENCUS IN (1001117,
            1001118,
            1001123,
            2001218,
            2001225) THEN 10001402 /*FOLHA/PDV/IMOB.*/
              
            WHEN CUS.CODCENCUS IN (1001110,
            2001210)                            THEN 10001403 /*TI*/
              
            WHEN CUS.CODCENCUS IN (1001111,
            1001128,
            2001211,
            2001219)          THEN 10001404 /*SOFTWARE*/
              
            WHEN CUS.CODCENCUS IN (1001116)                                     THEN 10001405 /*HOMOLOGAÇÃO/INTEGRAÇÃO*/
              
            WHEN CUS.CODCENCUS IN (1001115,
            1001122,
            2001215,
            2001222)          THEN 10001501 /*INOVAÇÃO*/
              
            WHEN CUS.CODCENCUS IN (2001202,
            2001223,
            1001102,
            2001217)          THEN 10001601 /*ADMINISTRATIVO*/
              
            WHEN CUS.CODCENCUS IN (2001217,
            1001102)                            THEN 10001602 /*FINANCEIRO*/
              
            WHEN CUS.CODCENCUS IN (1001120,
            2001220,
            1001102,
            2001202)          THEN 10001603 /*CONTÁBIL*/
              
            WHEN CUS.CODCENCUS IN (1001114,
            2001214)                            THEN 10001604 /*PROCESSOS*/
              
            WHEN CUS.CODCENCUS IN (1001109,
            2001209)                            THEN 10001605 /*JURÍDICO*/
              
            WHEN CUS.CODCENCUS IN (1001108,
            2001208,
            2001216)                   THEN 10001701 /*RECURSOS HUMANOS*/
              
            WHEN CUS.CODCENCUS IN (1002000)                                     THEN 10002000 /*BP UBERLANDIA*/
              
            WHEN CUS.CODCENCUS IN (1003000)                                     THEN 10003000 /*FILIAL GOIANIA*/
              
            WHEN CUS.CODCENCUS IN (1004000)                                     THEN 10004000 /*BP BRASILIA*/
              
            WHEN CUS.CODCENCUS IN (1007000)                                     THEN 10005000 /*BP BELO HORIZONTE*/
              
            WHEN CUS.CODCENCUS IN (1015000)                                     THEN 10006000 /*BP CAMPINAS*/
              
            WHEN CUS.CODCENCUS IN (1022000)                                     THEN 10007000 /*BP RECIFE*/
              
            WHEN CUS.CODCENCUS IN (1025000)                                     THEN 10008000 /*BP RIO DE JANEIRO*/
              
            WHEN CUS.CODCENCUS IN (1033000)                                     THEN 10009000 /*BP SAO PAULO*/
              
            WHEN CUS.CODCENCUS IN (1041000)                                     THEN 10010000 /*BP ESPIRITO SANTO*/
              
            WHEN CUS.CODCENCUS IN (1048000)                                     THEN 10011000 /*BP SANTA CATARINA*/
              
            WHEN CUS.CODCENCUS IN (1064000)                                     THEN 10012000 /*BP SÃO JOSÉ DOS CAMPOS*/
              
            WHEN CUS.CODCENCUS IN (1065000)                                     THEN 10013000 /*BP RIBEIRÃO PRETO*/
              
            WHEN CUS.CODCENCUS IN (1067000)                                     THEN 10028000 /*BP CURITIBA*/
              
            WHEN CUS.CODCENCUS IN (1072000)                                     THEN 10014000 /*BP PORTO ALEGRE*/
              
            WHEN CUS.CODCENCUS IN (1073000)                                     THEN 10015000 /*BP MANAUS*/
              
            WHEN CUS.CODCENCUS IN (1074000)                                     THEN 10016000 /*BP BELEM*/
              
            WHEN CUS.CODCENCUS IN (1075000)                                     THEN 10017000 /*BP RJ CARIOCA*/
              
            WHEN CUS.CODCENCUS IN (1079000)                                     THEN 10018000 /*BP SP PAULISTA*/
              
            WHEN CUS.CODCENCUS IN (1080000)                                     THEN 10019000 /*BP ABC PAULISTA*/
              
            WHEN CUS.CODCENCUS IN (1081000)                                     THEN 10020000 /*BP BH PAMPULHA*/
              
            WHEN CUS.CODCENCUS IN (1082000)                                     THEN 10021000 /*BP MATO GROSSO DO SUL*/
              
            WHEN CUS.CODCENCUS IN (1083000)                                     THEN 10022000 /*BP MATO GROSSO*/
              
            WHEN CUS.CODCENCUS IN (1098000)                                     THEN 10023000 /*TERCEIROS*/
              
            WHEN CUS.CODCENCUS IN (2003000)                                     THEN 10003000 /*FRANQUIA GOIANIA*/
              
            WHEN CUS.CODCENCUS IN (2022000)                                     THEN 10007000 /*FRANQUIA RECIFE*/
              
            WHEN CUS.CODCENCUS IN (2023000)                                     THEN 10008000 /*FRANQUIA RIO DE JANEIRO*/
              
            WHEN CUS.CODCENCUS IN (2025000)                                     THEN 10008000 /*FRANQUIA RIO DE JANEIRO FILIAL*/
              
            WHEN CUS.CODCENCUS IN (2033000)                                     THEN 10009000 /*FRANQUIA SÃO PAULO*/
              
            WHEN CUS.CODCENCUS IN (2057000)                                     THEN  2057000 /*FRANQUIA RIO GRANDE DO SUL*/
              
            WHEN CUS.CODCENCUS IN (2059000)                                     THEN 10018000 /*FRANQUIA SAO PAULO*/
              
            WHEN CUS.CODCENCUS IN (2064000)                                     THEN 10012000 /*FRANQUIA SAO JOSE DOS CAMPOS*/
              
            WHEN CUS.CODCENCUS IN (2065000)                                     THEN 10013000 /*FRANQUIA RIBEIRÃO PRETO*/
              
            WHEN CUS.CODCENCUS IN (2070000)                                     THEN 10005000 /*FRANQUIA BELO HORIZONTE*/
		    
            WHEN CUS.CODCENCUS IN (2007000)                                     THEN 10005000 /*FRANQUIA BELO HORIZONTE*/
              
            WHEN CUS.CODCENCUS IN (2071000)                                     THEN 10006000 /*FRANQUIA CAMPINAS*/
              
            WHEN CUS.CODCENCUS IN (2072000)                                     THEN 10014000 /*FRANQUIA PORTO ALEGRE*/
              
            WHEN CUS.CODCENCUS IN (2076000)                                     THEN 10002000 /*FRANQUIA UBERLANDIA*/
              
            WHEN CUS.CODCENCUS IN (2077000)                                     THEN 10025000 /*FRANQUIA VITORIA*/
              
            WHEN CUS.CODCENCUS IN (2078000)                                     THEN 10026000 /*FRANQUIA VIRTUAL*/
              
            WHEN CUS.CODCENCUS IN (2083000)                                     THEN 10022000 /*FRANQUIA MATO GROSSO*/
              
            WHEN CUS.CODCENCUS IN (2084000)                                     THEN 10027000 /*FRANQUIA CURITIBA*/
              
            WHEN CUS.CODCENCUS IN (2003000)                                     THEN 10003000 /*FRANQUIA GOIANIA*/
              
            WHEN CUS.CODCENCUS IN (2022000)                                     THEN 10007000 /*FRANQUIA RECIFE*/
              
            WHEN CUS.CODCENCUS IN (2023000)                                     THEN 10008000 /*FRANQUIA RIO DE JANEIRO*/
              
            WHEN CUS.CODCENCUS IN (2025000)                                     THEN 10008000 /*FRANQUIA RIO DE JANEIRO FILIAL*/
              
            WHEN CUS.CODCENCUS IN (2033000)                                     THEN 10009000 /*FRANQUIA SÃO PAULO*/
              
            WHEN CUS.CODCENCUS IN (2057000)                                     THEN  2057000 /*FRANQUIA RIO GRANDE DO SUL*/
              
            WHEN CUS.CODCENCUS IN (2059000)                                     THEN 10018000 /*FRANQUIA SAO PAULO*/
              
            WHEN CUS.CODCENCUS IN (2064000)                                     THEN 10012000 /*FRANQUIA SAO JOSE DOS CAMPOS*/
              
            WHEN CUS.CODCENCUS IN (2065000)                                     THEN 10013000 /*FRANQUIA RIBEIRÃO PRETO*/
              
            WHEN CUS.CODCENCUS IN (2070000)                                     THEN 10005000 /*FRANQUIA BELO HORIZONTE*/
              
            WHEN CUS.CODCENCUS IN (2071000)                                     THEN 10006000 /*FRANQUIA CAMPINAS*/
              
            WHEN CUS.CODCENCUS IN (2072000)                                     THEN 10014000 /*FRANQUIA PORTO ALEGRE*/
              
            WHEN CUS.CODCENCUS IN (2076000)                                     THEN 10002000 /*FRANQUIA UBERLANDIA*/
              
            WHEN CUS.CODCENCUS IN (2077000)                                     THEN 10025000 /*FRANQUIA VITORIA*/
              
            WHEN CUS.CODCENCUS IN (2078000)                                     THEN 10026000 /*FRANQUIA VIRTUAL*/
              
            WHEN CUS.CODCENCUS IN (2083000)                                     THEN 10022000 /*FRANQUIA MATO GROSSO*/
              
            WHEN CUS.CODCENCUS IN (2084000)                                     THEN 10027000 /*FRANQUIA CURITIBA*/
              
            WHEN CUS.CODCENCUS IN (5002101)                                     THEN 15002101 /*COMERCIAL SK UBERLANDIA*/
              
            WHEN CUS.CODCENCUS IN (5002102)                                     THEN 15002102 /*SERVIÇOS SK UBERLANDIA*/
              
            WHEN CUS.CODCENCUS IN (5002103)                                     THEN 15002103 /*ADMINISTRATIVO SK UBERLANDIA*/
              
            WHEN CUS.CODCENCUS IN (5002104)                                     THEN 15002104 /*SUCESSO DO CLIENTE*/
              
            WHEN CUS.CODCENCUS IN (5003101)                                     THEN 15003101 /*COMERCIAL SK GOIANIA*/
              
            WHEN CUS.CODCENCUS IN (5003102)                                     THEN 15003102 /*SERVIÇOS SK GOIANIA*/
              
            WHEN CUS.CODCENCUS IN (5003103)                                     THEN 15003103 /*ADMINISTRATIVO SK GOIANIA*/
              
            WHEN CUS.CODCENCUS IN (5003104)                                     THEN 15003104 /*SUCESSO DO CLIENTE*/
              
            WHEN CUS.CODCENCUS IN (5003201)                                     THEN 15003101 /*COMERCIAL JV GOIANIA*/
              
            WHEN CUS.CODCENCUS IN (5003202)                                     THEN 15003102 /*SERVIÇOS JV GOIANIA*/
              
            WHEN CUS.CODCENCUS IN (5003203)                                     THEN 15003103 /*ADMINISTRATIVO JV GOIANIA*/
              
            WHEN CUS.CODCENCUS IN (5004101)                                     THEN 15004101 /*COMERCIAL SK BRASILIA*/
              
            WHEN CUS.CODCENCUS IN (5004102)                                     THEN 15004102 /*SERVIÇOS SK BRASILIA*/
              
            WHEN CUS.CODCENCUS IN (5004103)                                     THEN 15004103 /*ADMINISTRATIVO SK BRASILIA*/
              
            WHEN CUS.CODCENCUS IN (5004104)                                     THEN 15004104 /*SUCESSO DO CLIENTE*/
              
            WHEN CUS.CODCENCUS IN (5007101)                                     THEN 15005101 /*COMERCIAL SK BELO HORIZONTE*/
              
            WHEN CUS.CODCENCUS IN (5007102)                                     THEN 15005102 /*SERVIÇOS SK BELO HORIZONTE*/
              
            WHEN CUS.CODCENCUS IN (5007103)                                     THEN 15005103 /*ADMINISTRATIVO SK BELO HORIZONTE*/
              
            WHEN CUS.CODCENCUS IN (5007104)                                     THEN 15005104 /*SUCESSO DO CLIENTE*/
              
            WHEN CUS.CODCENCUS IN (5015101)                                     THEN 15006101 /*COMERCIAL SK CAMPINAS*/
              
            WHEN CUS.CODCENCUS IN (5015102)                                     THEN 15006102 /*SERVIÇOS SK CAMPINAS*/
              
            WHEN CUS.CODCENCUS IN (5015103)                                     THEN 15006103 /*ADMINISTRATIVO SK CAMPINAS*/
              
            WHEN CUS.CODCENCUS IN (5015104)                                     THEN 15006104 /*SUCESSO DO CLIENTE*/
              
            WHEN CUS.CODCENCUS IN (5022101)                                     THEN 15007101 /*COMERCIAL SK RECIFE*/
              
            WHEN CUS.CODCENCUS IN (5022102)                                     THEN 15007102 /*SERVIÇOS SK RECIFE*/
              
            WHEN CUS.CODCENCUS IN (5022103)                                     THEN 15007103 /*ADMINISTRATIVO SK RECIFE*/
              
            WHEN CUS.CODCENCUS IN (5022104)                                     THEN 15007104 /*SUCESSO DO CLIENTE*/
              
            WHEN CUS.CODCENCUS IN (5022201)                                     THEN 15007101 /*COMERCIAL JV RECIFE*/
              
            WHEN CUS.CODCENCUS IN (5022202)                                     THEN 15007102 /*SERVIÇOS JV RECIFE*/
              
            WHEN CUS.CODCENCUS IN (5022203)                                     THEN 15007103 /*ADMINISTRATIVO JV RECIFE*/
              
            WHEN CUS.CODCENCUS IN (5023101)                                     THEN 15008101 /*COMERCIAL SK RIO DE JANEIRO W*/
              
            WHEN CUS.CODCENCUS IN (5023102)                                     THEN 15008102 /*SERVIÇOS SK RIO DE JANEIRO W*/
              
            WHEN CUS.CODCENCUS IN (5023103)                                     THEN 15008103 /*ADMINISTRATIVO SK RIO DE JANEIRO W*/
              
            WHEN CUS.CODCENCUS IN (5023104)                                     THEN 15008104 /*SUCESSO DO CLIENTE*/
              
            WHEN CUS.CODCENCUS IN (5023201)                                     THEN 15008101 /*COMERCIAL JV RIO DE JANEIRO*/
              
            WHEN CUS.CODCENCUS IN (5023202)                                     THEN 15008102 /*SERVIÇOS JV RIO DE JANEIRO*/
              
            WHEN CUS.CODCENCUS IN (5023203)                                     THEN 15008103 /*ADMINISTRATIVO JV RIO DE JANEIRO*/
              
            WHEN CUS.CODCENCUS IN (5025101)                                     THEN 15008101 /*COMERCIAL SK RIO DE JANEIRO*/
              
            WHEN CUS.CODCENCUS IN (5025102)                                     THEN 15008102 /*SERVIÇOS SK RIO DE JANEIRO*/
              
            WHEN CUS.CODCENCUS IN (5025103)                                     THEN 15008103 /*ADMINISTRATIVO SK RIO DE JANEIRO*/
              
            WHEN CUS.CODCENCUS IN (5025104)                                     THEN 15008104 /*SUCESSO DO CLIENTE*/
              
            WHEN CUS.CODCENCUS IN (5033101)                                     THEN 15009101 /*COMERCIAL SK SAO PAULO*/
              
            WHEN CUS.CODCENCUS IN (5033102)                                     THEN 15009102 /*SERVIÇOS SK SAO PAULO*/
              
            WHEN CUS.CODCENCUS IN (5033103)                                     THEN 15009103 /*ADMINISTRATIVO SK SAO PAULO*/
              
            WHEN CUS.CODCENCUS IN (5033104)                                     THEN 15009104 /*SUCESSO DO CLIENTE*/
              
            WHEN CUS.CODCENCUS IN (5033201)                                     THEN 15009101 /*COMERCIAL JV SAO PAULO*/
              
            WHEN CUS.CODCENCUS IN (5033202)                                     THEN 15009102 /*SERVIÇOS JV SAO PAULO*/
              
            WHEN CUS.CODCENCUS IN (5033203)                                     THEN 15009103 /*ADMINISTRATIVO JV SAO PAULO*/
              
            WHEN CUS.CODCENCUS IN (5041101)                                     THEN 15010101 /*COMERCIAL SK ESPIRITO SANTO*/
              
            WHEN CUS.CODCENCUS IN (5041102)                                     THEN 15010102 /*SERVIÇOS SK ESPIRITO SANTO*/
              
            WHEN CUS.CODCENCUS IN (5041103)                                     THEN 15010103 /*ADMINISTRATIVO SK ESPIRITO SANTO*/
              
            WHEN CUS.CODCENCUS IN (5041104)                                     THEN 15010104 /*SUCESSO DO CLIENTE*/
              
            WHEN CUS.CODCENCUS IN (5048101)                                     THEN 15011101 /*COMERCIAL SK SANTA CATARINA*/
              
            WHEN CUS.CODCENCUS IN (5048102)                                     THEN 15011102 /*SERVIÇOS SK SANTA CATARINA*/
              
            WHEN CUS.CODCENCUS IN (5048103)                                     THEN 15011103 /*ADMINISTRATIVO SK SANTA CATARINA*/
              
            WHEN CUS.CODCENCUS IN (5048104)                                     THEN 15011104 /*SUCESSO DO CLIENTE*/
              
            WHEN CUS.CODCENCUS IN (5057104)                                     THEN  5057104 /*SUCESSO DO CLIENTE*/
              
            WHEN CUS.CODCENCUS IN (5057201)                                     THEN  5057201 /*COMERCIAL JV RIO GRANDE DO SUL*/
              
            WHEN CUS.CODCENCUS IN (5057202)                                     THEN  5057202 /*SERVIÇOS JV RIO GRANDE DO SUL*/
              
            WHEN CUS.CODCENCUS IN (5057203)                                     THEN  5057203 /*ADMINISTRATIVO JV RIO GRANDE DO SUL*/
              
            WHEN CUS.CODCENCUS IN (5059101)                                     THEN 15018101 /*COMERCIAL SK SAO PAULO*/
              
            WHEN CUS.CODCENCUS IN (5059102)                                     THEN 15018102 /*SERVIÇOS SK SAO PAULO */
              
            WHEN CUS.CODCENCUS IN (5059103)                                     THEN 15018103 /*ADMINISTRATIVO SK SAO PAULO*/
              
            WHEN CUS.CODCENCUS IN (5059104)                                     THEN 15018104 /*SUCESSO DO CLIENTE*/
              
            WHEN CUS.CODCENCUS IN (5059201)                                     THEN 15018101 /*COMERCIAL JV SAO PAULO*/
              
            WHEN CUS.CODCENCUS IN (5059202)                                     THEN 15018102 /*SERVIÇOS JV SAO PAULO */
              
            WHEN CUS.CODCENCUS IN (5059203)                                     THEN 15018103 /*ADMINISTRATIVO JV SAO PAULO*/
              
            WHEN CUS.CODCENCUS IN (5064101)                                     THEN 15012101 /*COMERCIAL SK SAO JOSE DOS CAMPOS*/
              
            WHEN CUS.CODCENCUS IN (5064102)                                     THEN 15012102 /*SERVIÇOS SK SAO JOSE DOS CAMPOS*/
              
            WHEN CUS.CODCENCUS IN (5064103)                                     THEN 15012103 /*ADMINISTRATIVO SK SAO JOSE DOS CAMPOS*/
              
            WHEN CUS.CODCENCUS IN (5064104)                                     THEN 15012104 /*SUCESSO DO CLIENTE*/
              
            WHEN CUS.CODCENCUS IN (5064201)                                     THEN 15012101 /*COMERCIAL JV SAO JOSE DOS CAMPOS*/
              
            WHEN CUS.CODCENCUS IN (5064202)                                     THEN 15012102 /*SERVIÇOS JV SAO JOSE DOS CAMPOS*/
              
            WHEN CUS.CODCENCUS IN (5064203)                                     THEN 15012103 /*ADMINISTRATIVO JV SAO JOSE DOS CAMPOS*/
              
            WHEN CUS.CODCENCUS IN (5065101)                                     THEN 15013101 /*COMERCIAL SK RIBEIRAO PRETO*/
              
            WHEN CUS.CODCENCUS IN (5065102)                                     THEN 15013102 /*SERVIÇOS SK RIBEIRAO PRETO*/
              
            WHEN CUS.CODCENCUS IN (5065103)                                     THEN 15013103 /*ADMINISTRATIVO SK RIBEIRAO PRETO*/
              
            WHEN CUS.CODCENCUS IN (5065104)                                     THEN 15013104 /*SUCESSO DO CLIENTE*/
              
            WHEN CUS.CODCENCUS IN (5065201)                                     THEN 15013101 /*COMERCIAL JV RIBEIRAO PRETO*/
              
            WHEN CUS.CODCENCUS IN (5065202)                                     THEN 15013102 /*SERVIÇOS JV RIBEIRAO PRETO*/
              
            WHEN CUS.CODCENCUS IN (5065203)                                     THEN 15013103 /*ADMINISTRATIVO JV RIBEIRAO PRETO*/
              
            WHEN CUS.CODCENCUS IN (5067101)                                     THEN 15028101 /*COMERCIAL SK CURITIBA*/
              
            WHEN CUS.CODCENCUS IN (5067102)                                     THEN 15028102 /*SERVIÇOS SK CURITIBA*/
              
            WHEN CUS.CODCENCUS IN (5067103)                                     THEN 15028103 /*ADMINISTRATIVO SK CURITIBA*/
              
            WHEN CUS.CODCENCUS IN (5067104)                                     THEN 15028104 /*SUCESSO DO CLIENTE*/
              
            WHEN CUS.CODCENCUS IN (5070101)                                     THEN 15005101 /*COMERCIAL SK BELO HORIZONTE*/
              
            WHEN CUS.CODCENCUS IN (5070102)                                     THEN 15005102 /*SERVIÇOS SK BELO HORIZONTE*/
              
            WHEN CUS.CODCENCUS IN (5070103)                                     THEN 15005103 /*ADMINISTRATIVO SK BELO HORIZONTE*/
              
            WHEN CUS.CODCENCUS IN (5070201)                                     THEN 15005104 /*COMERCIAL JV BELO HORIZONTE*/
              
            WHEN CUS.CODCENCUS IN (5070202)                                     THEN 15005102 /*SERVIÇOS JV BELO HORIZONTE*/
              
            WHEN CUS.CODCENCUS IN (5070203)                                     THEN 15005103 /*ADMINISTRATIVO JV BELO HORIZONTE*/
              
            WHEN CUS.CODCENCUS IN (5071101)                                     THEN 15006101 /*COMERCIAL SK CAMPINAS*/
              
            WHEN CUS.CODCENCUS IN (5071102)                                     THEN 15006102 /*SERVIÇOS SK CAMPINAS*/
              
            WHEN CUS.CODCENCUS IN (5071103)                                     THEN 15006103 /*ADMINISTRATIVO SK CAMPINAS*/
              
            WHEN CUS.CODCENCUS IN (5071104)                                     THEN 15006104 /*SUCESSO DO CLIENTE*/
              
            WHEN CUS.CODCENCUS IN (5071201)                                     THEN 15006101 /*COMERCIAL JV CAMPINAS*/
              
            WHEN CUS.CODCENCUS IN (5071202)                                     THEN 15006102 /*SERVIÇOS JV CAMPINAS*/
              
            WHEN CUS.CODCENCUS IN (5071203)                                     THEN 15006103 /*ADMINISTRATIVO JV CAMPINAS*/
              
            WHEN CUS.CODCENCUS IN (5072101)                                     THEN 15014101 /*COMERCIAL SK PORTO ALEGRE*/
              
            WHEN CUS.CODCENCUS IN (5072102)                                     THEN 15014102 /*SERVIÇOS SK PORTO ALEGRE*/
              
            WHEN CUS.CODCENCUS IN (5072103)                                     THEN 15014103 /*ADMINISTRATIVO SK PORTO ALEGRE*/
              
            WHEN CUS.CODCENCUS IN (5072104)                                     THEN 15014104 /*SUCESSO DO CLIENTE*/
              
            WHEN CUS.CODCENCUS IN (5072201)                                     THEN 15014101 /*COMERCIAL JV PORTO ALEGRE*/
              
            WHEN CUS.CODCENCUS IN (5072202)                                     THEN 15014102 /*SERVIÇOS JV PORTO ALEGRE*/
              
            WHEN CUS.CODCENCUS IN (5072203)                                     THEN 15014103 /*ADMINISTRATIVO JV PORTO ALEGRE*/
              
            WHEN CUS.CODCENCUS IN (5073101)                                     THEN 15015101 /*COMERCIAL SK MANAUS*/
              
            WHEN CUS.CODCENCUS IN (5073101)                                     THEN 15015102 /*SERVIÇOS SK MANAUS*/
              
            WHEN CUS.CODCENCUS IN (5073103)                                     THEN 15015103 /*ADMINISTRATIVO SK MANAUS*/
              
            WHEN CUS.CODCENCUS IN (5073104)                                     THEN 15015104 /*SUCESSO DO CLIENTE*/
              
            WHEN CUS.CODCENCUS IN (5074101)                                     THEN 15016101 /*COMERCIAL SK BELEM*/
              
            WHEN CUS.CODCENCUS IN (5074102)                                     THEN 15016102 /*SERVIÇOS SK BELEM*/
              
            WHEN CUS.CODCENCUS IN (5074103)                                     THEN 15016103 /*ADMINISTRATIVO SK BELEM*/
              
            WHEN CUS.CODCENCUS IN (5074104)                                     THEN 15016104 /*SUCESSO DO CLIENTE*/
              
            WHEN CUS.CODCENCUS IN (5075101)                                     THEN 15017101 /*COMERCIAL SK RJ CARIOCA*/
              
            WHEN CUS.CODCENCUS IN (5075102)                                     THEN 15017102 /*SERVIÇOS SK RJ CARIOCA*/
              
            WHEN CUS.CODCENCUS IN (5075103)                                     THEN 15017103 /*ADMINISTRATIVO SK RJ CARIOCA*/
              
            WHEN CUS.CODCENCUS IN (5075104)                                     THEN 15017104 /*SUCESSO DO CLIENTE*/
              
            WHEN CUS.CODCENCUS IN (5076101)                                     THEN 15002101 /*COMERCIAL SK UBERLANDIA */
              
            WHEN CUS.CODCENCUS IN (5076102)                                     THEN 15002102 /*SERVIÇOS SK UBERLANDIA */
              
            WHEN CUS.CODCENCUS IN (5076103)                                     THEN 15002103 /*ADMINISTRATIVO SK UBERLANDIA */
              
            WHEN CUS.CODCENCUS IN (5076104)                                     THEN 15002104 /*SUCESSO DO CLIENTE*/
              
            WHEN CUS.CODCENCUS IN (5076201)                                     THEN 15002101 /*COMERCIAL JV UBERLANDIA */
              
            WHEN CUS.CODCENCUS IN (5076202)                                     THEN 15002102 /*SERVIÇOS JV UBERLANDIA */
              
            WHEN CUS.CODCENCUS IN (5076203)                                     THEN 15002103 /*ADMINISTRATIVO JV UBERLANDIA */
              
            WHEN CUS.CODCENCUS IN (5077101)                                     THEN 15025101 /*COMERCIAL SK VITORIA*/
              
            WHEN CUS.CODCENCUS IN (5077102)                                     THEN 15025102 /*SERVIÇOS SK VITORIA*/
              
            WHEN CUS.CODCENCUS IN (5077103)                                     THEN 15025103 /*ADMINISTRATIVO JV VITORIA*/
              
            WHEN CUS.CODCENCUS IN (5077104)                                     THEN 15025104 /*SUCESSO DO CLIENTE VITORIA SK JV*/
              
            WHEN CUS.CODCENCUS IN (5077201)                                     THEN 15025101 /*COMERCIAL JV VITORIA*/
              
            WHEN CUS.CODCENCUS IN (5077202)                                     THEN 15025102 /*SERVIÇOS JV VITORIA*/
              
            WHEN CUS.CODCENCUS IN (5077203)                                     THEN 15025103 /*ADMINISTRATIVO JV VITORIA*/
              
            WHEN CUS.CODCENCUS IN (5078101)                                     THEN 15026101 /*COMERCIAL SK VIRTUAL*/
              
            WHEN CUS.CODCENCUS IN (5078102)                                     THEN 15026102 /*SERVIÇOS SK VIRTUAL*/
              
            WHEN CUS.CODCENCUS IN (5078103)                                     THEN 15026103 /*ADMINISTRATIVO SK VIRTUAL*/
              
            WHEN CUS.CODCENCUS IN (5078104)                                     THEN 15026104 /*SUCESSO DO CLIENTE VIRTUAL*/
              
            WHEN CUS.CODCENCUS IN (5078201)                                     THEN 15026101 /*COMERCIAL JV VIRTUAL*/
              
            WHEN CUS.CODCENCUS IN (5078202)                                     THEN 15026102 /*SERVIÇOS JV VIRTUAL*/
              
            WHEN CUS.CODCENCUS IN (5078203)                                     THEN 15026103 /*ADMINISTRATIVO JV VIRTUAL*/
              
            WHEN CUS.CODCENCUS IN (5079101)                                     THEN 15018101 /*COMERCIAL SK SP PAULISTA*/
              
            WHEN CUS.CODCENCUS IN (5079102)                                     THEN 15018102 /*SERVIÇOS SK SP PAULISTA*/
              
            WHEN CUS.CODCENCUS IN (5079103)                                     THEN 15018103 /*ADMNINISTRATIVO SK SP PAULISTA*/
              
            WHEN CUS.CODCENCUS IN (5079104)                                     THEN 15018104 /*SUCESSO DO CLIENTE SP PAULISTA*/
              
            WHEN CUS.CODCENCUS IN (5080101)                                     THEN 15019101 /*COMERCIAL SK ABC PAULISTA*/
              
            WHEN CUS.CODCENCUS IN (5080102)                                     THEN 15019102 /*SERVIÇOS SK ABC PAULISTA*/
              
            WHEN CUS.CODCENCUS IN (5080103)                                     THEN 15019103 /*ADMINISTRATIVO SK ABC PAULISTA*/
              
            WHEN CUS.CODCENCUS IN (5080104)                                     THEN 15019104 /*SUCESSO DO CLIENTE ABC PAULISTA*/
              
            WHEN CUS.CODCENCUS IN (5081101)                                     THEN 15020101 /*COMERCIAL SK BH PAMPULHA*/
              
            WHEN CUS.CODCENCUS IN (5081102)                                     THEN 15020102 /*SERVIÇOS SK BH PAMPULHA*/
              
            WHEN CUS.CODCENCUS IN (5081103)                                     THEN 15020103 /*ADMINISTRATIVO SK BH PAMPULHA*/
              
            WHEN CUS.CODCENCUS IN (5081104)                                     THEN 15020104 /*SUCESSO DO CLIENTE BH PAMPULHA*/
              
            WHEN CUS.CODCENCUS IN (5082101)                                     THEN 15021101 /*COMERCIAL SK MATO GROSSO DO SUL*/
              
            WHEN CUS.CODCENCUS IN (5082102)                                     THEN 15021102 /*SERVIÇOS SK MATO GROSSO DO SUL*/
              
            WHEN CUS.CODCENCUS IN (5082103)                                     THEN 15021103 /*ADMINISTRATIVO SK MATO GROSSO DO SUL*/
              
            WHEN CUS.CODCENCUS IN (5082104)                                     THEN 15021104 /*SUCESSO DO CLIENTE MATO GROSSO DO SUL*/
              
            WHEN CUS.CODCENCUS IN (5083101)                                     THEN 15022101 /*COMERCIAL SK MATO GROSSO*/
              
            WHEN CUS.CODCENCUS IN (5083102)                                     THEN 15022102 /*SERVIÇO SK MATO GROSSO*/
              
            WHEN CUS.CODCENCUS IN (5083103)                                     THEN 15022103 /*ADMINISTRATIVO SK MATO GROSSO*/
              
            WHEN CUS.CODCENCUS IN (5083104)                                     THEN 15022104 /*SUCESSO DO CLIENTE MATO GROSSO*/
              
            WHEN CUS.CODCENCUS IN (5083201)                                     THEN 15022101 /*COMERCIAL JV MATO GROSSO*/
              
            WHEN CUS.CODCENCUS IN (5083202)                                     THEN 15022102 /*SERVIÇOS JV MATO GROSSO*/
              
            WHEN CUS.CODCENCUS IN (5083203)                                     THEN 15022103 /*ADMINISTRATIVO JV MATO GROSSO*/
              
            WHEN CUS.CODCENCUS IN (5084101)                                     THEN 15027101 /*COMERCIAL SK CURITIBA*/
              
            WHEN CUS.CODCENCUS IN (5084102)                                     THEN 15027102 /*SERVIÇOS SK CURITIBA*/
              
            WHEN CUS.CODCENCUS IN (5084103)                                     THEN 15027103 /*ADMINISTRATIVO SK CURITIBA*/
              
            WHEN CUS.CODCENCUS IN (5084104)                                     THEN 15027104 /*SUCESSO DO CLIENTE CURITIBA*/
              
            WHEN CUS.CODCENCUS IN (5084201)                                     THEN 15027101 /*COMERCIAL JV CURITIBA*/
              
            WHEN CUS.CODCENCUS IN (5084202)                                     THEN 15027102 /*SERVIÇOS JV CURITIBA*/
              
            WHEN CUS.CODCENCUS IN (5084203)                                     THEN 15027103 /*ADMINISTRATIVO JV CURITIBA*/
              
            WHEN CUS.CODCENCUS IN (10001403)                                    THEN 10001505 /*TI*/
              
            WHEN CUS.CODCENCUS IN (10001402)                                    THEN 10001504 /*FOLHA*/
              
            WHEN CUS.CODCENCUS IN (10001604)                                    THEN 10001705 /*PROCESSOS*/
              
            WHEN CUS.CODCENCUS IN (10001308)                                    THEN 10001205 /*ESTRUTURAÇÃO DE CANAIS*/
              
            WHEN CUS.CODCENCUS IN (10001302)                                    THEN 10001301 /*ZIMPLANTAÇÃO*/
              
            WHEN CUS.CODCENCUS IN (10001405)                                    THEN 10001503 /*ZHOMOLOGAÇÃO/INTEGRAÇÃOO*/
              
            WHEN CUS.CODCENCUS BETWEEN 10000000 AND 11000000 
            OR CUS.CODCENCUS BETWEEN 15000000 AND 16000000 THEN CUS.CODCENCUS
              
            ELSE CUS.CODCENCUS
         
        END AS CR_NOVO,
        
        CUS.CODCENCUS
   
    FROM
        TSICUS CUS