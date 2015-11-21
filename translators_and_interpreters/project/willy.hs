{-|	
      /Programa Principal - Willy/

	 Traductores e Interpretadores CI3725
	 10 de octubre de 2008
	 Equipo 7
	 Tamara Mendt 05-38546
	 Juan García 05-38207

	 Programa Principal para el analizador lexicográfico de Willy.
	 
	 Programa basado en el interpretador de la calculadora elaborado
	 por el Profesor Ernesto Hernández-Novich <emhn@usb.ve>
-}
module Main (getFilename, main) where

import System
import System.IO 
import Lexer
import Parser
import IO
import Directory

{-| @main@
   Función Principal, Main, del modulo Willy.
   
   La función main se encarga de la lectura del archivo de entrada, y
   de llamar la función lexer, la cual realizara el análisis lexicográfico
   del mismo. Primero se piden el nombre del archivo como argumento, para 
   abrirlo y luego proceder a realizar la lectura. En caso de error
   se maneja la excepción y el programa finaliza ofreciendo un mensaje
   de error.

-}
main :: IO()

main = do 
    args <- getArgs
    fileName <- getFilename args
    contents <-  catch (readFile fileName ) 
                       (\_ -> do putStrLn ("Imposible abrir el archivo " ++ fileName)
                                 exitWith ExitSuccess)
    print $ parser $ lexer contents

{-| @getFilename@

	La función getFilename extrae el archivo de texto que va a ser
	interpretado. En caso de que se pase como argumento por terminal,
	este lo lee y lo retorna a la función llamadora, en caso contrario,
	se despliega un prompt para que el usuario ingrese el nombre del
	archivo que desea interpretar.
-}
getFilename :: [String] -> IO String

getFilename args = if null(args)
   then do
    hSetBuffering stdout NoBuffering
    putStr "Archivo a Interpretar: "
    fileName <- getLine
    return fileName
   else do 
    return (head args)
