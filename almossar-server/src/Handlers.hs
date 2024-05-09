{-# LANGUAGE OverloadedStrings #-}
module Handlers
    (index,
     notFound
    ) where


import System.IO.Unsafe (unsafePerformIO)
import Network.Wai
import Network.HTTP.Types (status200, status404)
import Network.HTTP.Types.Header (hContentType)
import Data.Aeson
import Message

import Data.Time.LocalTime
import Data.Time.Clock
import Data.Text (pack)

import Constants(positiveMessages, negativeMessages)

index :: Response
index = responseLBS
    status200
    [(hContentType, "application/json")] 
    (encode (generateMessage (unsafePerformIO getCurrentTime)))

generateMessage :: UTCTime -> Message
generateMessage time = 
    if currentTime >= lower && currentTime <= upper then
        youCanLunchNow time
    else
        cannotLunchNow time
    where
        currentTime = localTimeOfDay $ utcToLocalTime utc time
        lower = TimeOfDay 11 0 0
        upper = TimeOfDay 14 0 0

youCanLunchNow :: UTCTime -> Message
youCanLunchNow = Message (pack (randomMessage positiveMessages))

cannotLunchNow :: UTCTime -> Message
cannotLunchNow = Message (pack (randomMessage negativeMessages))

notFound :: Response
notFound = responseLBS
    status404
    [(hContentType, "application/json")]
    (encode notFoundMessage)

notFoundMessage :: Message
notFoundMessage = Message "Resource not found" (unsafePerformIO getCurrentTime)
