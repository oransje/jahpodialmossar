{-# LANGUAGE OverloadedStrings #-}
import Network.Wai.Handler.Warp (run)
import Constants
import Routes
        
main :: IO ()
main = do
    putStrLn $ "Running almossar at https://localhost:" ++ show port
    run port appRoutes