{-# LANGUAGE OverloadedStrings #-}
module Message 
    (Message(..)
    ) where

import Data.Aeson (object, (.=), ToJSON(..))
import Data.Text
import Data.Time
import Data.Word (Word8)
import System.Random (RandomRIO)

import Constants (positiveMessages)
import Data.Binary (Word8)

data Message = Message {
    message :: Text,
    timestamp :: UTCTime
}

instance ToJSON Message where
    toJSON (Message m t) =  
        object 
            ["message" .= m
            , "timestamp" .= t
            ]

upperLimit :: Word8
upperLimit = flip (-) 1 . length

