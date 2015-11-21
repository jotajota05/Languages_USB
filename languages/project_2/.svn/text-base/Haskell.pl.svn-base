
/* Lenguajes de Programacion I

  Proyecto II - Interpretador de Haskell en Prolog

  Tamara Mendt - 05-38546
  Juan Garcia - 05-38207
*/


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% FUNCION - POSICION %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/* Procedimiento que calcula las posiciones de un término
  en orden lexicográfico sobre los naturales
*/


posicion(var(_),[[]]).
posicion(fun(_,[]),[[]]).
posicion(X,L):- pos(X,[[]|P]),
               orden([[]|P],L), !. % ordenamiento de posiciones
               

/* procedimiento que calcula de posiciones de un término
  haciendo búsqueda en el árbol del término primero en profundidad
*/

pos(var(_),_).
pos(fun(_,[]),_).
pos(fun(_,Arg),[Nodo|Pos]) :- pos_acum(fun(_,Arg),[Nodo],Pos), !.

/* procedimiento auxiliar de "pos" usando acumulador para
  evitar "append" y ganar en eficiencia
*/

pos_acum(var(_),_,[] ).
pos_acum(fun(_,[]),_,[]).
pos_acum(fun(_,Arg),[Nodo],Pos) :- length(Arg,N),
                                  num_arg(Nodo,N,1,L),
                                  pos_lista(Arg,L,[],Pos).

/* procedimiento que recoge las posiciones de la lista
  de términos que son los argumentos de un término
*/

pos_lista([],[],A,A).
pos_lista([Term|Terms],[N|Ns],A,Pos):- pos_acum(Term,[N],Pos1),
                                      append(A,[N|Pos1],A2),
                                      pos_lista(Terms,Ns,A2,Pos).

/* procedimiento que, dados un prefijo W y un número N, construye
  la lista en orden creciente desde 1 hasta N de las palabras WN:
[W1,...,WN]
  El uso de acumulador es para facilitar el buen orden que se busca
*/

num_arg(_,0,_,[]):- !.
num_arg(X,N,M,L):- N1 is N-1,
                  M1 is M+1,
                  num_arg(X,N1,M1,L1),
                  append(X,[M],L2),
                  append([L2],L1,L).


/* En este comentario se muestran los mismos procedimientos
  pero sin el uso de acumulador. Se sugiere revisarlos
  cuando no se entiendan bien los anteriores.


posicion(var(_),[[]]).
posicion(fun(_,[]),[[]]).
posicion(X,L):- pos(X,[[]|P]),
               orden([[]|P],L).

pos(var(_),_).
pos(fun(_,[]),_).
pos(fun(_,Arg),[Nodo|P]) :- length(Arg,N),
                            num_arg(Nodo,N,1,L),
                            pos_lista(Arg,L,P).

pos_lista([],[],[]).
pos_lista([Term|Terms],[N|Ns],L):- pos(Term,[N|L2]),
                                  pos_lista(Terms,Ns,L3),
                                append([N|L2],L3,L).

*/


/* Procedimiento que ordena una lista de listas
  según el orden lexicográfico y el orden del tipo
  de los elementos.
*/

orden(X,L):- ordena(0,X,[],Y),
            sorts(Y,[],L).

/* Procedimiento que ordena primero las listas según su longitud
*/

ordena(_,[],A,A).
ordena(N,X,A,Y) :- terraza(N,X,[],Y1,[],Z1),
                  append([Y1],A,A1),
                  N1 is N+1,
                  ordena(N1,Z1,A1,Y).

terraza(_,[],A,A,B,B):- !.

terraza(N,[H|T],A,Y,B,Z) :- length(H,N1),
                           N1 = N,
                           append([H],A,A1),
                        terraza(N,T,A1,Y,B,Z);
                           append([H],B,B1),
                           terraza(N,T,A,Y,B1,Z).

/* Procedimiento que ordena las listas de igual longitud
  según el orden de los elementos.
  "sort" es un procedimiento predefinido para ordenar listas.
*/

sorts([],A,A).
sorts([H|T],A,L) :- sort(H,H1),
                   append(H1,A,A1),
                   sorts(T,A1,L).

/* petit pretty printer para mostrar con claridad la salida.
  debe quitarse si se usa el procedimiento "posicion" en otros contextos.
*/

ppp([]).
ppp([H|T]):- write(H),nl,ppp(T).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% FUNCION - SUBTERM %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Determina cual es el Subterm de de una posicion dentro del Termino.
%aqui coloque un cut
subterm(Pos,Term1,Term2):- pos(Term1,L),!,subt(Pos,L,Term1,Term2).


