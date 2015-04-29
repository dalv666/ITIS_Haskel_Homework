module Task04 where

--Task№1
data BinTree = EmptyBT | Node Int (BinTree) (BinTree) deriving (Show,Eq)
-- intetrp. binary search tree

fnForBinTree :: BinTree -> a
fnForBinTree tree = case tree of
					EmptyBT -> (undefined tree)
					Node _ _ _ -> (undefined tree)

treeSum :: BinTree -> Int
treeSum EmptyBT = 0
treeSum (Node value left right) = value + treeSum left + treeSum right

treeHeight :: BinTree -> Int
treeHeight EmptyBT = 0
treeHeight (Node value left right) = 1 + max (treeHeight left) (treeHeight right)

treeContains :: Int -> BinTree -> Bool
treeContains value EmptyBT = False
treeContains value (Node value1 left right)
	| value == value1 = True
	| value < value1  = treeContains value left
	| value > value1  = treeContains value right
						

--Task№2
data UniBinTree a = Empty | Node1 a (UniBinTree a) (UniBinTree a) deriving (Show, Eq)
--intetrp. generic binary search tree

fnForUniBinTree :: UniBinTree a -> b
fnForUniBinTree tree = case tree of
					Empty -> (undefined tree)
					Node1 _ _ _ -> (undefined tree)

ubTreeHight :: UniBinTree a -> Int
ubTreeHight Empty = 0
ubTreeHight (Node1 a left right) = 1 + max (ubTreeHight left) (ubTreeHight right)

tmap :: (a -> b) -> UniBinTree a -> UniBinTree b
tmap tr Empty = Empty
tmap tr (Node1 value left right) = Node1 (tr value) (tmap tr left) (tmap tr right)



--Task№3
data AList a b = EmptyAD | DList a (AList b a) deriving (Show, Eq)
--intetrp. generic alternate list

fnForAList :: AList a b -> c
fnForAList list = case list of
					EmptyAD -> (undefined list)
					DList _ _ -> (undefined list)

listLenght :: AList a b -> Int
listLenght EmptyAD = 0
listLenght (DList value list) = 1 + listLenght list

dmap :: (a -> c) -> (b -> d) -> AList a b -> AList c d
dmap tr1 tr2 EmptyAD = EmptyAD
dmap tr1 tr2 (DList value list) = DList (tr1 value) (dmap tr2 tr1 list)