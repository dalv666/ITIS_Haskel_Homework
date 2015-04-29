module Task05 where

--Task№1
myMapR :: (a -> b) -> [a] -> [b]
myMapR tr (x:xs) = foldr (\y ys -> (tr y):ys) [] (x:xs)

myMapL :: (a -> b) -> [a] -> [b]
myMapL tr xs = foldl(\y ys -> y ++ [tr ys] ) [] xs

recConcat :: (a -> [b]) -> [a] -> [b]
recConcat tr [] = []
recConcat tr (x:xs) = tr x ++ recConcat tr xs

--Task№2
myConcatMapL :: (a -> [b]) -> [a] -> [b]
myConcatMapL tr =  foldl(\y ys->y ++ tr ys) []

myConcatMapR :: (a -> [b]) -> [a] -> [b]
myConcatMapR tr =  foldr(\y ys -> tr y ++ ys) []

recConcatMap :: (a -> [b]) -> [a] -> [b]
recConcatMap tr (x:xs) = tr x ++ recConcatMap tr xs