module TypedLambdaCheker where

--de Bruijn indices variables representation
type Name = Int

--Not need to check
data InferTerm = Check CheckTerm Type | Var Int | Par Int | App InferTerm CheckTerm 
--annotation/bound variables/parameters/application

--Need to check
data CheckTerm = Infer InferTerm | Lam CheckTerm 

data Type = TPar Int | Fun Type Type 
-- sigma, tau, etc. -- sigma -> tau

type Context = [(Name,Type)]
--bind name and type

--Substitution function
subst :: Int -> InferTerm -> InferTerm -> InferTerm
subst name iTerm (Par name2) = Par name2
subst name1 term1 (App term2 term3) = App (subst name1 term1 term2) (Infer (subst name1 term1 (Check term3 (TPar name1))))
subst name1 term1 (Var name2)
							| name1 == name2     = term1
							| otherwise          = Var name2

--Checking function
checkType :: Int -> Context -> Type -> CheckTerm -> Maybe()
checkType name iTerm (Fun type1 type2) (Lam cTerm) = do checkType (name + 1) ((name,type1 ):iTerm) type2 (Infer (subst 0 (Par name) (Check cTerm (Fun type1 type2))))

--Deducing function
inferType :: Int -> Context -> InferTerm -> Maybe Type
inferType name iTerm (Par name2) = lookup name2 iTerm
inferType name iTerm (App iTerm2 cTerm) = do
						  Fun type1 type2 <- inferType name iTerm iTerm2
						  checkType name iTerm type1 cTerm
						  return type2