{
{-| 
   /Analizador Lexicográfico para el programa Willy/

                Traductores e Interpretadores CI3725

                10 de octubre de 2008
                Grupo 7
                Juan García 05-38207
                Tamara Mendt 05-38546

        Este módulo está desarrollado en Alex y se basó en el Analizador
        Lexicográfico para el lenguaje Minilogo escrito y publicado por 
        el profesor Ernesto Hernández Novich.
-}
module Lexer (Token(..), processInput, lyc, lexer) where
}

%wrapper "posn"

$digito = 0-9                  	-- un dígito
$letra = [a-zA-Z]               -- una letra del alfabeto

tokens :-

	$white+                                                 ;
	"--".*                                                  ;
	"{{"(((\{[^\{]|[^\{])|\n)*|\{)"}}"                      ;
    \;                                                      { \p s -> TkPuntoyComa (lyc p)}
    \,                                                      { \p s -> TkComa (lyc p)}
	$digito+                                                { \p s -> TkNum (lyc p) (read s) }
	begin\-world                                            { \p s -> Tkbeginworld (lyc p) }
	end\-world                                              { \p s -> Tkendworld (lyc p) }
	World                                                   { \p s -> TkWorld (lyc p) }
	Wall                                                    { \p s -> TkWall (lyc p) }
	of                                                      { \p s -> Tkof (lyc p) }
	to                                                      { \p s -> Tkto (lyc p) }
	Place                                                   { \p s -> TkPlace (lyc p) }
	garbage$white+cans$white+in                             { \p s -> Tkgarbage (lyc p) }
	Start$white+at                                          { \p s -> Tkstart (lyc p) }
	heading                                                 { \p s -> Tkheading (lyc p) }
	north                                                   { \p s -> Tknorth (lyc p) }
	south                                                   { \p s -> Tksouth (lyc p) }
	east                                                    { \p s -> Tkeast (lyc p) }
	west                                                    { \p s -> Tkwest (lyc p) }
	begin\-work$white+on                                    { \p s -> Tkbeginwork (lyc p) }
	end\-work                                               { \p s -> Tkendwork (lyc p) }
	if                                                      { \p s -> Tkif (lyc p) }
	then                                                    { \p s -> Tkthen (lyc p) }
	else                                                    { \p s -> Tkelse (lyc p) }
	repeat                                                  { \p s -> Tkrepeat (lyc p) }
	times                                                   { \p s -> Tktimes (lyc p) }
	while                                                   { \p s -> Tkwhile (lyc p) }
	do                                                      { \p s -> Tkdo (lyc p) }
	begin                                                   { \p s -> Tkbegin (lyc p) }
	end                                                     { \p s -> Tkend (lyc p) }
	move                                                    { \p s -> Tkmove (lyc p) }
	turnleft                                                { \p s -> Tkturnleft (lyc p) }
	pick\-trash                                             { \p s -> Tkpicktrash (lyc p) }
	drop\-trash                                             { \p s -> Tkdroptrash (lyc p) }
	shutdown                                                { \p s -> Tkshutdown (lyc p) }
	front\-is\-clear                                    	{ \p s -> Tkfrontisclear (lyc p) }
	left\-is\-clear                                         { \p s -> Tkleftisclear (lyc p) }
	right\-is\-clear                                    	{ \p s -> Tkrightisclear (lyc p) }
	looking\-north                                          { \p s -> Tklookingnorth (lyc p) }
	looking\-east                                           { \p s -> Tklookingeast (lyc p) }
	looking\-west                                           { \p s -> Tklookingwest (lyc p) }
	looking\-south                                          { \p s -> Tklookingsouth (lyc p) }
	found\-trash                                            { \p s -> Tkfoundtrash (lyc p) }
	carrying\-trash                                         { \p s -> Tkcarryingtrash (lyc p) }
	not                                                     { \p s -> Tknot (lyc p) }
	and                                                     { \p s -> Tkand (lyc p) }
	or                                                      { \p s -> Tkor (lyc p) }
	define\-instruction                                    	{ \p s -> Tkdefineinstruction (lyc p) }
	as                                                      { \p s -> Tkas (lyc p) }
	$letra [ $letra $digito \_ ]*                           { \p s -> TkId (lyc p) s }

{

{-|
    El tipo de datos @Token@ representa los diferentes tokens
    producidos por el Analizador Lexicográfico. Cada token va
    acompañado de una tupla de enteros, cuyos componentes 
    denotan la línea y columna, respectivamente, en la cual se
    encontró el token dentro del archivo procesado. Para aquellos
    tokens que lo ameriten, se agrega el lexema convertido al tipo
    deseado.
-}
data Token = 

                  TkPuntoyComa (Int,Int) |         -- ^ Separador de instrucciones en un bloque
                  TkComa (Int,Int) |                -- ^ Separador de atributos en un Place
                  TkNum (Int,Int)  Int |       -- ^ Número entero
                  Tkbeginworld (Int,Int) |         -- ^ Palabra reservada @beginworld@.
                  Tkendworld (Int,Int) |           -- ^ Palabra reservada @endworld@.
                  TkWorld (Int,Int) |              -- ^ Instrucción de creación de mundo @World@.
                  TkWall (Int,Int) |               -- ^ Instrucción de construcción de paredes @Wall@.
                  Tkof (Int,Int) |                 -- ^ Palabra reservada @of@.
                  Tkto (Int,Int) |                 -- ^ Palabra reservada @to@.
                  TkPlace (Int,Int) |              -- ^ Instrucción para colocar pipote de basura @Place@
                  Tkgarbage (Int,Int) |            -- ^ Palabra reservada @garbage@
                  Tkcans (Int,Int) |               -- ^ Palabra reservada @cans@
                  Tkin (Int,Int) |                 -- ^ Palabra reservada @in@
                  Tkstart (Int,Int) |              -- ^ Instrucción para determinar posición inicial de Willy @Start@
                  Tkat (Int,Int) |                 -- ^ Palabra reservada @at@
                  Tkheading (Int,Int) |            -- ^ Palabra reservada @heading@
                  Tknorth (Int,Int) |              -- ^ Dirección norte @north@
                  Tksouth (Int,Int) |              -- ^ Dirección sur @south@
                  Tkeast (Int,Int) |               -- ^ Dirección este @east@
                  Tkwest (Int,Int) |               -- ^ Dirección oeste @west@
                  Tkbeginwork (Int,Int) |          -- ^ Instrucción que indica el comienzo de un bloque de instrucciones
                                                   -- ^ para Willy @begin-work@
                  Tkon (Int,Int) |                 -- ^ Palabra reservada @on@
                  Tkendwork (Int,Int) |            -- ^ Intrucción que indica el final de un bloque de instrucciones para
                                                   -- ^ Willy @end-work@
                  Tkif (Int,Int) |                 -- ^ Instrucción condicional @if@
                  Tkthen (Int,Int) |               -- ^ Instrucción condicional @then@
                  Tkelse (Int,Int) |               -- ^ Instrucción condicional @else@
                  Tkrepeat (Int,Int) |             -- ^ Iteración acotada @repeat@
                  Tktimes (Int,Int) |              -- ^ Iteración acotada @times@
                  Tkwhile (Int,Int) |              -- ^ Iteración abierta @while@
                  Tkdo (Int,Int) |                 -- ^ Palabra reservada @do@
                  Tkbegin (Int,Int) |              -- ^ Instrucción que indica el comienzo de una instrucción compuesta @begin@
                  Tkend (Int,Int) |                -- ^ Instrucción que indica el final de una instrucción compuesta @end@
                  Tkmove (Int,Int) |               -- ^ Instrucción para Willy de moverse hacia la dirección a la que se 
                                                   -- ^ encuentra dirigido @move@
                  Tkturnleft (Int,Int) |           -- ^ Instrucción de girar a la izquierda @turnleft@
                  Tkpicktrash (Int,Int) |          -- ^ Instrucción de recojer pote de basura @picktrash@
                  Tkdroptrash (Int,Int) |          -- ^ Instrucción de soltar pote de basura @droptrash@
                  Tkshutdown (Int,Int) |           -- ^ Instrucción para apagar a Willy @shutdown@
                  Tkfrontisclear (Int,Int) |       -- ^ Expresión booleana que es true si Willy puede avanzar hacia
                                                   -- ^ el frente @front-is-clear@
                  Tkleftisclear (Int,Int) |        -- ^ Expresión booleana que es true si Willy puede avanzar hacia
                                                   -- ^ la izquierda @left-is-clear@ 
                  Tkrightisclear (Int,Int) |       -- ^ Expresión booleana que es true si Willy puede avanzar hacia
                                                   -- ^ la derecha @right-is-clear@ 
                  Tklookingnorth (Int,Int) |       -- ^ Expresión booleana que es true si Willy está dirigido hacia
                                                   -- ^ el norte @looking-north@
                  Tklookingeast (Int,Int) |        -- ^ Expresión booleana que es true si Willy está dirigido hacia
                                                   -- ^ el este @looking-east@
                  Tklookingwest (Int,Int) |        -- ^ Expresión booleana que es true si Willy está dirigido hacia
                                                   -- ^ el oeste @looking-west@ 
                  Tklookingsouth (Int,Int) |       -- ^ Expresión booleana que es true si Willy está dirigido hacia
                                                   -- ^ el sur @looking-south@ 
                  Tkfoundtrash (Int,Int) |         -- ^ Expresión booleana que es true si Willy está en una posición
                                                   -- ^ con al menos un pipote de basura @found-trash@
                  Tkcarryingtrash (Int,Int) |      -- ^ Expresión booleana que es true si Willy lleva al menos un
                                                   -- ^ pipote de basura en su contenedor @carrying-trash@
                  Tknot (Int,Int) |                -- ^ Operador lógico negado @not@
                  Tkand (Int,Int) |                -- ^ Operador lógico y @and@
                  Tkor (Int,Int) |                 -- ^ Operador lógico o @or@
                  Tkdefineinstruction (Int,Int) |  -- ^ Definición de procedimiento @define-instruction@
                  Tkas (Int,Int) |                 -- ^ Palabra reservada @as@
                  TkId (Int,Int) String            -- ^ Identificador alfanumérico
                  deriving (Eq, Show)
                  
                 
{-|
    La función @lexer@ encapsula el uso del Analizador Lexicográfico
    Recibe como único argumento un String que, en teoría, ha sido leído
    desde un archivo. A partir del String produce una lista de tokens
    a medida que los va procesando. 
      - Si no consigue errores, retorna la lista de tokens reconocidos
      - Si consigue uno o más errores lexicográficos, reporta en la pantalla los errores encontrados
        y el programa termina su ejecución sin mostrar ninguno de los tokens reconocidos.
-}
lexer :: String                  -- ^ Cadena de caracteres el archivo que se va a recorrer para procesar tokens.
              -> [Token]         -- ^ Lista resultante de tokens.

lexer s = 	if null(errores) then tokens
                  	else
                                    error (concat errores)
                                    where
                                    	(tokens,errores) = processInput s

{-|
    La función @processInput@ recibe como único argumento un String, el mismo que la función @lexer@.
    Crea 2 cadenas de String, una que estará conformada por los tokens procesados y la otra por los
    caracteres que no se pueden identificar como tokens (errores) hallados. Para lograr esto utiliza
    la función auxiliar ´go´. 

    La función go es invocada utilizando la posición inicial del
    archivo con la cadena completa, y una tupla con dos listas
    vacías, indicando el estado inicial: no hemos reconocido ningún
    token, no hemos encontrado ningún error.
    
    En cada paso de la función go se utiliza alexScan sobre lo que 
    no se ha procesado de la cadena de entrada y pueden ocurrir cuatro
    casos:

    1) Se acaba el string (AlexEOF). En este caso sólo se retorna la tupla
       con los tokens reconocidos y los errores encontrados.
    2) Se encuentra un caracter que puede ser ignorado. En este caso se llama
       recursivamente a la función go utilizando los mismos tokens y errores
       hallados hasta ese momento.
    3) Se encuentra un token válido. En este caso hay que retornar una tupla 
       construida de la siguiente manera: 
          - se ejecuta la acción sobre el segmento de cadena de entrada que
            corresponde al lexema.
          - se invoca recursivamente a go con lo que queda de la cadena de
            entrada.
          - se coloca el token al principio de la lista de tokens de la tupla
            y se preserva la misma lista de errores.
    4) Se encuentra un caracter ilegal, que no corresponde con algún token. En
       este caso hay que retornar una tupla construida de la siguiente forma:
          - se invoca recursivamente a ´go´ con el resto de la cadena de entrada
            para ver si se consiguen más errores o tokens. Para no perder la
            posición que se tiene en la cadena de entrada, se usa la función
            alexMove, que convierte el AlexPosition anterior en uno actualizado.
          - se prepara un mensaje de error que incluye el caracter que produjo
            el error y la posición del mismo. De esto se encarga la función
            auxiliar local addError.
    -}
processInput :: String                -- ^ Cadena de caracteres donde se desea reconocer tokens.
              -> ([Token],[String])   -- ^ Tupla de 2 cadenas de caracteres: 
                                      -- ^ La primera cadena contiene los tokens identificados.
                                      -- ^ La segunda cadena contiene aquellos elementos que no son tokens (o errores de
                                      -- ^ sintaxis)

processInput str = go (alexStartPos,'\n',str) ([],[])
           where 
           go inp@(pos,_,str) (ts,es) = case alexScan inp 0 of

                  AlexEOF -> (ts,es)
                  AlexSkip inp' len -> go inp' (ts,es)
                  AlexToken inp' len act -> (tsf,esf) 
                    where
                      (ts',esf) = go inp' (ts,es)
                      tsf = act pos (take len str) : ts'
                  AlexError inp' -> (tsf,esf)
                    where
                       (tsf,es') = go (skipChar inp') (ts,es)
                       esf = addError inp' es'
                       skipChar (p,c,s) = (alexMove p (head s),c,(tail s))
                       addError (p,_,s) es = m : es
                         where
                           (l,c) = lyc p
                           m = "\nError (Lexer): Caracter ilegal '" ++ [ head s ] ++"' encontrado en linea " ++ (show l) ++", columna " ++ (show c) ++ "."

{-|
    Al final, cada token que se muestra va acompañado de la línea y la columna donde fue reconocido.
    Esto se puede lograr gracias al uso del wrapper 'posn' que genera el desplazamiento absoluto de
    cada token dentro del archivo. La función @lyc@ ("linea y columna") es la que extrae la línea y la
    columna de los tokens.
 -}

lyc :: AlexPosn -> (Int,Int)

lyc (AlexPn _ l c) = (l,c)

}
