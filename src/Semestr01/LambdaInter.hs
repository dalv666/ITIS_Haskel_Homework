module LambdaInter where

type Name = Char
data Term = Var Name | App Term Term | Abstr Name Term
-- intetrp. representation of lambda-terms

fnForTerm :: Term -> a
fnForTerm term = case term of
					Var name  -> undefined
					App term1 term2 -> undefined
					Abstr name term  -> undefined


eval :: Term -> Term
eval (Var var) = Var var
eval (Abstr name term) = Abstr name (eval term)
eval (App (Var var) term2) = Var var
eval (App (Abstr name term1) term2) = eval (reduct term2 term1 name)
eval (App (App (Var name) term1) term2) = App (App (Var name) term1) term2
eval (App (App term1 term2) term3) = eval ((App (eval (App term1 term2))) term3)

reduct :: Term -> Term -> Char -> Term
--δ α β η redaction function
reduct term1 (Var name1) name2 = if name1 == name2 then term1 else Var name1
reduct term1 (App term2 term3) name = App (reduct term1 term2 name) (reduct term1 term3 name)
reduct term1 (Abstr name1 term2) name2 = if name1 == name2 then (Abstr name1 term2) else case term2 of
																								Abstr name3 term3 -> Abstr name1 (reduct term1 (Abstr name3 term3) name2)
																								App term3 term4   -> Abstr name1 (reduct term1 (App term3 term4) name2)
																								Var name3 		  -> if name3 == name1 then (Abstr name1 term2) else reduct term1 (Var name3) name2