--ejercicio 1
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
absoluto :: Float -> Float 
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



