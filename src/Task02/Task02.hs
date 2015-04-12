module Task02 where

--Рекурсиваная реализация факториала
myFac :: Integer -> Integer
myFac 0 = 1
myFac 1 = 1
myFac n = n * myFac (n-1)

--Хвостовая рекурсивная реализация
myFac n = myFac' 1 n 
myFac' c 0  = c
myFac' c n  = myFac' (c*n) (n-1)


--Рекурсиваная реализация числа фибоначи
myFib :: Integer -> Integer
myFib 0 = 0
myFib 1 = 1
myFib n = myFib(n-1) + myFib(n-2)

--Реализация функции Аккермана
myAker :: Integer -> Integer -> Integer -> Integer 
myAker m n 0 = m+n
myAker m n 1 = m*n
myAker m n 2 = m^n
