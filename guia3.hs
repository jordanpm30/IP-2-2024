--ejercicio 1A
longitud :: [Integer] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + longitud xs 


--ejercicio 1B
ultimo :: [Integer] -> Integer
ultimo [x] = x
ultimo (x:xs) = ultimo xs


--ejercicio 1C
principio :: [Integer] -> [Integer]
principio [x] = []
principio (x:xs) = [x]++ principio xs


--ejercicio 1D
reverso :: [Integer] -> [Integer]
reverso [x] = [x]
reverso (x:xs) = reverso xs  ++ [x]
--float -> Integer            FromIntegral
--ejercicio 2A
pertenece :: Integer -> [Integer] -> Bool
pertenece _ [] = False
pertenece e (x:xs) | e == x = True
                  | otherwise = pertenece e xs
--ejercicio 2B
todosIguales :: [Integer] -> Bool
todosIguales [x] = True
todosIguales (x:y:xs) | x == y = todosIguales (y:xs)
                     |otherwise = False


--ejercicio 2C
todosDistintos :: [Integer] -> Bool
todosDistintos [x] = True
todosDistintos (x:y:xs)  | pertenece x (y:xs) = False
                        | otherwise = todosDistintos (y:xs)


--ejercicio 2D
hayRepetidos :: [Integer] ->Bool
hayRepetidos [x] = False
hayRepetidos (x:y:xs) | pertenece x (y:xs) = True
                     | otherwise = hayRepetidos (y:xs)


--ejercicio 2E
quitar :: Integer -> [Integer] -> [Integer]
quitar e [] = []
quitar e (x:xs) | e == x = xs
               | otherwise = x : quitar e xs


--ejercicio 2F
quitarTodos :: Integer -> [Integer] -> [Integer]
quitarTodos e [] = []
quitarTodos e (x:xs) | e == x = quitarTodos e xs
                    | otherwise = x : quitarTodos e xs


--ejercicio 2G
eliminarRepetidos :: [Integer] -> [Integer]
eliminarRepetidos [] = []
eliminarRepetidos (x:xs) | pertenece x xs = x : eliminarRepetidos (quitarTodos x xs)
                        | otherwise = x : eliminarRepetidos xs




--preguntar despues
--ejercicio 2H
mismosElementos :: [Integer] -> [Integer] -> Bool
mismosElementos [] [] = True
mismosElementos (x:xs) l | longitud (eliminarRepetidos (x:xs)) /= longitud (eliminarRepetidos l) = False
                        | pertenece x l = mismosElementos (quitarTodos x (x:xs)) (quitarTodos x l)
                        | otherwise = False
--ejercicio 2I
capicua :: [Integer] -> Bool
capicua [] = True
capicua l | l == reverso l = True
         | otherwise = False


--ejercicio 3A
sumatoria :: [Integer] -> Integer
sumatoria [x] = x
sumatoria (x:xs) = x + sumatoria xs


--ejercicio 3B
productoria :: [Integer] -> Integer
productoria [x] = x
productoria (x:xs) = x * productoria xs


--ejercicio 3C
maximo :: [Integer] -> Integer
maximo [x] = x
maximo (x:y:xs) | x > y = maximo (x:xs)
               |otherwise = maximo (y:xs)


--ejercicio 3D
sumarN :: Integer -> [Integer] -> [Integer]
sumarN n [] = []
sumarN n (x:xs) = (n+x) : sumarN n xs 


--ejercicio 3E
sumarElPrimero :: [Integer] -> [Integer]
sumarElPrimero [] = []
sumarElPrimero (x:xs) = sumarN x (x:xs)


--ejercicio 3F
sumarElUltimo :: [Integer] -> [Integer]
sumarElUltimo [] = []
sumarElUltimo l = sumarN (ultimo l )l


--ejercicio 3G
pares :: [Integer] -> [Integer]
pares [] = []
pares (x:xs) | mod x 2 == 0 = x : pares xs
            | otherwise = pares xs


--ejercicio 3H
multiplosDeN :: Integer -> [Integer] -> [Integer]
multiplosDeN n [] = []
multiplosDeN n (x:xs) | mod n x == 0 = x : multiplosDeN n xs
                     | otherwise = multiplosDeN n xs
{-
multiplosDeN 10 [1,2,3,4,5,6,7,8,9]
[1,2,5]
multiplosDeN 2 [1,2,3,4,5,6,7,8,9]
[1,2]
-}


--ejercicio 3I preguntar despus
minimo :: [Integer] -> Integer
minimo [x] = x
minimo (x:y:xs) | x < y = minimo (x:xs)
               | otherwise= minimo (y:xs)


ordenar :: [Integer] -> [Integer]
ordenar [x] = [x]
ordenar l = minimo l : ordenar (quitar (minimo l) l)


{-
a tener en cuenta
*Main> sacarBlancosRepetidos ['h','o','l','a']
"hola"
*Main> sacarBlancosRepetidos "hola"
"hola"
*Main> sacarBlancosRepetidos "holasdsd"
"holasdsd"


-}
--ejercicio 4A
sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos [x] = [x]
sacarBlancosRepetidos (x:y:xs) | x == ' ' && y == ' ' = sacarBlancosRepetidos (y:xs)
                              | otherwise = x : sacarBlancosRepetidos (y:xs)


--ejercicio 4B
contarPalabras :: [Char] -> Integer
contarPalabras [] = 0


--ejercicio 4C
palabras :: [Char] -> [[Char]]
palabras [] = [[]]


--ejercicio 4D


--ejercicio 4E


--ejercicio 4F


--ejercicio 6A
enLosContactos :: [Char] -> [[Char]] -> Bool
enLosContactos nombre [] = False
enLosContactos nombre (contacto1:conctactos) | nombre == contacto1 = True
                                            | otherwise = enLosContactos nombre conctactos
      
--ejercicio 6B hacer 
pertenecePalabra :: [Char] -> [[Char]] -> Bool
pertenecePalabra palabra [] = False
pertenecePalabra palabra (x:xs) | palabra == x = True
                               | otherwise = pertenecePalabra palabra xs


agregarContacto :: [Char] -> [[Char]] -> [[Char]]
agregarContacto contacto contactos = [[]]