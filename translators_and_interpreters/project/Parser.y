{-|
    /Analizador Sintáctico para el lenguaje Willy/

    Traductores e Interpretadores CI3725
    
    Versión 1.0 2008-11-15
    
    
    GRUPO 7:
    
    05-38546 Tamara Mendt
    05-38207 Juan García
    
    
    Este módulo, desarrollado en Happy, implanta un Analizador
	Sintáctico para el lenguaje Willy. Además incluye un conjunto
	de rutinas Haskell para manipular una Tabla de Símbolos simple
	que	se utiliza para reconocer errores de contexto estático del
	lenguaje.
-}

{

module Parser (  
      -- * Funciones exportadas.
      -- ** Analizador Sintáctico con Análisis de Contexto Estático.
      parser 

) where
  
import Lexer
import Abstract
import qualified Data.Map as TS

}

%name parser
%error { parserError }
%tokentype { Token }
%token
    ';'                  { TkPuntoyComa p        }
    ','                  { TkComa p              }     
    int                  { TkNum p s             }
    beginworld           { Tkbeginworld p        }
    endworld             { Tkendworld p          }
    World                { TkWorld p             }
    Wall                 { TkWall p              }
    of                   { Tkof p                }
    to                   { Tkto p                }
    Place                { TkPlace p             }
    garbagecansin        { Tkgarbage p           }
    Startat              { Tkstart p             }
    heading              { Tkheading p           }
    north                { Tknorth p             }
    south                { Tksouth p             }
    east                 { Tkeast p              }
    west                 { Tkwest p              }
    beginworkon          { Tkbeginwork p         }
    endwork              { Tkendwork p           }
    if                   { Tkif p                }
    then                 { Tkthen p              }
    else                 { Tkelse p              }
    repeat               { Tkrepeat p            }
    times                { Tktimes p             }
    while                { Tkwhile p             }
    do                   { Tkdo p                }
    begin                { Tkbegin p             }
    end                  { Tkend p               }
    move                 { Tkmove p              }
    turnleft             { Tkturnleft p          }
    picktrash            { Tkpicktrash p         }
    droptrash            { Tkdroptrash p         }
    shutdown             { Tkshutdown p          }
    frontisclear         { Tkfrontisclear p      }
    leftisclear          { Tkleftisclear p       }
    rightisclear         { Tkrightisclear p      }
    lookingnorth         { Tklookingnorth p      }
    lookingeast          { Tklookingeast p       }
    lookingwest          { Tklookingwest p       }
    lookingsouth         { Tklookingsouth p      }
    foundtrash           { Tkfoundtrash p        }
    carryingtrash        { Tkcarryingtrash p     }
    not                  { Tknot p               }
    and                  { Tkand p               }
    or                   { Tkor p                }
    defineinstruction    { Tkdefineinstruction p }
    as                   { Tkas p                }
    Id                   { TkId p s              }

%left or
%left and 
%left not

%attributetype { miMundo a }
%attribute value { a }
%attribute id {}

%%

{-| 
     La Gramatica del lenguaje:

Por convencion, los simbolos no terminales utilizan letras en
mayuscula y los simbolos no terminales o tokens estan escritos
en letras minusculas    
-}

START       : START beginworld Id WORLD endworld                                 { insertIdMundo (toString $3) $4 $1 }
                     |START defineinstruction Id as INSTRUCTION                  { insertIdProc (toString $3) $5 $1 }
                     |START beginworkon Id INSTRUCTION endwork                   { checkIdWork (toString $3) $1 }
                     |beginworld Id WORLD endworld                               { insertIdMundo (toString $2) $3 TS.empty }
                     |defineinstruction Id as INSTRUCTION                        { insertIdProc (toString $2) $4 TS.empty }
                     |beginworkon Id INSTRUCTION endwork                         { checkIdWork (toString $2) TS.empty } 

