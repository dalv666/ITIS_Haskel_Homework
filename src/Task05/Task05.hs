module Task05 where

myMapR :: (a -> b) -> [a] -> [b]
myMapR tr (x:xs) = foldr (\y ys -> (tr y):ys) [] (x:xs)


myMapL :: (a -> b) -> [a] -> [b]
myMapL tr (x:xs) = reverse (foldl (\y ys -> tr(ys):y) [] (x:xs))

recConcat :: (a -> [b]) -> [a] -> [b]
recConcat tr [] = []
recConcat tr (x:xs) = tr x ++ recConcat tr xs