{-
Proyecto 1 de Lenguajes de Programacion. Interpretador de Prolog en Haskell

Tamara Mendt 05-38207
Juan Garcia 05-38207
-}
module Main (
             Value (..),
             Term (..),
             Atom,
             Tail,
             Question (..),
             Definite (..),
             Program (..),
             Subs (..),
             mult_sustitucion,
             sustitucion,
             sustit,
             isVar,
             robinson,
             pares,
             alan,
             sustituirPar,
             catsub,
             occurs_check,
             pertenece,
             resolucion,
             clauseUni,
             subsToList,
             catchAtom,
             catchTail,
             catchError,
             main
             ) where

import System
import System.IO 
import IO
import Directory

-- DEFINICION DE TIPOS DE DATOS

{-|
Tipo @Value@

Descripcion: Este tipo de dato representa el conjunto de dominio de los terminos que son Constantes.
-}
data Value = I Int | B Bool | F Float | C Char | St String 
             deriving (Eq,Show)

{-|
Tipo @Term@

Descripcion: Este tipo de dato repesenta los terminos de un Atomo, pueden ser Constantes, Variables o Funciones.
-}
data Term = Const Value
          | Var String
          | Fun String [Term]
            deriving (Eq)
  
instance Show Term where
    show a =  showTerm a 
        where
          showTerm (Const a) = "'" ++ (show a) ++ "'"
          showTerm (Var a) = "'" ++ a ++ "'"
          showTerm (Fun a b) = show a ++ "(" ++ showFun b
              where
                showFun [] = ")"
                showFun [b] = (showTerm b) ++ ")"
                showFun (b:bs) = (showTerm b) ++ showAux bs
                    where
                      showAux [] = ")"
                      showAux (b:bs) = "," ++ showTerm b ++ showAux bs
{-|
Tipo @Atom@

Descripcion: este tipo de dato representa un Atomo de una clausula, que corresponde a una tupla de un String, que es el identificador, y una lista de Terminos.
-}
type Atom = (String,[Term])

{-|
Tipo @Tail@

Descripcion: este tipo de dato representa una cola de una pregunta, que es una lista de Atomos.
-}
type Tail = [Atom]

{-|
Tipo @Question@

Descripcion: este tipo de dato representa una pregunta, y se crea con el constructor de tipo Q, y un Tail, que es una lista de Atomos.
-}
data Question = Q Tail 
                deriving (Eq,Show)

{-|
Tipo @Definite@

Descripcion: Representa un Hecho o una Regla, con sus correspondientes contructores Fact o Rule.
-}
data Definite = Fact Atom
              | Rule Atom Tail
                deriving (Eq,Show)

{-|
Tipo @Program@

Descripcion: Este tipo representa un programa logico en Prolog, que es una lista de Definite con el constructor Prolog
-}
data Program = Prolog [Definite] 
               deriving (Eq,Show)

{-|
Tipo @Subs@

Descripcion: Este tipo de dato representa un conjunto de sustituciones, representada mediante una lista de tuplas de terminos, o un error de unificacion representada mediante un string.
-}
data Subs = S [(Term,Term)] 
          | E String 
            deriving (Eq)

instance Show Subs where
    show a = showSubs a
        where
          showSubs (E msj) = show msj
          showSubs (S ss) = " { " ++ (showCjtoSubs ss)
              where
                showCjtoSubs [] = " } "
                showCjtoSubs (s:ss) = (show (fst s)) ++ " <-- " ++ (show (snd s)) ++ showAux ss
                    where
                      showAux [] = " } "
                      showAux ss = " , "  ++ showCjtoSubs ss

-- FUNCIONES

{-|
Funcion @mult_sustitucion@

Parametros de entrada: Un conjunto de sustituciones y una lista de atomos.

Salida: Retorna una la lista de atomos.

Descripcion: La funcion aplica el conjunto de sustituciones a la lista de atomos y retornando la nueva lista generada.
-}
mult_sustitucion :: Subs -> [Atom] -> [Atom]
mult_sustitucion _ [] = []
mult_sustitucion (S ss) atomo = map (sustitucion (S ss)) (atomo)
mult_sustitucion (E _) _ = []

