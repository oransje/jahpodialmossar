{-# LANGUAGE OverloadedStrings #-}
module Handlers
    (index,
     notFound
    ) where

import Network.Wai
import Network.HTTP.Types (status200, status404)
import Network.HTTP.Types.Header (hContentType)
import Data.Aeson

import Message(Message(..))

index :: Message -> Response
index m =
    responseLBS status200 [(hContentType, "application/json")] (encode m)

notFound :: Message -> Response
notFound m =
    responseLBS status404 [(hContentType, "application/json")] (encode m)

