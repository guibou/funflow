{-# LANGUAGE FlexibleInstances #-}

module TInstances where

import qualified Data.Text as Text
import Path (Abs, Dir, Path)
import Test.QuickCheck
import TUtils (commonFolderChars, unsafeToAbsDir)

instance Arbitrary (Path Abs Dir) where
    arbitrary = let chars = choose (1,10) >>= (\k -> vectorOf k (elements commonFolderChars))
                in unsafeToAbsDir <$> chars

instance Arbitrary Text.Text where
    arbitrary = Text.pack <$> arbitrary