{-|
Funcion @sustitucion@

Parametros de entrada: Un conjunto de substituciones y un atomo.

Salida: Retorna un atomo.

Descripcion: La funcion aplica el conjunto de sustituciones a el atomo que recibe de entrada, y devuelve el nuevo atomo generado.
-}
sustitucion :: Subs -> Atom -> Atom
sustitucion (E _) atomo  = atomo
sustitucion (S ss) (nom,ts) = (nom,map (sustit (S ss)) ts)

{-|
Funcion @sustit@

Parametros de entrada: Un conjunto de sustituciones y un termino.

Salida: Un termino.

Descripcion: La funcion aplica un conjunto de sustituciones a un termino, y retorna el nuevo termino generado.
-}
sustit :: Subs -> Term -> Term
sustit (E _) term = term
sustit (S []) term = term
sustit (S ss) (Var x) | (isVar (fst (head ss)) && (fst (head ss)) == Var x) = (snd (head ss))
                      | otherwise = sustit (S (tail ss)) (Var x)
sustit (S ss) (Fun m rs) = Fun m (map (sustit (S ss)) rs)
sustit (S ss) (Const v) = Const v

{-|
Funcion @isVar@

Parametros de entrada: Un termino.

Salida: Un Bool.

Descripcion: La Funcion recibe un termino y determina si el mismo es una variable, retornando un booleano.
-}
isVar:: Term -> Bool
isVar (Var x) = True
isVar _ = False

{-|
Funcion @robinson@

Parametros de entrada: Dos atomos.

Salida: Un conjunto de susbtituciones o un mensaje de error.

Descripcion: La Funcion recibe dos atomos, e intentara buscar un unificador general, el cual retornara a la salida. Se verificara si los dos predicados son iguales y si las aridades del mismo son de la misma aridad. En este caso se llamara a la funcion alan, pasando como parametro todos los pares de terminos de los atomos en la pila generada por la funcion pares, para asi ir empilando cada una de las sustituciones necesarias para unificar, y retornar las mismas a la salida.
-}
robinson :: Atom -> Atom -> Subs
robinson (nom,ts) (mon,st) | (nom /= mon) = E "Error Predicados distintos"
                           | (length ts /= length st) = E "Error Aridades distintas"
                           | otherwise = alan (pares ts st)

{-|
Funcion @pares@

Parametros de entrada: Dos listas de terminos.

Salida: Una lista de tuplas de terminos, semejante a una pila.

Descripcion: La funcion recibe par de listas de terminos, y va a generar una pila de tuplas de terminos, que contendra a todos los posibles terminos candidatos a subtitucion entre el programa y la pregunta.
-}
pares :: [Term] -> [Term] -> [(Term,Term)]
pares [] [] = []
pares (t:ts) (r:rs) = (t,r) : pares ts rs

{-|
Funcion @alan@

Parametros de entrada: Una lista de tuplas de terminos.

Salida: un conjunto de sustituciones o un string de error.

Descripcion: La funcion recibe una lista de tuplas de terminos, provenientes de la funcion pares, y se encrga de encontrar para cada tupla, el par sustitucion correspondiente, asi para todos los elementos de la lista, y devuelve el conjunto de sustituciones correspondiente.
-}
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

{-|
Funcion @sustituirPar@

Parametros de entrada: un conjunto de sustituciones y una tupla de terminos.

Salida: Una tupla de terminos

Descripcion: La funcion toma el conjunto de sustituciones y se la aplica al par de terminos de la tupla, luego retorna la tupla generada correspondiente.
-}
sustituirPar :: Subs -> (Term,Term) -> (Term,Term)
sustituirPar (S ss) (x,y) = (sustit (S ss) x,sustit (S ss) y) 

{-|
Funcion @catsub@

Parametros de entrada: Dos conjuntos de sustituciones.

Salida: Un conjunto de sustituciones.

Descripcion: La funcion toma dos conjuntos de sustituciones y los une para formar un solo conjunto, el cual sera retornado a la salida.
-}
catsub :: Subs -> Subs -> Subs
catsub (E e1) (E e2) = E (e1 ++ " y " ++ e2)
catsub (E e) _  = (E e)
catsub _ (E e)  = (E e)
catsub (S ts) (S st) = S (ts ++ st)

