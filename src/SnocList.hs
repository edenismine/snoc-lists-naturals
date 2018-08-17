{-|
Module      : ListS
Description : Snoc lists representation with a few useful functions built around it.
License     : MIT
Maintainer  : daniel.aragon@ciencias.unam.mx
-}

module ListS(
  ListS,
  headS,
  tailS,
  initS,
  lastS
) where

-- |ListS. Snoc list representation. NilS represent the empty list, and Snoc represents the
--  operator that adds an element to the end of a list.
data ListS a = NilS | Snoc (ListS a) a deriving Show

-- |headS. This function retrieves the first element of the list.
headS :: ListS a -> a
headS list = case list of
  NilS -> error "Empty list"
  (Snoc list' x) -> case list' of
    NilS -> x
    _    -> headS list'

-- |tailS. This function retrieves the list without the first element.
tailS :: ListS a -> ListS a
tailS list = case list of
  NilS -> error "Empty list"
  (Snoc list' x) -> case list' of
    NilS -> NilS
    _    -> Snoc (tailS list') x

-- |initS. This function retrieves the list without the last element.
initS :: ListS a -> ListS a
initS list = case list of
  NilS           -> error "Empty list"
  (Snoc list' _) -> list'

-- |lastS. This function retrieves the last element of the list.
lastS :: ListS a -> a
lastS list = case list of
  NilS       -> error "Empty list"
  (Snoc _ x) -> x
