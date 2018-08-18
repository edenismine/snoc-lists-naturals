{-|
Module      : Nat
Description : Natural numbers representation using three useful constructors with a few
              functions built around it.
License     : MIT
Author      : Luis Daniel Aragon Bermudez
Maintainer  : daniel.aragon@ciencias.unam.mx
-}

module Nat (
  Nat,
  toNat,
  succN,
  predN,
  addN,
  prodN,
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

-- |succNat. Retrieves the successor of a Nat.
succN :: Nat -> Nat
succN n = case n of
  Zero   -> O Zero
  (D n') -> O n'
  (O n') -> D (succN n')

-- |predNat. Retrieves the predecessor of a Nat.
predN :: Nat -> Nat
predN n = case n of
  Zero     -> error "zero has no predecessor"
  (O Zero) -> Zero
  (O n')   -> D n'
  (D n')   -> O (predN n')

-- |addNat. Retrieves the addition of two Nat's.
addN :: Nat -> Nat -> Nat
addN n1 Zero = n1
addN Zero n2 = n2
addN n1 n2   = succN (n1 `addN` predN n2)

-- |prodN. Retrieves the product of two Nat's.
prodN :: Nat -> Nat -> Nat
prodN _ Zero      = Zero
prodN Zero _      = Zero
prodN n1 (O Zero) = n1
prodN (O Zero) n2 = n2
prodN n1 n2       = (n1 `prodN` predN n2) `addN` n1

{- Auxiliary functions -}

-- |toInt. Retrieves a Nat's Int equivalent.
toInt :: Nat -> Int
toInt n = case n of
  Zero   -> 0
  (D n') -> 2 * toInt n'
  (O n') -> 2 * toInt n' + 1
