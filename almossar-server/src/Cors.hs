module Cors (
    corsPolicy
) where

import Network.Wai (Request)
import Network.Wai.Middleware.Cors 
import Network.HTTP.Types (methodGet)

corsPolicy :: Request -> Maybe CorsResourcePolicy
corsPolicy _ = Just simpleCorsResourcePolicy
  { corsOrigins = Nothing  
  , corsMethods = [methodGet]           
  }
