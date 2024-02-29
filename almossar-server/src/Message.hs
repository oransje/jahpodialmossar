{-# LANGUAGE OverloadedStrings #-}
module Message 
    (Message(..)
    ) where

import Data.Aeson (object, (.=), ToJSON(..))
import Data.Text
import Data.Time

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

