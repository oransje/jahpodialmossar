{-# LANGUAGE OverloadedStrings #-}
module Message 
    (Message(..)
     , randomMessage
    ) where

import System.Random (randomRIO)
import System.IO.Unsafe (unsafePerformIO)
import Data.Aeson (object, (.=), ToJSON(..))
import qualified Data.Text as T
import Data.Time

data Message = Message {
    message :: T.Text,
    timestamp :: UTCTime
}

instance ToJSON Message where
    toJSON (Message m t) =  
        object 
            ["message" .= m
            , "timestamp" .= t
            ]

randomMessageImpure :: [String] -> IO String 
randomMessageImpure messages = do
    index <- randomRIO (0, length messages - 1)
    return (messages !! index)

randomMessage :: [String] -> String
randomMessage messages = unsafePerformIO $ randomMessageImpure messages