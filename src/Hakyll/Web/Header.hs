module Hakyll.Web.Header where

import Data.Binary (Binary)
import Data.Data (Typeable)
import Hakyll (Compiler, Context, Identifier, Rules, compile, getUnderlying, loadAndApplyTemplate, loadBody, setVersion, version)
import Hakyll.Core.Item.Empty (makeEmptyItem)

header :: String
header = "header"

rulesHeader :: Identifier -> (Identifier -> Compiler (Context String)) -> Rules ()
rulesHeader headerTemplate getCtx = version header $ compile $ do
    ident <- getUnderlying
    ctx <- getCtx (setVersion Nothing ident)
    makeEmptyItem
        >>= loadAndApplyTemplate headerTemplate ctx

loadHeader :: (Binary a, Typeable a) => Identifier -> Compiler a
loadHeader ident = loadBody $ setVersion (Just header) ident
