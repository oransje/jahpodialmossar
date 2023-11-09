{-# LANGUAGE OverloadedStrings #-}
module Handlers
    (index,
     notFound
    ) where

import Network.Wai
import Network.HTTP.Types (status200, status404)
import Network.HTTP.Types.Header (hContentType)

index :: Response
index = responseLBS
    status200
    [(hContentType, "text/plain")]
    "To be implemented"

notFound :: Response
notFound = responseLBS
    status404
    [(hContentType, "text/plain")]
    "404 - Resource Not Found"