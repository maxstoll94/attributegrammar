{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_mf (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/maxstoll94/Desktop/Uni/Compiler_Construction/Monotone-Frameworks/.cabal-sandbox/bin"
libdir     = "/home/maxstoll94/Desktop/Uni/Compiler_Construction/Monotone-Frameworks/.cabal-sandbox/lib/x86_64-linux-ghc-8.0.2/mf-0.1.0.0"
dynlibdir  = "/home/maxstoll94/Desktop/Uni/Compiler_Construction/Monotone-Frameworks/.cabal-sandbox/lib/x86_64-linux-ghc-8.0.2"
datadir    = "/home/maxstoll94/Desktop/Uni/Compiler_Construction/Monotone-Frameworks/.cabal-sandbox/share/x86_64-linux-ghc-8.0.2/mf-0.1.0.0"
libexecdir = "/home/maxstoll94/Desktop/Uni/Compiler_Construction/Monotone-Frameworks/.cabal-sandbox/libexec"
sysconfdir = "/home/maxstoll94/Desktop/Uni/Compiler_Construction/Monotone-Frameworks/.cabal-sandbox/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "mf_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "mf_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "mf_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "mf_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "mf_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "mf_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
