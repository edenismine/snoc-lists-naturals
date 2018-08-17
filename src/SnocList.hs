{-|
Module      : ListS
Description : Scno lists Representation datatype with a few useful functions built around it.
License     : Apache License 2.0
Maintainer  : daniel.aragon@ciencias.unam.mx
-}

module ListS(
  ListS,
  headS,
  tailS
) where

-- |Snoc list datatype. NilS represent the empty list, and Snoc represents the operator that
--  adds an element to the end of a list.
data ListS a = NilS | Snoc (ListS a) a deriving Show


-- |This function retrieves the the first element of the list.
headS :: ListS a -> a
headS list = case list of
  NilS -> error "Empty List"
  (Snoc list' x) -> case list' of
    NilS -> x
    _    -> headS list'

tailS :: ListS a -> ListS a
tailS list = case list of
  NilS -> error "Empty List"
  (Snoc list' x) -> case list' of
    NilS -> NilS
    _    -> Snoc (tailS list') x