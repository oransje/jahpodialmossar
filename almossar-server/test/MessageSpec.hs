{-# LANGUAGE OverloadedStrings #-}
module MessageSpec (spec) where

import Test.Hspec
import Data.Aeson
import Data.Time
import Message

spec :: Spec
spec = do
    describe "JSON encoding of Message" $ do
        it "encodes a Message correctly" $ do
            let actual = toJSON $ Message "cacete" ( read "2022-02-28 12:00:00 UTC" :: UTCTime )
            let expected = "{\"message\":\"cacete\",\"timestamp\":\"2022-02-28T12:00:00Z\"}"

            encode actual `shouldBe` expected
