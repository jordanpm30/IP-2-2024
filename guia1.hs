--ejercicio 1
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
import GHC.RTS.Flags (RTSFlags(profilingFlags))
{-# HLINT ignore "Use even" #-}
f 1 = 8
f 4 = 131
f 16 = 16
g 8 = 16
g 16 = 4
g 131 = 1
h x = f (g x)
k x = g (f x )
--------------------------------------------------------------------       
{-comentario largo-}
--ejercicio 2
-- ej 2 
absoluto :: Integer  -> Integer
absoluto n | n == 0 = 0
           | n > 0 = n
           | n < 0 = -n
--B
maximoAbsoluto :: Integer -> Integer -> Integer
maximoAbsoluto x y | x > y = x
                   | x < y = y
                   | otherwise = x
--C 
maximo3 :: Integer -> Integer -> Integer -> Integer
maximo3 x y z
              | x >= y && x >= z  = x
              | y >= x && y >= z  = y
              | z >= x && z >= y  = z
              | otherwise = x
algunoEso0 :: Integer -> Integer -> Bool
algunoEso0 _ 0 = True
algunoEso0 0 _ = True
algunoEso0 _ _ = False

ambosSon0 :: Integer -> Integer -> Bool
ambosSon0 0 0 = True
ambosSon0 _ _ = False

mismoIntervalo :: Integer -> Integer -> Bool
mismoIntervalo x y | (x <= 3 &&  y <= 3) || ((3 < x && x <= 7) && (3 < y && y <= 7) ) || ((7 < x ) && (7 < y ) ) = True
                   | otherwise = False

sumaDistintos :: Integer -> Integer -> Integer -> Integer
sumaDistintos x y z | x == y && x == z = x
                    | x /= y && x == z = x + y
                    | x == y && x /= z = x + z
                    | y == x && y /= z = y + z
                    | y /= x && y == z = y + x
                    | z == x && z /= y = z + y
                    | z /= x && y == z = z + x
                    | otherwise = x + y + z

esMultiplos :: Integer -> Integer -> Bool
esMultiplos x y | mod x y == 0 = True
                | otherwise = False

digitoUnidades :: Integer -> Integer
digitoUnidades x
                 | x < 9 = x
                 | otherwise = mod x 10

digitoUnidadesBis :: Integer -> Integer
digitoUnidadesBis x = mod x 10

digitoDecenas :: Integer -> Integer
digitoDecenas x = mod (div x 10) 10
--------------------------------------------------------------------
--ejercicio 3 
estanRelacionados :: Integer -> Integer -> Bool
estanRelacionados x y | mod x y == 0 = True
                      | otherwise = False
--------------------------------------------------------------------
--ejercicio 4
--a)
prodInt :: (Float,Float) -> (Float,Float)  -> Float
prodInt (x,y) (a,b) = x * a + y * b
--b)
todoMenor :: (Float,Float) -> (Float,Float) -> Bool
todoMenor (x,y) (a,b) = x < a && y < b
--c)verificar 
distanciaPuntos :: (Float,Float) -> Float
distanciaPuntos (x,y) = sqrt (x^2+ y^2)
--d)
sumaTerna :: (Float,Float,Float) -> Float
sumaTerna (x,y,z) = x + y + z
--e)
sumarSoloMultiplos :: (Integer,Integer,Integer) -> Integer -> Integer
sumarSoloMultiplos (x,y,z) n | mod x n == 0 && mod y n == 0 && mod z n == 0 = x + y + z
                             | mod x n == 0 && mod y n == 0 && mod z n /= 0 = x + y
                             | mod y n == 0 && mod z n == 0 && mod x n /= 0 = y + z
                             | mod x n == 0 && mod z n == 0 && mod y n /= 0 = x + z
                             | otherwise = 0
--f)
posPrimerPar :: (Integer,Integer,Integer) -> Integer
posPrimerPar (x,y,z) | mod x 2 == 0 = x
                     | mod y 2 == 0 = y
                     | mod z 2 == 0 = z
                     | otherwise = 4
--g)
crearPar :: a -> b -> (a,b)
crearPar x y = (x,y)
--h) 
invertir :: (a,b) -> (b,a)
invertir (x,y) = (y,x)
--i)para poder definir un nombre
type Punto2D = (Float, Float)
    --a)