WORLD       : SEENWORLD World EJEX EJEY                                           {  World1 $3 $4 $1 }
                     | SEENSTART Startat EJEX EJEY heading DIRECTION              {  Startat1 $3 $4 $6 $1 }
                     | WORLD WALLorPLACE                                          {  WallorPlace1 $2 $1 }

SEENWORLD       : SEENSTARTandWORLD Startat EJEX EJEY heading DIRECTION     {  Startat2 $3 $4 $6 $1 }
                     | SEENWORLD WALLorPLACE                                {  SeenWorld $2 $1 }
                     | Startat EJEX EJEY heading DIRECTION                  { Startat3 $2 $3 $5 }

SEENSTART      : SEENSTARTandWORLD World EJEX EJEY                          {  World2 $3 $4 $1 }
                     | SEENSTART WALLorPLACE                                {  SeenStart $2 $1 }
                     | World EJEX EJEY                                      { World3 $2 $3 }

SEENSTARTandWORLD      : SEENSTARTandWORLD WALLorPLACE                  {  SeenStartandWorld $2 $1 }
                             |WALLorPLACE                               { WallorPlace2 $1 }

WALLorPLACE      : Wall LISTAPARED                                    {  Wall $2  }
                     | Place LISTAGARBAGE                             {  Garbage $2  }

EJEX      : int                                               {  EjeX (toInt $1)  }

EJEY      : int                                               {  EjeY (toInt $1)  }

DIRECTION      : north                                              {  North  } 
                     | south                                        {  South  }
                     | east                                         {  East  }
                     | west			                                {  West  }

LISTAPARED  :  LISTAPARED ',' PARED                                 {$1 ++ [$3]}
              |PARED                                                {[$1]}

PARED      :  DIRECTION of EJEX EJEY to EJEX EJEY              {  Wall1 $1 $3 $4 $6 $7  }

LISTAGARBAGE:  LISTAGARBAGE ',' GARBAGE                           {$1 ++ [$3]}
              |GARBAGE                                            {[$1]}

GARBAGE      : int garbagecansin EJEX EJEY                        { Garbage1 (toInt $1) $3 $4  }

{-
     El error shift-reduce que tenemos se genera en esta regla, cuando se encuantra una
     sentencia IF ELSE, si se hace el shift se toma el ELSE correspondiente, pero si se hace
     reduce se toma solo el IF. Analizando el problema, y dado que Happy siempre se ira por
     la seleccion de shift, la cual es la que nos conviene, ese error no nos afecta en nada,
     dado que lo que debe hacerse es tomar el shift, para cuando existan sentencias IF ELSE, 
     tomar el caso verdadero y el caso en que no se cumpla la verificacion.
-}

INSTRUCTION      : begin LISTAINSTRUCTION end                     {  Begin $2  }
                     | INSTIF                                     {  NoElse $1  }
                     | INSTIF else INSTRUCTION                    {  Else $1 $3  }
                     | repeat int times INSTRUCTION               {  Repeat (toInt $2) $4  }
                     | while BOOL do INSTRUCTION                  {  While $2 $4  }
                     | move                                       {  Move  }
                     | turnleft                                   {  Turnleft  }
                     | picktrash                                  {  Picktrash  }
                     | droptrash                                  {  Droptrash  }
                     | shutdown                                   {  Shutdown  }
                     | Id                                         {  IdProc (toString $1)  }

INSTIF      : if BOOL then INSTRUCTION                          {  IfThen $2 $4  }

LISTAINSTRUCTION      : LISTAINSTRUCTION ';' INSTRUCTION        {  $1 ++ [$3] }
                     | INSTRUCTION                              {  [$1]  }

