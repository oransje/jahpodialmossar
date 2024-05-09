{-# LANGUAGE OverloadedStrings #-}
module Routes
    (appRoutes
    ) where

import Network.Wai

import Message(generateAlmossoMessage, notFoundMessage)

import qualified Handlers

appRoutes :: Application
appRoutes request respond = do
    case rawPathInfo request of
        "/" ->  do
            m <- generateAlmossoMessage
            respond $ Handlers.index m
        _   -> do
            m <- notFoundMessage
            respond $ Handlers.index m