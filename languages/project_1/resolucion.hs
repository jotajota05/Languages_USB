{-
Funcion @resolucion@ 
Parametros de entrada: 1 pregunta; 1 programa
Salida: Una lista de todas las sustituciones que se deben hacer a un programa para obtener un resolvente igual a la meta clausula vacia.
La funcion 
-}
resolucion :: Question -> Program -> Subs
resolucion (Q []) (Prolog _) = S [] --Caso de la meta clausula vacia false.
resolucion (Q question) (Prolog program) = 
    let clause = (clauseUni program (head question))
        robin = robinson (catchAtom clause) (head question)
        resolvente = map (sustitucion robin) ((catchTail clause)++(tail question)) 
    in S ((subsToList robin) ++ (subsToList (resolucion (Q resolvente) (Prolog program))))

{-
Funcion: @clauseUni@
Parametros de entrada: 1 Lista de clausulas "definite" ; 1 atomo
Salida: clauseUni devuelve la primera clausula definite de la lista que sea unificable con el atomo.
La funcion es utilizada en la funcion resolucion para determinar el primer atomo de un programa que sea unificable con el primer atomo del parametro de entrada de resolucion correspondiente a una pregunta.
-}
clauseUni :: [Definite] -> Atom -> Definite
clauseUni [] _= Fact ("nulo",[])
clauseUni (x:xs) (str,ts) = 
   let robin = (robinson (catchAtom x) (str,ts)) in if (catchError robin) 
                                                    then (clauseUni xs (str,ts))
                                                    else x
{-
Funcion: @subsToList@
Parametros de Entrada: Un tipo de datos susutitucion (Subs)
Salida: La lista [(Term,Term)] correspondiente a subs
En el caso de que subs sea una lista de tuplas de terminos, la funcion retorna es lista. En el caso de que subs sea un error, la funcion retorna la lista vacia. 
-}
subsToList :: Subs -> [(Term,Term)]
subsToList (S ss) = ss
subsToList (E _) = [(Const (St "error"),Const (St "error"))]
