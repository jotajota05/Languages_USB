robinson :: Atom -> Atom -> Subs
robinson (nom,ts) (mon,st) | (nom /= mon) = E "Error Predicados distintos"
                           | (length ts /= length st) = E "Error Aridades distintas"
                           | otherwise = alan (pares ts st)

pares :: [Term] -> [Term] -> [(Term,Term)]
pares [] [] = []
pares (t:ts) (r:rs) = (t,r) : pares ts rs

alan :: [(Term,Term)] -> Subs
alan ((Const v,Const w):terms) = E "Error Constantes"

alan ((Const v,Var x):terms) | (length terms > 0 ) = catsub (S [(Var x,Const v)]) (alan terms)
                             | otherwise =  S [(Var x,Const v)]
alan ((Const v,Fun f rs):terms) = E "Error Constante - Funcion"

alan (((Fun f xs),(Fun g ys)):terms) | (f/=g) = E "Error Funciones distintas"
                                     | (length xs /= length ys) = E "Error Aridades de funciones distintas"
                                     | otherwise = alan ((pares xs ys) ++ terms)
alan (((Fun f xs),Var x):terms) | occurs_check (Var x) (Fun f xs) = E "Error Variable - Funcion"
                                | (length terms == 0) = S [(Var x,Fun f xs)]
                                | otherwise  = catsub (S [(Var x,Fun f xs)]) (alan (map (sustituirPar (S [(Var x,Fun f xs)])) (terms)))

alan (((Fun f xs),Const v):terms) = E "Error Funcion - COnstante"

alan ((Var x,Var y):terms) | (length terms > 0) = catsub (S [(Var x,Var y)]) (alan (map (sustituirPar (S [(Var x,Var y)])) (terms)))
                           | otherwise = S [(Var x,Var y)]
alan ((Var x,(Fun f xs)):terms) | occurs_check (Var x) (Fun f xs) = E "Error Variable - Funcion"
                                | (length terms == 0) = S [(Var x,Fun f xs)]
                                | otherwise  = catsub (S [(Var x,Fun f xs)]) (alan (map (sustituirPar (S [(Var x,Fun f xs)])) (terms)))
                                            
alan ((Var x,Const v):terms) | (length terms > 0 ) = catsub (S [(Var x,Const v)]) (alan (map (sustituirPar (S [(Var x,Const v)])) (terms)))
                             | otherwise =  S [(Var x,Const v)]

sustituirPar :: Subs -> (Term,Term) -> (Term,Term)
sustituirPar (S ss) (x,y) = (sustit (S ss) x,sustit (S ss) y) 

catsub :: Subs -> Subs -> Subs
catsub (E e1) (E e2) = E (e1 ++ " y " ++ e2)
catsub (E e) _  = (E e)
catsub _ (E e)  = (E e)
catsub (S ts) (S st) = S (ts ++ st)

occurs_check :: Term -> Term -> Bool
occurs_check (Var x) (Fun m rs) = pertenece (Var x) rs
occurs_check (Fun m rs) (Var x) = occurs_check (Var x) (Fun m rs)
occurs_check _ _ = False
                   
pertenece :: Term -> [Term] -> Bool
pertenece t [] = False
pertenece (Var x) ((Var y):rs) = if x==y then True else False
pertenece (Var x) ((Fun f ts):rs) = (or (map (occurs_check (Var x)) ts)) || pertenece (Var x) rs
pertenece _ _ = False