subt([],[[]],Term,Term):- Term = var(X); Term = fun(X,[]).
subt(Pos,L,Term,Term):- not(member(Pos,L)),!.
subt(Pos,[Pos|_],Term,Term):-!.
subt(Pos,[_|Ps],fun(_,Args),Term):- subt_list(Pos,Ps,Args,Term).

%%aqui tambien
subt_list(_,[],[],_).
subt_list(Pos,[P|Ps],[Arg|Args],Term):- subt(Pos,[P|Ps],Arg,Term),!;
                                       proximo([P|Ps],Pt),!,
                                       subt_list(Pos,Pt,Args,Term).

% Este procedimiento salta todos los hijos de la primera posición
proximo([],[]).
proximo([P1,P2|Ps],Pt):- length(P1,N1),
    length(P2,N2),
    N1 < N2,
    proximo([P1|Ps],Pt).

proximo([_,P2|Ps],[P2|Ps]).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% FUNCION VAR %%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

variable(var(X),[var(X)]).
variable(fun(_,[]),[]).
variable(fun(_,Args),L):- variableAux(Args,[],L).

variableAux([],A,A).
variableAux([Arg|Args],A,L):- variable(Arg,L1), add_set(L1,A,A1), variableAux(Args,A1,L).

% variable(var(X),[var(X)]).
% variable(Term,List) :- pos(Term,Pos), variableAux(Term,Pos,List).       

% variableAux(Term,[X|Xs],List) :- subterm(X,Term,var(Y)), add_set([var(Y)],List,Lista), !, variableAux(Term,Xs,Lista).
% variableAux(_,[],_).

add_set([],L,L).
add_set([X|Xs],L1,L2) :- member(X,L1), add_set(Xs,L1,L2);
	append([X],L1,L3), add_set(Xs,L3,L2).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% FUNCION - REEMPLAZO %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

repl(P,Term,TermS,TermR) :- pos(Term,X), replAux(X,P,Term,TermS,TermR).

replAux(Pos,P,Term,_,Term) :- not(member(P,Pos)), !.
replAux(_,P,fun(Id,Args),TermS,TermR) :- replAux2(P,Args,TermS,ArgsR), TermR = fun(Id,ArgsR) ; TermR = TermS.
replAux(_,[],_,X,X).

replAux2([P|Ps],Args,TermS,ArgsR) :- enesimo(P,Args,X), replAux(_,Ps,X,TermS,ArgsInt), actArgs(Args,X,ArgsInt,ArgsR).

enesimo(1,[X|_],X).
enesimo(N,[_|Xs],X) :- R is N-1, enesimo(R,Xs,X).

actArgs([Arg|Args],Term,ArgsInt,ArgsR) :- Arg = Term, append([ArgsInt],Args,ArgsR) ;
	actArgs(Args,Term,ArgsInt,ArgsM), append([Arg],ArgsM,ArgsR).

%repl(P,Term1,Term2,Term3) :- pos(Term1,X), replAux(P,X,Term1,Term2,Term3).
%repl([1|Ptail],fun(Id,[Arg1|ArgTail]),Term2,fun(Id,[R|ArgTail])) :- repl(Ptail,Arg1,Term2,R).
%repl([P|Ptail],fun(Id,[_|ArgTail]),Term2,fun(Id,R)) :- repl([(P-1)|Ptail],fun(Id,ArgTail),Term2,R).

%replAux(P,Term1,Term2,Term1):- not(member(P,X)),!.

%repl([],fun(mas,[fun(suc,[fun(cero,[])]),fun(por,[fun(suc,[var(x0)]),var(x1)])]),fun(por,[var(x2),fun(suc,[var(x3)])])).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% FUNCION - INSTANCIACION %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

sust(var(X),var(X),[]).
sust(var(X),var(Y),[var(X),var(Y)]).
sust(var(X),Term,[var(X),Term]) :- variable(Term,V), !, not(member(var(X),V)).

sustExt(X,T,Sust) :- length(X,N1), length(T,N2), N1 = N2, sustExtAux(X,T,Sust).

sustExtAux([X|Xs],[T|Ts],Sust) :- sust(X,T,S1), sustExtAux(Xs,Ts,S2), append([S1],S2,Sust) ; sustExtAux(Xs,Ts,Sust).
sustExtAux([],_,[]).
sustExtAux(_,[],[]).

