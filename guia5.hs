--ejercicio 1A
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use foldr" #-}
{-# HLINT ignore "Use :" #-}
{-# HLINT ignore "Use map" #-}
{-# HLINT ignore "Use even" #-}
{-# HLINT ignore "Use list literal pattern" #-}
{-# HLINT ignore "Redundant bracket" #-}
{-# HLINT ignore "Redundant ==" #-}
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
sumarElUltimo l = sumarN (ultimo l ) l


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



--- de aca a atras osea el 1 2 3 bien echos 











-}
--ejercicio 4A
sacarBlancosRepetidos :: Texto -> Texto
sacarBlancosRepetidos [x] = [x]
sacarBlancosRepetidos (x:y:xs) | x == ' ' && y == ' ' = sacarBlancosRepetidos (y:xs)
                              | otherwise = x : sacarBlancosRepetidos (y:xs)

sacarEspaciosRepetidosBis :: Texto -> Texto
sacarEspaciosRepetidosBis [] = []
sacarEspaciosRepetidosBis (x:[])=[x] -- o [x]
sacarEspaciosRepetidosBis (x:y:xs) | x==y && x==' ' = sacarEspaciosRepetidosBis (y:xs)
                                   | otherwise = x:(sacarEspaciosRepetidosBis (y:xs))

{-
sacarEspaciosRepetidosBis "hola  como  estas" = "hola como estas"
sacarEspaciosRepetidosBis 
sacarEspaciosRepetidosBis
-}

{-
sacarBlancosRepetidos "hola  como  estas" = "hola como estas"
sacarBlancosRepetidos 
sacarBlancosRepetidos
-}
--ejercicio 4B
contarPalabras :: Texto -> Integer
contarPalabras [] = 0
contarPalabras (x:xs) | head (sacarBlancosRepetidos (x:xs)) == ' ' = 1 + contarPalabras (sacarBlancosRepetidos xs)
                      | otherwise = contarPalabras xs

{-
contarPalabras "hola  como  estas" = 3
contarPalabras "ho la  co mo  es t as"
contarPalabras
-}

--ejercicio 4C
palabras :: Texto -> [Texto]
palabras [] = []
palabras (x:xs) = primeraPalabra (x:xs) : palabras (sacarPrimeraPalabra (x:xs))
{- 
palabras "holaas como estas" = ["Hola", "como", "estas"]
palabras "holaas como estan todos"   = ["Hola", "como", "estan","todos"]
palabras "Hola mundo maravilloso" = ["Hola", "mundo", "maravilloso"]
-}
--primeraPalabra "holaas como estas" = "holaas"

primeraPalabra :: Texto -> Texto
primeraPalabra [] = []
primeraPalabra (x:xs) | x == ' ' = []
                      | otherwise = x : primeraPalabra xs
--segundaPalabra "holaas como estas" = "como"
segundaPalabra :: Texto -> Texto
segundaPalabra [] = []
segundaPalabra (x:xs) = primeraPalabra (sacarPrimeraPalabra (x:xs))
--sacarPrimeraPalabra "holaas como estas" = ["como", "estas"]
sacarPrimeraPalabra :: Texto -> Texto
sacarPrimeraPalabra [] = []
sacarPrimeraPalabra (x:xs) | x == ' ' = xs
                           | otherwise = sacarPrimeraPalabra xs
--sacarSegundaPalabra "holaas como estas" = ["Hola","estas"]
sacarSegundaPalabra :: Texto -> Texto
sacarSegundaPalabra [] = []
sacarSegundaPalabra (x:xs) = sacarNpalabra (x:xs) 2
--sacarNpalabra "holaas como estas" 1 = "holaas"
sacarNpalabra :: Texto -> Integer -> Texto
sacarNpalabra [] 0 = []
sacarNpalabra (x:xs) n | n == 1 = primeraPalabra (x:xs)
                       | otherwise = sacarNpalabra (sacarPrimeraPalabra (x:xs)) (n-1)

--ejercicio 4D 
longitudPalabra :: Texto -> Integer
longitudPalabra [] = 0
longitudPalabra (x:xs) = 1 + longitudPalabra (xs)

palabraMasLarga :: Texto -> Texto
palabraMasLarga [] = []
palabraMasLarga (x:xs) = sacarNpalabra (x:xs) (posicionDePalabraMasLarga (x:xs))
{-                  esta bien pensado pero me falta hacer posicionmaslarga 
palabraMasLarga "holaas como estas" = 'Holaas'
palabraMasLarga "holaas como estan todos"= 'holaas'
palabraMasLarga "Hola mundo maravilloso" = 'maravilloso'
-}
--posicionDePalabraMasLarga "holaas como estas" = 'Holaas'  hacerrrrrrrrrrrrrrrrrrrrrr
posicionDePalabraMasLarga :: Texto -> Integer
posicionDePalabraMasLarga [] = 0
posicionDePalabraMasLarga (x:xs) = 1

--ejercicio 4E
aplanar :: [Texto] -> Texto
aplanar [] = []
aplanar (x:xs) = x ++ aplanar xs
{-
aplanar ["Hola", "como", "estas"] = "Holacomoestas"
aplanar ["Hola", "como", "estan","todos"] = "Holacomoestantodos"
aplanar ["Hola", "mundo", "maravilloso"] = "Holamundomaravilloso"
-}
--ejercicio 4E
aplanarConBlancos :: [Texto] -> Texto
aplanarConBlancos [x] = x
aplanarConBlancos (x:xs) = x ++ " " ++ aplanarConBlancos xs
--aplanarConBlancos ["Hola", "mundo", "maravilloso"] = "Hola mundo maravilloso"

--ejercicio 4Fno entendi como lo hize preguntar porque antes era asi 
{-
aplanarConNBlancos :: [[Char]] -> Integer -> [Char]
aplanarConNBlancos [x] 0 = x
aplanarConNBlancos (x:xs) n = x ++ nBlancos n ++ aplanarConNBlancos xs n
-}
aplanarConNBlancos :: [Texto] -> Integer -> Texto
aplanarConNBlancos [x] n = x
aplanarConNBlancos (x:xs) n = x ++ nBlancos n ++ aplanarConNBlancos xs n
--aplanarConNBlancos ["Hola", "mundo", "maravilloso"] 1
nBlancos :: Integer -> Texto
nBlancos  0 = ""
nBlancos  1 = " "
nBlancos  n = ' ' : nBlancos (n-1)
--nBlancos 2 = 


--termine el 4 pero me falta implementar el 4D pero la idea esta bien 











--------------------------------------------------------------------------------------------
--ejercicio 5A 
sumaAcumulada :: [Integer] -> [Integer]
sumaAcumulada [x] = [x]
sumaAcumulada (x:y:xs) = [x] ++ sumaAcumulada ((x+y):xs)
--sumaAcumulada [1, 2, 3, 4, 5] = [1, 3, 6, 10, 15].

--ejercicio 5B 
descomponerEnPrimos :: [Integer] -> [[Integer]]
descomponerEnPrimos [] = []
descomponerEnPrimos (x:xs) | esPrimo x = [x]: descomponerEnPrimos xs
                           | otherwise = (descomposicionEnPrimosAux  x 2) : descomponerEnPrimos xs
--descomponerEnPrimos [10,16,2] = 
descomposicionEnPrimosAux :: Integer -> Integer -> [Integer]
descomposicionEnPrimosAux 1 n = []
descomposicionEnPrimosAux numero n   | mod numero n == 0 && esPrimo n  = n : (descomposicionEnPrimosAux (div numero n) n)
                                     | otherwise = descomposicionEnPrimosAux numero (n + 1)
--descomposicionEnPrimosAux 10 1 = [2,5]
------------------------------------------------------------------------------aux 

menorDivisorDesde ::Integer -> Integer -> Integer
menorDivisorDesde n m | n == m = n
                      | mod m n == 0 =  n
                      | n > m = 0
                      | otherwise = menorDivisorDesde (n+1) m
menorDivisor :: Integer -> Integer
menorDivisor = menorDivisorDesde 2
esPrimo :: Integer -> Bool
esPrimo 1 = False
esPrimo n | menorDivisor n == n = True
          | otherwise = False
nEsimoPrimo :: Integer -> Integer
nEsimoPrimo 1 = 2
nEsimoPrimo n = nEsimoPrimoDesdeAux (1+ nEsimoPrimo (n-1))
nEsimoPrimoDesdeAux :: Integer -> Integer
nEsimoPrimoDesdeAux 2 = 2
nEsimoPrimoDesdeAux n | esPrimo n = n
                      | otherwise = nEsimoPrimoDesdeAux (n+1)
-------------------------------------------------------------------------



-- termine bien el 5 








--ejercicio 6
enLosContactos :: [Char] -> [[Char]] -> Bool
enLosContactos nombre [] = False
enLosContactos nombre (contacto1:conctactos) | nombre == contacto1 = True
                                            | otherwise = enLosContactos nombre conctactos

enLosContactosBis :: Nombre -> ContactosTel -> Bool
enLosContactosBis nombre [] = False
enLosContactosBis nombre (contacto1:conctactos) | nombre == fst contacto1 = True
                                                | otherwise = enLosContactosBis nombre conctactos
--enLosContactosBis "paco" [("paco","123"),("pepe","1234"),("pao","12345"),("pico","123456")] = True 
--enLosContactos "juan" ["paco","gento","juan","jorge"] = True 

--ejercicio 6B hacer 
pertenecePalabra :: [Char] -> [[Char]] -> Bool
pertenecePalabra palabra [] = False
pertenecePalabra palabra (x:xs) | palabra == x = True
                               | otherwise = pertenecePalabra palabra xs
agregarContacto :: [Char] -> [[Char]] -> [[Char]]
agregarContacto contacto contactostel | pertenecePalabra contacto contactostel = contacto : agregarContacto contacto (eliminarContacto contacto contactostel)
                                      | otherwise = contactostel
agregarContactoBis :: Contacto -> ContactosTel -> ContactosTel
agregarContactoBis contacto contactostel | enLosContactosBis (fst (contacto)) contactostel = contacto : agregarContactoBis contacto (eliminarContactoBis (fst contacto) contactostel)
                                         | otherwise = contactostel
--agregarContacto "juan" ["paco","gento","juan","jorge"] = 
--agregarContactoBis ("pepe","1234") [("paco","123"),("pepe","1234"),("pao","12345"),("pico","123456")] = 

--ejercicio 6C xd hize primero para hacer el anterior 
eliminarContacto :: [Char] -> [[Char]] -> [[Char]]
eliminarContacto nombre [] = []
eliminarContacto nombre (persona:personas) | nombre == persona = eliminarContacto nombre (personas)
                                           |otherwise = persona : eliminarContacto nombre personas
eliminarContactoBis :: Nombre -> ContactosTel -> ContactosTel
eliminarContactoBis nombre [] = []
eliminarContactoBis nombre (persona:personas) | nombre == fst persona = eliminarContactoBis nombre (personas)
                                              |otherwise = persona : eliminarContactoBis nombre personas
--eliminarContacto "juan" ["paco","gento","juan","jorge"] = ["paco","gento","jorge"]
--eliminarContactoBis "pepe" [("paco","123"),("pepe","1234"),("pao","12345"),("pico","123456")] = True 

type Texto = [Char]
type Nombre = Texto
type Telefono = Texto
type Contacto = (Nombre, Telefono)
type ContactosTel = [Contacto]















--------------------------------------------------------------------------------------------
type Identificacion = Integer
type Ubicacion = Texto
type Estado = (Disponibilidad, Ubicacion)
type Locker = (Identificacion, Estado)
type MapaDeLockers = [Locker]
type Disponibilidad = Bool
--ejercicio 7A
--existeElLocker :: Integer ->[Integer,(Bool,Texto)] ->Bool
existeElLocker :: Identificacion ->MapaDeLockers -> Bool
existeElLocker id [] = False
existeElLocker id (x:xs) | id == fst x = True
                         | otherwise = existeElLocker id xs
--existeElLocker 100 [(100,(False,"ZD39I")),(101,(True,"JAH3I")),(103,(True,"IQSA9"))] = True

--ejercicio 7B
--ubicacionDelLocker :: Integer -> [(Integer,(Bool,Texto))] ->Texto
ubicacionDelLocker :: Identificacion ->MapaDeLockers ->Ubicacion
ubicacionDelLocker id [] = ""
ubicacionDelLocker id (x:xs) | id == fst x = snd (snd x)
                             | otherwise = ubicacionDelLocker id xs
--ubicacionDelLocker 101 [(100,(False,"ZD39I")),(101,(True,"JAH3I")),(103,(True,"IQSA9"))] = "JAH3I"

--ejercicio 7C 
--estaDisponibleElLocker :: Integer ->[Integer,(Bool,Texto)] ->Bool
estaDisponibleElLocker :: Identificacion ->MapaDeLockers ->Bool
estaDisponibleElLocker id [] = False
estaDisponibleElLocker id (x:xs) | id == fst x = fst (snd x)
                                 | otherwise = estaDisponibleElLocker id xs
--estaDisponibleElLocker 101 [(100,(False,"ZD39I")),(101,(True,"JAH3I")),(103,(True,"IQSA9"))] == True

--ejercicio 7D 
--ocuparLocker :: Integer ->[(Integer,(Bool,Texto))] ->[(Integer,(Bool,Texto))]
ocuparLockerBis :: Identificacion ->MapaDeLockers ->MapaDeLockers
ocuparLockerBis id [] = []
ocuparLockerBis id (x:xs) | id == fst x = cambiarEstadoDeLocker x : ocuparLockerBis id xs
                          | otherwise = x : ocuparLockerBis id xs
--ocuparLockerBis 100 [(100,(False,"ZD39I")),(101,(True,"JAH3I")),(103,(True,"IQSA9"))] =-
--------------------------------------------------------------------------------------------------
cambiarEstadoDeLocker :: (Integer,(Bool,Texto)) -> (Integer,(Bool,Texto))
cambiarEstadoDeLocker (x,(y,z)) = (x,cambiarEstado (y,z) )
cambiarEstado :: (Bool,Texto) -> (Bool,Texto)
cambiarEstado (x,y) | False ==  x = (True,y)
                    | otherwise = (x,y)
posicionDeNlocker :: Integer -> [(Integer,(Bool,Texto))] -> Integer
posicionDeNlocker n (x:xs) | n == fst x = 0
                           | otherwise= 1 + posicionDeNlocker (n-1) xs
--posicionDeNlocker 2 [(100,(False,"ZD39I")),(101,(True,"JAH3I")),(103,(True,"IQSA9"))] = 
--------------------------------------------------------------------------------------------------
{-
Por ejemplo, un posible mapa de lockers puede ser:
[ locker =  [Integer,(Bool,Texto)]
(100,(False,"ZD39I")),
(101,(True,"JAH3I")),
(103,(True,"IQSA9")),
(105,(True,"QOTSA")),
(109,(False,"893JJ")),
(110,(False,"99292"))
]
-}
--termine el 7 lo puedo merjorar implementando el existe pero al no especificar nada lo dejo asi 
