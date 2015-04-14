module LambdaInter where

type Name = Char

data Term = Var Name
          | Abstr Name Term
          | App Term Term
-- intetrp. representation of lambda-terms

fnForTerm :: Term -> a
fnForTerm term = case term of
					Var name  -> undefined
					App term1 term2 -> undefined
					Abstr name term  -> undefined

--Evaluation fuction
eval :: Term -> Term
eval (Abstr name term) = Abstr name term
eval (Var name) = Var name
eval (App term1 term2)  = case eval term1 of
  						Abstr name term3 -> eval (subst name term2 term3)
  						result -> App result term2

--Substitution function
subst :: Name -> Term -> Term -> Term
subst name1 term1 (Abstr name2 term2) 
							| name1 /= name2  = Abstr name2 (subst name1 term1 term2)
							| otherwise = Abstr name2 term2
subst name1 term1 (App term2 term3) = App (subst name1 term1 term2) (subst name1 term1 term3)
subst name1 term1 (Var name2)
							| name1 == name2     = term1
							| otherwise          = Var name2