prodIntBis :: Punto2D -> Punto2D  -> Float
prodIntBis (x,y) (a,b) = x * a + y * b
    --b)
todoMenorBis :: Punto2D -> Punto2D -> Bool
todoMenorBis (x,y) (a,b) = x < a && y < b
    --c)verificar 
distanciaPuntosBis :: Punto2D -> Float
distanciaPuntosBis (x,y) = sqrt (x^2+ y^2)
--------------------------------------------------------------------
--ejercicio 5 (escribo asi tal cual = "div 50 2" = 25)
problemaG :: Integer -> Integer
problemaG x | mod x 2 == 0 = div x 2
            | otherwise = 3*x + 1
problemaF :: Integer -> Integer
problemaF x | x <= 7 = x ^ 2
            | x >  7 = 2 * x -1
todosMenores :: (Integer,Integer,Integer) -> Bool
todosMenores (x,y,z) = (problemaF x > problemaG x) && (problemaF y > problemaG y) &&  (problemaF z > problemaG z)
{-
todosMenores (0,0,0) = 0 > 0 && 0 > 0 && 0 > 0 = True 
todosMenores (1,1,1) = 1 > 4 &&                = False
todosMenores (2,2,2) = 4 > 1 && 4 > 1 && 4 > 1 = True
todosMenores (3,3,3) = 9 > 10                  = True
todosMenores (8,8,8) =15 > 4 &&15 > 4 &&15 > 4 =  = True
-}
--------------------------------------------------------------------
--ejercicio 6
type Anio = Integer
type EsBisiesto = Bool

bisiesto :: Anio -> EsBisiesto
bisiesto x = mod x 4 == 0 && mod x 100 /= 0 || mod x 400 == 0
{-
bisiesto 1901  False, bisiesto 1904 ⇝ True,
bisiesto 1900  False, bisiesto 2000 ⇝ True
-}
--------------------------------------------------------------------
--ejercicio 7
distanciaManhattan :: (Float,Float,Float) -> (Float,Float,Float) -> Float
distanciaManhattan (x,y,z) (a,b,c) = a + b + c - (x + y + z )
{-
distanciaManhattan (2,3,4) (7,3,8) 
9.0
distanciaManhattan ((-1),0,(-8.5)) (3.3,4,(-4))
12.8
-}
type Coordenada3d = (Float,Float,Float)
distanciaManhattanBis :: Coordenada3d -> Coordenada3d -> Float
distanciaManhattanBis (x,y,z) (a,b,c) = a + b + c - (x + y + z )

--------------------------------------------------------------------
--ejercicio 8
sumaUltimosDosDigitos :: Integer -> Integer
sumaUltimosDosDigitos x = mod (absoluto x) 10 + mod (div (absoluto x ) 10) 10
comparar :: Integer -> Integer -> Integer 
comparar x y | sumaUltimosDosDigitos x < sumaUltimosDosDigitos y  = 1 
             | sumaUltimosDosDigitos x > sumaUltimosDosDigitos y  = -1 
             | sumaUltimosDosDigitos x == sumaUltimosDosDigitos y = 0 
--------------------------------------------------------------------
--ejercicio 9 nose xd 
{-
a) 
f1 :: Float -> Float
f1 n | n == 0 = 1
     | otherwise = 0
     Rta = si es 0 es uno si es cualquier otro num es 0 
b) 
f2 :: Float -> Float
f2 n | n == 1 = 15
     | n == -1 = -15
     Rta = si es 1 = 15 y si es negativo el res tambien 
c) 
f3 :: Float -> Float
f3 n | n <= 9 = 7
     | n >= 3 = 5
     Res = aca haskell lee de arriba hacia abajo asi que si es 8 seria 7 
d) 
f4 :: Float -> Float -> Float
f4 x y = ( x + y )/2
     Res = como lo dice una div
e) 
f5 :: ( Float , Float ) -> Float
f5 (x , y ) = ( x + y )/2
     Res = lo mismo pero en vez de variables solas son tuplas 
f) 
f6 :: Float -> Int -> Bool
f6 a b = truncate a == b
     res = truncamiento de a  es igual a b ej f6 3.999 3 = True 
-}