BOOL      :  BOOL or BOOL                                     {  Or $1 $3  }
           | BOOL and BOOL                                    {  And $1 $3 }
           | not BOOL                                         { Not $2 }
           | frontisclear                                     {  Frontisclear  }
           | leftisclear                                      {  Leftisclear  }
           | rightisclear                                     {  Rightisclear  }
           | lookingnorth                                     {  Lookingnorth  }
           | lookingsouth                                     {  Lookingsouth  }
           | lookingeast                                      {  Lookingeast  }
           | lookingwest                                      {  Lookingwest  }
           | foundtrash                                       {  Foundtrash  }
           | carryingtrash                                    {  Carryingtrash  }

{  


{-
	La funcion @insertIdMundo@ permite agregar un identificador del Mundo
	a la tabla de simbolos. Recibe el String que representa el identificador,
	un tipo de dato WORLD y la tabla de simbolos. Retorna la tabla de simbolos
	con el nuevo identificador. En caso de que el identificador exista, 
	la funcion retorna un mensaje de error, indicando que el identificador 
	ya fue declarado
-}

insertIdMundo :: String -> WORLD -> TS.Map String Symbol -> TS.Map String Symbol
insertIdMundo id w t  =
	if TS.member id t
	then error ("Error: Variable " ++ id ++ " ha sido redefinida!")
	else TS.insert id (Just w,Nothing) t		

{-
     La funcion @insertIdProc@ permite insertar un identificador de un
     procedimiento. Recibe un String que represente al identificador,
     un tipo de dato INSTRUCTION y la tabla de simbolos. Retorna la 
     tabla de simbolos con el nuevo identificador. En caso de que el
     identificador exista, la funcion retorna un mensaje de error, 
     indicando que el identificador ya fue declarado

-}
insertIdProc :: String -> INSTRUCTION -> TS.Map String Symbol -> TS.Map String Symbol
insertIdProc id inst t  =
	if TS.member id t
	then error ("Error: Variable " ++ id ++ " ha sido redefinida!")
	else TS.insert id (Nothing,Just inst) t

{-
     La funcion @checkIdWork@ permite verificar si un identificador de un
     Mundo existe ya declarado en la tabla de simbolos. 
     Recibe un String que represente al identificador, y la tabla de simbolos. 
     Retorna la misma tabla de simbolos. En caso de que el
     identificador ya exista, la funcion retorna un mensaje de error, 
     indicando que el identificador del Mundo no ha sido declarado aun.

-}	
checkIdWork :: String -> TS.Map String Symbol -> TS.Map String Symbol
checkIdWork id t =
    if TS.member id t 
    then t
    else error ("Error: La variable "++ id ++" no ha sido declarada!")

{-
     La funcion @checkIdInst@ permite verificar si un identificador de un
     Procedimiento existe ya declarado en la tabla de simbolos. 
     Recibe un String que represente al identificador, y la tabla de simbolos. 
     Retorna la misma tabla de simbolos. En caso de que el
     identificador ya exista, la funcion retorna un mensaje de error, 
     indicando que el identificador del Procedimiento no ha sido declarado aun.

-}   
checkIdInst :: String -> TS.Map String Symbol -> TS.Map String Symbol
checkIdInst id t =
    if TS.member id t 
    then t
    else error ("Error: La variable "++ id ++" no ha sido declarada!")

{-
     La funcion @toString@ permite convertir un Token en un String.
     Recibe el tipo Token y devuelve el String correspondiente

-}
toString :: Token -> String
toString (TkId p s) = s

{-
     La funcion @toInt@ permite convertir un Token en un Int.
     Recibe el tipo Token y devuelve el Int correspondiente

-}
toInt :: Token -> Int
toInt (TkNum p s) = s	

{-
     La funcion @parserError@ indica cuando en el programa escrito
     existe un error de sintaxis. Es decir, que la utilizacion de los
     tokens, o palabras reservadas no estan en un orden correcto, de
     acuerdo con las especificaciones del lenguaje.

-}
parserError :: [Token] -> a
parserError (t:ts) = error $ 
                       "Error de sintaxis en el Token " ++ (show t) ++ "\n"

}
