{-# LANGUAGE OverloadedStrings #-}
module Routes
    (appRoutes
    ) where

import Network.Wai
import qualified Handlers

appRoutes :: Application
appRoutes request respond = do
    respond $
        case rawPathInfo request of
            "/" -> Handlers.index
            _   -> Handlers.notFound 