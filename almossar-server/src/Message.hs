{-# LANGUAGE OverloadedStrings #-}
module Message (Message(..), generateAlmossoMessage, notFoundMessage) where

import System.Random (randomRIO)
import Data.Aeson (object, (.=), ToJSON(..))
import qualified Data.Text as T
import Data.Time

import Constants (positiveMessages, negativeMessages, lowerTime, upperTime)

-- Datatype definitions

data Message = Message {
    message :: T.Text,
    time :: LocalTime
}

instance ToJSON Message where
    toJSON (Message m t) =  
        object 
            ["message" .= m
            , "time" .= t
            ]

-- Impure IO code

randomMessage :: [String] -> IO String 
randomMessage messages = do
    index <- randomRIO (0, length messages - 1)
    return (messages !! index)

generateAlmossoMessage :: IO Message
generateAlmossoMessage = do
    t <- getCurrentTime
    tz <- getCurrentTimeZone

    let currentTimeLocal = utcToLocalTime tz t
    let currentTime = localTimeOfDay currentTimeLocal 

    if currentTime >= lowerTime && currentTime <= upperTime then do
        messageStr <- randomMessage positiveMessages
        return $ Message (T.pack messageStr) currentTimeLocal
    else do
        messageStr <- randomMessage negativeMessages
        return $ Message (T.pack messageStr) currentTimeLocal


notFoundMessage :: IO Message
notFoundMessage = do
    t <- getCurrentTime
    tz <- getCurrentTimeZone

    return $ Message "Resource not found" (utcToLocalTime tz t)