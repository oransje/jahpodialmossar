module Constants 
    ( port
      , positiveMessages
      , negativeMessages
    ) where

port :: Int
port = 80

positiveMessages :: [String]
positiveMessages = [ "\128482\&65039A. Ross \127468\127463Fae John \127464\127463Fran Goo \127470\127477A. Milanesa \127480\127470Salah Da \128488\&8205\127909I. Pim \127463\127473Far-oh Far \127472\127473Koo Ka Kola \127477\127479Osuko \127478\127474 Güa r ahn \127464\127467Le Fan Ta Uva\nReservas: \127477\127474Lan Shin Datard \127480\127469Paul Jim \127477\127470Le Pavet o Pa Coo mer \127479\127467Fei Joo Ada \127478\127479Guaravic", "Tá liberado!" , "É oficial. Já pode al mossar." , "Não sei. Fui ao mossar, deixa seu recado!" , "Pelo que eu sabo, já pode ao mossar" ]

negativeMessages :: [String]
negativeMessages = [ "Infelizmente não da pra mossar, tome um toddy.", "Aguarde a hora certa linda", "da nao muleke" ]