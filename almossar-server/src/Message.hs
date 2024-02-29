{-# LANGUAGE OverloadedStrings #-}
module Message (Message(..)) where

import Data.Aeson (object, (.=), ToJSON(..))
import Data.Text
import Data.Time

data Message = Message {
    emoji :: Text,
    message :: Text,
    timestamp :: UTCTime
}

instance ToJSON Message where
    toJSON (Message e m t) =  
        object 
            ["emoji" .= e
            , "message" .= m
            , "timestamp" .= t
            ]

