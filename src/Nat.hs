{-|
Module      : Nat
Description : Natural numbers representation using three useful constructors with a few
              useful functions built around it.
License     : MIT
Author      : Luis Daniel Aragon Bermudez
Maintainer  : daniel.aragon@ciencias.unam.mx
-}

module Nat (
  Nat,
  toNat,
  succN,
  toInt
) where

-- |Nat. Natural numbers representation using three useful constructors. Zero represents
-- the number 0, Dx represents '2x' and Ox represents '2x + 1' .
data Nat = Zero | D Nat | O Nat deriving Show

-- |toNat. Retrieves an Int's Nat equivalent.
toNat :: Int -> Nat
toNat n
  | n <  0 = error "not a natural number"
  | n == 0 = Zero
  | otherwise =
    if n `mod` 2 == 0 then D (toNat (n `quot` 2)) else O (toNat ((n - 1) `quot` 2))

-- |succNat. Retrieves the succesor of a Nat.
succN :: Nat -> Nat
succN n = case n of
  Zero   -> O Zero
  (D n') -> O n'
  (O n') -> D (succN n')


{- Auxiliary functions -}

-- |toInt. Retrieves a Nat's Int equivalent.
toInt :: Nat -> Int
toInt n = case n of
  Zero   -> 0
  (D n') -> 2 * toInt n'
  (O n') -> 2 * toInt n' + 1
