module TypedLambdaCheker where

type Name = Char

data Term =  Var Name 
			| Abstr Name Type Term 
			| App Term Term 
			| Par ParType

data Type =  TypeInt 
			| TypeBool 
			| TypeExsp 
			| Fun Type Type deriving (Show, Eq, Ord)

data ParType = ParInt Int 
			| ParBool Bool  deriving (Show, Eq, Ord)

type Context = [(Name, Type)]


look :: Context -> Char -> Type
look [] name = TypeExsp
look ((name,type1):context) name2 | name == name2    = type1
                                  | otherwise		 = look context name2

checkOnFun :: Type -> Type -> Type
checkOnFun (Fun term1 term2) term3 = if (term1 == term3) 
									then term2
									else TypeExsp
checkOnFun _ _ = TypeExsp

checkTerm :: Context -> Term -> Type
checkTerm _ (Par (ParInt a)) = TypeInt
checkTerm _ (Par (ParBool a)) = TypeBool
checkTerm context (Var x) = look context x
checkTerm context (App term1 term2) = if ((checkTerm context term1) == TypeExsp || (checkTerm context term2) == TypeExsp) 
                                    then TypeExsp else checkOnFun (checkTerm context term1) (checkTerm context term2)
checkTerm context (Abstr name type1 term) =  if ((checkTerm ((name,type1):context) term) /= TypeExsp) 
									then Fun type1 (checkTerm ((name,type1):context) term)
									else TypeExsp

check :: Type -> Bool
check type1 = not (type1 == TypeExsp) 
