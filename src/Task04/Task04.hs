module Task04 where

data BSTree = BNil | Node { value::Int, leftValue::BSTree, rightValue::BSTree}


bsTreeSum :: BSTree -> Int
bsTreeSum BNil = 0
bsTreeSum tree = bsTreeSum((leftValue tree)) + bsTreeSum((rightValue tree)) + (value tree)


bsTreeHight :: BSTree -> Int
bsTreeHight BNil = 0
bsTreeHight tree = 1 + max (bsTreeHight (rightValue tree)) (bsTreeHight (leftValue tree))

bsTreeContains :: BSTree -> Int -> Bool
bsTreeContains BNil val = False
bsTreeContains tree val = bsTreeContains (rightValue tree) val || bsTreeContains (leftValue tree) val || val == (value tree)
						

data UBSTree a = UBNil | UNode { uvalue::a, uleftValue::UBSTree a, urightValue::UBSTree a}

ubsTreeHight :: (UBSTree a) -> Int
ubsTreeHight UBNil = 0
ubsTreeHight tree = 1 + max (ubsTreeHight (urightValue tree)) (ubsTreeHight (uleftValue tree))

tmap :: (UBSTree a) -> (a->b) -> (UBSTree b)
tmap UBNil trans = UBNil
tmap (UNode val left right) trans = (UNode (trans val) (tmap left trans) (tmap right trans))



data Alternate a b = ALNull | ANode { avalue::a , nextB::Alternate b a} | BNode { bvalue::b , nextA::Alternate a b}
alternateLenght :: (Alternate a b) -> Int
alternateLenght ALNull = 0
alternateLenght (ANode a nextB) = 1 + alternateLenght nextB
alternateLenght (BNode a nextA) = 1 + alternateLenght nextA

--Why it's not work?
dmap :: (Alternate a b) -> (a->c) -> (b->d) -> (Alternate c d)
dmap ALNull _ _ = ALNull
--dmap (ANode avalue nextB) tr1 tr2 = (ANode (tr1 avalue) (dmap nextB tr1 tr2))
--dmap (BNode bvalue nextA) tr1 tr2 = (BNode (tr2 bvalue) (dmap nextA tr1 tr2))