{-|
Funcion @occurs_check@

Parametros de entrada: Dos terminos.

Salida: un booleano.

Descripcion: La funcion toma dos terminos, y para terminos que sean una variable y una funcion, y viceversa, procedera a verificar la ocurrencia de la variable dentro de la funcion. Para cualquier otro termino, devolvera Falso.
-}
occurs_check :: Term -> Term -> Bool
occurs_check (Var x) (Fun m rs) = pertenece (Var x) rs
occurs_check (Fun m rs) (Var x) = occurs_check (Var x) (Fun m rs)
occurs_check _ _ = False

{-|
Funcion @pertenece@

Parametros de entrada: Un termino y una lista de terminos.

Salida: un booleano.

Descripcion: la funcion verifica si un termino, especificamente una variable, pertenece a una lista de terminos, que contiene variables o funciones. En caso de otro tipo de terminos la funcion retorna false.
-}
pertenece :: Term -> [Term] -> Bool
pertenece t [] = False
pertenece (Var x) ((Var y):rs) = if x==y then True else False
pertenece (Var x) ((Fun f ts):rs) = (or (map (occurs_check (Var x)) ts)) || pertenece (Var x) rs
pertenece _ _ = False

{-|
Funcion @resolucion@ 

Parametros de entrada: 1 pregunta; 1 programa

Salida: Una lista de todas las sustituciones que se deben hacer a un programa para obtener un resolvente igual a la meta clausula vacia.

Descripcion: La funcion 
-}
resolucion :: Question -> Program -> Subs
resolucion (Q []) (Prolog _) = S [] --Caso de la meta clausula vacia false.
resolucion (Q question) (Prolog program) = 
    let clause = (clauseUni program (head question))
        robin = robinson (catchAtom clause) (head question)
        resolvente = map (sustitucion robin) ((catchTail clause)++(tail question)) 
    in S ((subsToList robin) ++ (subsToList (resolucion (Q resolvente) (Prolog program))))

{-|
Funcion: @clauseUni@

Parametros de entrada: 1 Lista de clausulas "definite" ; 1 atomo

Salida: clauseUni devuelve la primera clausula definite de la lista que sea unificable con el atomo.

Descripcion: La funcion es utilizada en la funcion resolucion para determinar el primer atomo de un programa que sea unificable con el primer atomo del parametro de entrada de resolucion correspondiente a una pregunta.
-}
clauseUni :: [Definite] -> Atom -> Definite
clauseUni [] _= Fact ("nulo",[])
clauseUni (x:xs) (str,ts) = 
   let robin = (robinson (catchAtom x) (str,ts)) in if (catchError robin) 
                                                    then (clauseUni xs (str,ts))
                                                    else x
{-|
Funcion: @subsToList@

Parametros de Entrada: Un tipo de datos susutitucion (Subs)

Salida: La lista [(Term,Term)] correspondiente a subs

Descricion: En el caso de que subs sea una lista de tuplas de terminos, la funcion retorna es lista. En el caso de que subs sea un error, la funcion retorna la lista vacia. 
-}
subsToList :: Subs -> [(Term,Term)]
subsToList (S ss) = ss
subsToList (E _) = []

{-|
Funcion: @catchAtom@

Parametro de entrada: Un tipo de clausula definite

Salida: el atomo positivo de la clausula

Descripcion: Esta funcion se creo para poder acceder al atomo de una clausula definite independientemente de que la clausula sea una regla o un hecho. Como todas las clausulas definite tienen uno y solo un atomo positivo, la funcion funciona bajo el dominio de todas las clausulas definite.
-}
catchAtom :: Definite -> Atom
catchAtom (Fact at) = at
catchAtom (Rule at _) = at

{-|
Funcion: @catchTail@

Parametro de entrada: Un tipo de clausula definite

Salida: La lista de atomos negativos correspondientes a la clausula.

Descripcion: En el caso de que la clausula de entrada sea una regla la funcion retorna la lista de atomos negativos asociada a esa regla. En el caso de que la clausula sea un hecho, la funcion retorna una lista vacia.
-}
catchTail :: Definite -> Tail
catchTail (Rule _ tail) = tail
catchTail (Fact _) = []

{-|
Funcion @catchError@

Parametro de Entrada: Un tipo de datos Subs

Salida: Bool

Descripcion: La funcion devuelve True en el caso de que subs corresponda a un error y retorna False en el caso de que subs corresponda a una lista de tuplas de terminos.
-}
catchError :: Subs -> Bool
catchError(E string) = True
catchError(S ss) = False

