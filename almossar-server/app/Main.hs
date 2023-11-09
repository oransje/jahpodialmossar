{-# LANGUAGE OverloadedStrings #-}
import Network.Wai
import Network.Wai.Handler.Warp (run)
import Constants

import qualified Handlers

app :: Application
app request respond = do
    respond $
        case rawPathInfo request of
            "/" -> Handlers.index
            _   -> Handlers.notFound 
        

main :: IO ()
main = do
    putStrLn $ "Running almossar at https://localhost:" ++ show port
    run port app