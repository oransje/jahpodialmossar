{-# LANGUAGE OverloadedStrings #-}
module Handlers
    (index,
     notFound
    ) where

import System.IO.Unsafe (unsafePerformIO)
import Network.Wai
import Network.HTTP.Types (status200, status404)
import Network.HTTP.Types.Header (hContentType)
import Data.Time.Clock (getCurrentTime)

import Data.Aeson
import Message

index :: Response
index = responseLBS
    status200
    [(hContentType, "text/plain")]
    "To be implemented"

notFound :: Response
notFound = responseLBS
    status404
    [(hContentType, "application/json")]
    (encode notFoundMessage)

notFoundMessage :: Message
notFoundMessage = Message "Resource not found" (unsafePerformIO getCurrentTime)