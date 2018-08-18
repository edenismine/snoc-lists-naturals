{-|
Module      : Nat
Description : Natural numbers representation using three useful constructors with a few
              useful functions built around it.
License     : MIT
Author      : Luis Daniel Aragon Bermudez
Maintainer  : daniel.aragon@ciencias.unam.mx
-}

module Nat (
  Nat
) where

-- |Nat. Natural numbers representation using three useful constructors. Zero represents
-- the number 0, Dx represents '2x' and Ox represents '2x + 1' .
data Nat = Zero | D Nat | O Nat deriving Show
