module Site (
    module Site.Layout,
    config,
    site,
) where

import Control.Monad ((>=>))
import Hakyll (Compiler, Configuration, Context, Item, Rules, defaultConfiguration, hakyllWith, relativizeUrls)
import Hakyll.Core (withProviderDirectory)
import Hakyll.Web.Extensionless (extensionlessUrls)
import Site.Layout

config :: Configuration
config =
    withProviderDirectory "./site" $
        extensionlessUrls
            defaultConfiguration

site :: Rules a -> IO ()
site = hakyllWith config
