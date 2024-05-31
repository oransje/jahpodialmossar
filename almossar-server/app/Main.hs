{-# LANGUAGE OverloadedStrings #-}
import Network.Wai.Handler.Warp (run)
import Network.Wai.Middleware.Cors (cors)

import Cors
import Constants (port)
import Routes
        
main :: IO ()
main = do
    putStrLn $ "Running almossar at http://localhost:" ++ show port
    run port $ cors corsPolicy appRoutes