inst(Sust,fun(Id,[Arg|Args]),Term2) :- inst(Sust,Arg,Term), instAux(Sust,Args,Terms), append([Term],Terms,ArgsF), Term2 = fun(Id,ArgsF),!.
inst([[S1,S2]|Ss],var(X),Term2) :- member(S1,[var(X)]), repl([],var(X),S2,Term2) ; inst(Ss,var(X),Term2).
inst([[S1,_]|Ss],Term,Term) :- variable(Term,V), not(member(S1,V)), !, inst(Ss,Term,Term).
inst([],Term,Term).
inst(_,fun(Id,[]),fun(Id,[])).

instAux(Sust,[Arg|Args],Terms) :- inst(Sust,Arg,Term1), instAux(Sust,Args,Term2), append([Term1],Term2,Terms).
instAux(_,[],[]).

/*Pruebas

  inst([[var(x),fun(sub,[])]],fun(cero,[]),X).
  inst([[var(x0),fun(cero,[])],[var(x1),fun(cero,[])],[var(x2),fun(cero,[])],[var(x3),fun(cero,[])]],fun(mas,[var(y1),var(y2)]),X).
  inst([[var(x0),fun(suc,[fun(cero,[])])],[var(x1),fun(mas,[var(x0),fun(suc,[var(x3)])])],[var(x2),fun(por,[var(x3),fun(suc,[var(x1)])])]],fun(mas,[fun(suc,[fun(cero,[])]),fun(por,[fun(suc,[var(x0)]),var(x1)])]),T).

*/

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% FUNCION - REDEX %%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/* La funcion redex obtiene el redex mÃ¡s externo de un tÃ©rmino dado,
   de acuerdo con el conjunto de reglas.
   Esta funcion utiliza la funcion unif que, dados 2 tÃ©rminos, es capaz de 
   reconocer si son unificable y en el caso de que lo sean proporciona la
   sustitucion necesaria para unificarlos.
*/

unif(Term,var(X),Sust) :- sust(var(X),Term,Sust).
unif(var(X),Term,Sust):- sust(var(X),Term,Sust).
unif(var(X),var(Y),Sust):- sust(var(X),var(Y),Sust).
unif(fun(Id,X),fun(Id,Y),S):- length(X,1), length(Y,1), append(X,Y,S), ! ; length(X,L1), length(Y ,L2), L1=L2, pares(X,Y,[],Par), alan(Par,[],S).

pares([],[],S,S). 
pares([X],[Y],Acum,S) :- append(X,Y,Par), append(Acum,Par,S).
pares([X|Xs],[Y|Ys],Acum,S):- append([X],[Y],Par),append(Acum,[Par],NewAcum),pares(Xs,Ys,NewAcum,S).


alan([],S,S).
alan([[Y1,Y2]|Xs],Acum,S):- unif(Y1,Y2,U), append(Acum,[U],NewAcum), alan(Xs,NewAcum,S).

redex(Term1,Term2):- posicion(Term1,X), !, redexAux(Term1,X,Term2), Term2 = fun(_,_),  !.

redexAux(Term1,[],Term1).
redexAux(Term1,[X|Xs],Term2) :- subterm(X,Term1,Y), regla(1,I,_), unifredex(Y,1,I), Term2 = Y ; redexAux(Term1,Xs,Term2).

unifredex(Term,N,T1):- unif(Term,T1,_) ; X is N+1, regla(X,I,_), unifredex(Term,X,I), !.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% FUNCION - REDUCE %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*La funcion reduce recibe un termino, halla el redex mas externo
  de ese termino y lo reduce de acuerdo a la susutitucion hallada.
*/

reduce(Term1,Term2) :- redex(Term1,TermExt), posTerm(Term1,TermExt,P), !, obtRegla(TermExt,TermI,TermD), unif(TermI,TermExt,Sust), inst(Sust,TermD,TermF), repl(P,Term1,TermF,Term2), !. 
reduce(Term1,Term1).

posTerm(Term,TermExt,P) :- posicion(Term,P1), !, posTermAux(Term,TermExt,P1,P).

posTermAux(Term,TermExt,[P|Ps],P1) :- subterm(P,Term,Term1), Term1 = TermExt, P1 = P ; posTermAux(Term,TermExt,Ps,P1).

obtRegla(TermExt,TermI,TermD) :- regla(1,I,D), obtReglaAux(1,I,D,TermExt,TermI,TermD).

obtReglaAux(N,TermI,TermD,TermExt,TermI2,TermD2) :- unif(TermI,TermExt,_), TermI2 = TermI, TermD2 = TermD, ! ; N1 is N+1, regla(N1,I2,D2), obtReglaAux(N1,I2,D2,TermExt,TermI2,TermD2).

%redex(_,fun(por,[fun(suc,[fun(cero,[])]),fun(mas,[fun(cero,[]),fun(suc,[fun(cero,[])])])])).