{-|
Funcion @backtracking@
Parametros de entrada: Un programa y una pregunta
Salida: una lista de conjuntos de sustituciones
-}
backtracking :: Program -> Question -> [Subs]
backtracking (Prolog []) (Q _) = []
backtracking (Prolog _) (Q []) = []
backtracking (Prolog programa) (Q pregunta) = [(resolucion (Q pregunta) (Prolog programa))] ++ ((backtracking (Prolog (tail programa)) (Q pregunta)))

-- EJEMPLOS PARA CHEQUEAR LAS FUNCIONES

-- Ejemplos de data

app :: Program
app = Prolog [Fact ("append",[Fun "lista" [],Var "L",Var "L"]), Rule ("append",[Fun "lista" [Var "A",Var"X"],Var "Y",Fun "lista" [Var "A",Var "Z"]])[("append",[Var "X",Var "Y",Var "Z"])]]

query :: Question
query = Q [("append",[Fun "lista" [Var "Head",Var "Tail1"],Var "Tail2",Fun "lista" [Const (C 'a'),Fun "list" []]])]

poesia :: Program
poesia = Prolog [Rule ("poesia",[Var "X1",Var "Y1"]) [("inspiracion",[Var "X1",Var "Y1"]),("oficio",[Var "X1"]),("talento",[Var "X1"])],
                 Rule ("inspiracion",[Var "X2",Var "Y2"]) [("musa",[Const (St "erato"),Var "X2"]),("idea",[Var "Y2"])],
                 Rule ("oficio",[Var "X3"]) [("practica",[Var "X3"])],
                 Fact ("musa",[Const (St "erato"),Const (St "luis")]),
                 Fact ("musa",[Const (St "erato"),Const (St "kavafis")]),
                 Fact ("idea",[Const (St "itaca")]),
                 Fact ("practica",[Const (St "luis")]),
                 Fact ("practica",[Const (St "kavafis")]),
                 Fact ("talento",[Const (St "kavafis")])]

preg :: Question
preg = Q [("poesia",[Const (St "kavafis"),Var "T"]),("poesia",[Var "K",Const (St "itaca")]) ]

-- Ejemplos para la funcion sustitucion

atomo :: Atom
atomo = ("append",[Fun "lista" [Var "A",Var"X"],Var "Y",Fun "lista" [Var "A",Var "Z"]])

sust_ejem :: Subs
sust_ejem = S [(Var "A",Const (C 'a')),(Var "X",Fun "lista" [])]


-- Ejemplos para la funcion robinson

atomo1 :: Atom
atomo1 = ("append",[Fun "lista" [Var "A",Var"X"],Var "Y",Fun "lista" [Var "A",Var "Z"]])

atomo2 :: Atom
atomo2 = ("append",[Fun "lista" [Var "Head",Var "Tail1"],Var "Tail2",Fun "lista" [Const (C 'a'),Fun "lista" []]])

atomo3 :: Atom
atomo3 = ("append",[Fun "lista" [Var "A",Var"X"],Var "Y",Fun "lista" [Var "A",Var "Z"]])

atomo4 :: Atom
atomo4 = ("append",[Fun "lista" [Var "Head",Var "Tail1"],Var "Tail2",Fun "lista" [Const (C 'a'),Fun "list" []]])

atomo5 :: Atom
atomo5 = ("append",[Fun "lista" [],Var "X",Var "X"])

atomo6 :: Atom
atomo6 = ("append",[Var "Tail1",Var "Tail2",Fun "lista" [Const (C 'a'),Fun "list" []]])

{-|
Funcion @main@
Descripcion: funcion principal en donde se ejecuta el programa, y se hace la llamada a cada funcion.
-}
main :: IO()
main = do
 
  print " INTERPRETADOR DE PROLOG "
  
  print "---- robinson atomo1 atomo2 = "
 
  print $ robinson atomo1 atomo2
 
  
  print "---- sustitucion sust_ejem = "
 
  print $ sustitucion sust_ejem atomo
 
  
  print "---- resolucion preg poesia = "
 
  print $ resolucion preg poesia
 
  
  print "---- backtracking poesia preg = "
 
  print $ backtracking poesia preg
 