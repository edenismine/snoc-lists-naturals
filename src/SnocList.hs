{-|
Module      : ListS
Description : Snoc lists representation with a few useful functions built around it
License     : MIT
Author      : Luis Daniel Aragon Bermudez
Maintainer  : daniel.aragon@ciencias.unam.mx
-}

module ListS(
  ListS,
  headS,
  tailS,
  initS,
  lastS,
  nthElementS,
  deleteNthElementS,
  addFirstS,
  addLastS,
  reverseS
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

-- |nthElementS. This function retrieves the n-th element of the list.
nthElementS :: Int -> ListS a -> a
nthElementS _ NilS = error "Invalid index"
nthElementS n list
  | n < 0 = error "Invalid index"
  | n == 0 = headS list
  | otherwise = nthElementS (n-1) (tailS list)

-- |deleteNthElementS. This function retrieves the list without its n-th element.
deleteNthElementS :: Int -> ListS a -> ListS a
deleteNthElementS n NilS = if n < 0 then error "Invalid index" else NilS
deleteNthElementS n list
  | n < 0 = error "Invalid index"
  | n == 0 = tailS list
  | otherwise = addFirstS (headS list) (deleteNthElementS (n-1) (tailS list))

-- |addFirstS. Given an element 'a' and a list 'x', this function retrieves the list
-- 'ax'.
addFirstS :: a -> ListS a -> ListS a
addFirstS x NilS        = Snoc NilS x
addFirstS x (Snoc ys y) = Snoc (addFirstS x ys) y

-- |addLastS. Given an element 'a' and a list 'x', this function retrieves the list
-- 'xa'.
addLastS :: a -> ListS a -> ListS a
addLastS x xs   = Snoc xs x

-- |reverseS. This function reverses a Snoc list.
reverseS :: ListS a -> ListS a
reverseS NilS        = NilS
reverseS (Snoc xs x) = addFirstS x (reverseS xs)