%unif(fun(mas,[var(x1),var(x2)]),fun(mas,[fun(suc,[fun(cero,[])]),fun(por,[fun(suc,[fun(cero,[])]),fun(mas,[fun(cero,[]),fun(suc,[fun(cero,[])])])])]),S).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% FUNCION - NORMAL %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*
  La funcio normal recibe un termino y lo reduce 
  tantas veces como pueda hasta obtener un termino
  irreducible
*/

normal(Term1,Term2):- reduce(Term1,X) ,write(X), nl, normal(X,Term2).
normal(Term1,Term1):- reduce(Term1,Term1), write(Term1), nl.  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
%%%%%%%%%% EJEMPLOS %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/* Ejemplos de tï¿½rminos para probar los procedimientos

   fun(mas,[fun(suc,[fun(cero,[])]),fun(por,[fun(suc,[fun(cero,[])]),fun(mas,[fun(cero,[]),fun(suc,[fun(cero,[])])])])])

   fun(mas,[fun(por,[fun(suc,[fun(cero,[])]),fun(mas,[fun(cero,[]),fun(suc,[fun(cero,[])])])]),fun(suc,[fun(cero,[])])])

   fun(suc,[fun(mas,[fun(por,[fun(suc,[fun(cero,[])]),fun(mas,[fun(cero,[]),fun(suc,[fun(cero,[])])])]),fun(cero,[])])])

   fun(suc,[fun(mas,[fun(mas,[fun(suc,[fun(cero,[])]),fun(cero,[])]),fun(por,[fun(mas,[fun(cero,[]),fun(suc,[fun(cero,[])])]),fun(cero,[])])])])
   
   redex(fun(mas,[fun(cero,[]),fun(por,[fun(suc,[fun(cero,[])]),fun(mas,[fun(cero,[]),fun(suc,[fun(cero,[])])])])]),S).
   
   redex(fun(mas,[var(x),fun(mas,[var(y),fun(cero,[])])])).

   redex(fun(mas,[var(x),fun(por,[var(x),var(y)])])).

   unif(fun(mas,[var(x0),fun(suc,[var(x1)])]),fun(mas,[fun(por,[fun(suc,[fun(cero,[])]),fun(mas,[fun(cero,[]),fun(suc,[fun(cero,[])])])]),fun(suc,[fun(cero,[])])]),S).


   fun(mas,[fun(por,[fun(suc,[fun(cero,[])]),fun(mas,[fun(cero,[]),fun(suc,[fun(cero,[])])])]),fun(suc,[fun(cero,[])])])
   
   fun(mas,[fun(suc,[fun(cero,[])]),fun(por,[fun(suc,[var(x0)]),var(x1)])])

   fun(a,[fun(b,[fun(c,[])]),var(d)])

   fun(a,[var(d),fun(b,[fun(c,[])])])

   fun(a,[fun(b,[]),var(c)])

*/

/* Ejemplo del sistema de reescritura mencionado en el enunciado
*/

%redex( fun(mas,[ fun(por,[ fun(mas,[var(x1),var(x2)]) , fun(mas,[var(x3),var(x4)]) ]) , fun(por,[var(x5),var(x6)]) ]) , S ).

regla(1,fun(mas,[var(x0),fun(cero,[])]),var(x0)).

regla(2,fun(mas,[var(x0),fun(suc,[var(x1)])]),fun(suc,[fun(mas,[var(x0),var(x1)])])).

regla(3,fun(mas,[var(x0),var(x1)]),fun(mas,[var(x1),var(x0)])).

regla(4,fun(mas,[fun(mas,[var(x0),var(x1)]),var(x2)]),fun(mas,[var(x0),fun(mas,[var(x1),var(x2)])])).

regla(5,fun(por,[var(x0),fun(cero,[])]),fun(cero,[])).

regla(6,fun(por,[var(x0),fun(suc,[var(x1)])]),fun(mas,[var(x0),fun(por,[var(x0),var(x1)])])).

regla(7,fun(por,[var(x0),var(x1)]),fun(por,[var(x1),var(x0)])).

regla(8,fun(por,[fun(por,[var(x0),var(x1)]),var(x2)]),fun(por,[var(x0),fun(por,[var(x1),var(x2)])])).

regla(9,fun(por,[var(x0),fun(mas,[var(x1),var(x2)])]),fun(mas,[fun(por,[var(x0),var(x1)]),fun(por,[var(x0),var(x2)])])).

%pos(fun(mas,[fun(suc,[fun(cero,[])]),fun(por,[fun(suc,[var(x0)]),var(x1)])]),X).
