{-|
    /Tabla de Simbolos y Arbol para el lenguaje Willy/

    Traductores e Interpretadores CI3725
    
    Versión 1.0 2008-11-15
    
    
    GRUPO 7:
    
    05-38546 Tamara Mendt
    05-38207 Juan García
    
    
    Este módulo, desarrollado en Happy, implanta una Tabla de 
	Simbolos para el lenguaje Willy. Incluye la declaracion de
	todos los TADs necesarios para la construccion del Arbol Sintactico.
-}
module Abstract (
     -- * Tipos exportados.
     -- ** Mundo ( El mundo donde habita Willy )
     WORLD (..),
     -- ** Declara funciones del Mundo
     SEENWORLD (..),
     -- ** Declara funciones del Mundo
     SEENSTART (..),
     -- ** Declara funciones del Mundo
     SEENSTARTandWORLD (..),
     -- ** Coloca Paredes o Basura
     WALLorPLACE (..),
     -- ** Representa la coordenada X del Mundo
     EJEX (..),
     -- ** Representa la coordenada Y  del Mundo
     EJEY (..),
     -- ** Direccion en que es colocado Willy
     DIRECTION (..),
     -- ** Pared colocada en el Mundo
     PARED (..),
     -- ** Lista de Paredes colocadas en el Mundo
     LISTAPARED,
     -- ** Basura colocada en el Mundo
     GARBAGE (..),
     -- ** Lista de Basuras colocadas en el Mundo
     LISTAGARBAGE,
     -- ** Instruccion de Willy
     INSTRUCTION (..),
     -- ** Lista de Instrucciones de Willy
     LISTAINSTRUCTION ,
     -- ** Instrucciones en una sentencia  IF
     INSTIF (..),
     -- ** Booleano definido en el lenguaje
     BOOL (..),
     -- ** Tabla de Simbolos
     Abstract,
     -- ** Tipo Symbol de la tabla de simbolos
     Symbol,
     
      
) where 

import Lexer

{-|
     El tipo de datos @WORLD@ permite representar el mundo de Willy,
     se definen las coordenadas del mundo. Ademas permite
     establecer la posicion inicial de Willy, o si se desea
     colocar una pared o una basura 
-}
data WORLD = World1 EJEX EJEY SEENWORLD
             |  Startat1 EJEX EJEY DIRECTION SEENSTART
             |  WallorPlace1 WALLorPLACE WORLD
             deriving (Eq,Show)

{-|
     El tipo de datos @SEENWORLD@ permite  representar el mundo de Willy,
     se definen las coordenadas del mundo. Ademas permite
     establecer la posicion inicial de Willy, o si se desea
     colocar una pared o una basura 
-}
data SEENWORLD = Startat2 EJEX EJEY DIRECTION SEENSTARTandWORLD
              |  SeenWorld WALLorPLACE SEENWORLD
              |  Startat3 EJEX EJEY DIRECTION
              deriving (Eq,Show)

{-|
     El tipo de datos @SEENSTART@ permite representar el mundo de Willy,
     se definen las coordenadas del mundo. Ademas permite
     establecer la posicion inicial de Willy, o si se desea
     colocar una pared o una basura 
-}
data SEENSTART = World2 EJEX EJEY SEENSTARTandWORLD
              |  SeenStart WALLorPLACE SEENSTART
              |  World3 EJEX EJEY
              deriving (Eq,Show) 

{-|
     El tipo de datos @SEENSTARTandWORLD@ permite
     colocar una pared o una basura. O una lista de
     las mismas
-}
data SEENSTARTandWORLD = SeenStartandWorld WALLorPLACE SEENSTARTandWORLD
              |  WallorPlace2 WALLorPLACE
              deriving (Eq,Show)

{-|
     El tipo de datos @WALLorPLACE@ permite
     colocar una pared o una basura. O una lista de
     las mismas
-}
data WALLorPLACE = Wall LISTAPARED
               |  Garbage LISTAGARBAGE
               deriving (Eq,Show)

{-|
     El tipo de datos @EJEX@ representa la coordenada X
     de una ubicacion de mundo, pared, basura, Willy, etc
-}
data EJEX = EjeX Int
              deriving (Eq,Show)


{-|
     El tipo de datos @EJEY@ representa la coordenada Y
     de una ubicacion de mundo, pared, basura, Willy, etc
-}                 
data EJEY = EjeY Int
              deriving (Eq,Show)

{-|
     El tipo de dato @DIRECTION@ representa la direccion
     de cualquier pared o del robot Willy dentro del Mundo
-}
data DIRECTION = North
              |  South
              |  East
              |  West
              deriving (Eq,Show)
          
{-|
     El tipo de dato @PARED@ representa una pared colocada
     en el mundo de Willy
-}
data PARED = Wall1 DIRECTION EJEX EJEY EJEX EJEY         
              deriving (Eq,Show)

{-|
     El tipo de dato @LISTAPARED@ representa una lista de
     paredes dentro del mundo de Willy
-}              
type LISTAPARED = [PARED]              

{-|
     El tipo de dato @GARBAGE@ representa una basura colocada
     en el mundo de Willy
-}
data GARBAGE = Garbage1 Int EJEX EJEY         
              deriving (Eq,Show)
{-|
     El tipo de dato @LISTAGARBAGE@ representa una lista de
     basuras colcadas dentro del mundo de Willy
-}              
type LISTAGARBAGE = [GARBAGE]              
         
{-|
     El tipo de dato @INSTRUCTION@ representa una Instruccion a
     ejecutar por el robot Willy
-}
data INSTRUCTION = Begin LISTAINSTRUCTION
              |  NoElse INSTIF
              |  Else INSTIF INSTRUCTION
              |  Repeat Int INSTRUCTION
              |  While BOOL INSTRUCTION
              |  Move
              |  Turnleft
              |  Picktrash
              |  Droptrash
              |  Shutdown
              |  IdProc String
              deriving (Eq,Show)

{-|
     El tipo de dato @LISTAINSTRUCTION@ representa una lista de
     instrucciones del robot Willy
-}
type LISTAINSTRUCTION = [INSTRUCTION]             	
   
{-|
     El tipo de dato @INSTIF@ representa una instruccion en una 
     sentencia IF
-}
data INSTIF = IfThen BOOL INSTRUCTION
              deriving (Eq,Show)

{-|
     El tipo de dato @BOOL@ representa un booleano o una
     verificacion dentro del lenguaje de Willy
-}
data BOOL = Or BOOL BOOL
              |  And BOOL BOOL
              |  Not BOOL
              |  Frontisclear
              |  Leftisclear
              |  Rightisclear                                              
              |  Lookingnorth                                               
              |  Lookingsouth                                               
              |  Lookingeast                                                
              |  Lookingwest                                                
              |  Foundtrash                                                 
              |  Carryingtrash
              deriving (Eq,Show)

{-|
     El tipo de dato @Symbol@ representa un simbolo dentro
     de la tabla de simbolos
-}
type Symbol = (Maybe WORLD,Maybe INSTRUCTION)

{-|
     El tipo de dato @Abstract@ representa la tabla de simbolos
     del analizador sintactico
-}
type Abstract = [ (String,Symbol) ]
