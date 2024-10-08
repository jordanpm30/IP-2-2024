--ejercicio 1 
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Redundant bracket" #-}
{-# HLINT ignore "Eta reduce" #-}

fibonacci:: Integer -> Integer
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n-1) + fibonacci (n-2)

--ejercicio 2 
parteEntera :: Float -> Integer
parteEntera x | x > 1 = 1 + parteEntera (x-1)
              | -1 < x && x < 1 = 0
              | otherwise = -1 + parteEntera (x+1)

--ejercicio 3 
esDivisible :: Integer -> Integer -> Bool
esDivisible 0 y = True
esDivisible x y | x == y = True
                | x < y = False
                | otherwise = esDivisible (x-y) y

--ejercicio 4 
sumaImpares :: Integer -> Integer
sumaImpares 0 = 0
sumaImpares x = 2*x-1 + sumaImpares (x-1)

--ejercicio 5 
--auxiliar 
factorialBis :: Integer -> Integer
factorialBis 0 = 1
factorialBis x = x * factorialBis (x-1)

medioFact :: Integer -> Integer
medioFact 0 = 1
medioFact 1 = 1
medioFact x = x*medioFact (x-2)

--ejercicio 6 
todosDigitosIguales :: Integer -> Bool
todosDigitosIguales 0 = True
todosDigitosIguales x | x < 10 = True
                      | mod x 10 == mod (div x 10) 10 = todosDigitosIguales (div x 10)
                      | otherwise = False

-- ejercicio 7 
cantDigitos :: Integer -> Integer
cantDigitos 0 = 1
cantDigitos x | -9 < x && x < 9 = 1
              | otherwise = 1 + cantDigitos (div x 10)

cantDigitosBis :: Integer -> Integer
cantDigitosBis 0 = 1
cantDigitosBis x | absoluto x > 9 = 1 + cantDigitosBis (div x 10)
                 | otherwise = 1

iesimoDigito :: Integer -> Integer -> Integer
iesimoDigito n 0 = 0
iesimoDigito n i | cantDigitos n == i  = mod n 10
                 | cantDigitos n < i = 0 --adicional porque sin esto igual cumple el contrato
                 | otherwise = iesimoDigito (div n 10) i

{-
iesimoDigito 468 0 = 0
iesimoDigito 468 1 = 4 
iesimoDigito 468 2 = 6 
iesimoDigito 468 3 = 8 

-}
--Ca 
absoluto :: Integer -> Integer
absoluto 0 = 0
absoluto x | x > 0 = x
           | otherwise = -x

-- ejercicio 8 
sumaDigitos :: Integer -> Integer
sumaDigitos 0 = 0
sumaDigitos x | x < 9 = x
              | otherwise = mod x 10 + sumaDigitos (div x 10)

-- ejercicio 9 
inversa :: Integer -> Integer
inversa x | x < 9 = x 
          | x > 9 = mod x 10 *(10 ^ (cantDigitos x-1)) + inversa (div x 10)

esCapicua:: Integer -> Bool 
esCapicua 0 = True 
esCapicua x = x == inversa x 

--ejercicio 10
f1 :: Integer -> Integer
f1 0 = 1
f1 x = 2^x + f1 (x-1)

f2 :: Float -> Integer -> Float
f2 q 1 = q
f2 0 n = 0
f2 q n = q^n + f2 q (n-1)

f3 :: Float -> Integer -> Float
f3 0 n = 0
f3 q 0 = 0
f3 q n = q ^ (2*n) + q^ (2*n-1) + f3 q (n-1)

--preguntar despues 
f4 :: Float -> Integer -> Float
f4 0 n = 0
f4 q 0 = 0
f4 q n | n > 1 = q ^ (2*n) + q^ (2*n-1) - (q ^ (n-1)) + f3 q (n-1)
       | n == 1 = f3 q n

--auxiliar 
factorial :: Float -> Float
factorial 0 = 1
factorial n = n * factorial (n-1)

--ejercicio 11 
eAprox :: Float -> Float
eAprox 0 = 1
eAprox n = 1 / factorial n + eAprox (n-1)
--b)
e :: Float
e = eAprox 10

-- ejercicio 12 
raizDe2AproxBis :: Integer -> Float
raizDe2AproxBis 1 = 2
raizDe2AproxBis n = 2 + 1 / raizDe2AproxBis (n-1)

raizDe2Aprox ::  Integer -> Float
raizDe2Aprox n = raizDe2AproxBis n - 1

-- ejercicio 13

dobleSumatoria :: Float -> Integer -> Float
dobleSumatoria 0 m = 0
dobleSumatoria n 1 = n
dobleSumatoria n m = f2 n m  + dobleSumatoria (n-1) m

{-
pistas de este ejercicio 
--------------------------------------------------------
1^1     + 1^2     + 1^3 ...     + 1^(m-1)     + 1^m     |
2^1     + 2^2     + 2^3 ...     + 2^(m-1)     + 2^m     |
.                                                       |      
.                                                       | 
(n-1)^1 + (n-1)^2 + (n-1)^3 ... + (n-1)^(m-1) + (n-1)^m |  fdoble(n-1) m
--------------------------------------------------------
n^1     + n^2     + n^3     ... + n^(m-1)     + n^m        f2     n m
tengo lo que esta en cuadrado ya lo use en doblesumatoria 
pero me falta lo que esta afuera del cuadrado (n^m) pero ya la definidmos 
con la sumatira q^n 
-}
{-
dobleSumatoria 1 5 = 1^1 + 1^2 + 1^3 + 1^4 + 1^5                             = 5
dobleSumatoria 3 3 = 1^1 + 1^2 + 1^3 |+| 2^1 + 2^2 + 2^3 |+| 3^1 + 3^2 + 3^3 = 56
dobleSumatoria 2 3 = 1^1 + 1^2 + 1^3 |+| 2^1 + 2^2 + 2^3                     = 17
dobleSumatoria 3 2 = 1^1 + 1^2 |+| 2^1 + 2^2 |+| 3^1 + 3^2                   = 20
dobleSumatoria 5 1 = 1^1 |+| 2^1 |+| 3^1 |+| 4^1 |+| 5^1                     = 15
ss
-}
-- ejercicio 14
sumaPotencias :: Integer -> Integer -> Integer -> Integer 
sumaPotencias q n 0 = 0
sumaPotencias q n m = f2Bis q  n * q^m + sumaPotencias q n (m-1)

--aux 
f2Bis :: Integer -> Integer -> Integer
f2Bis q 1 = q
f2Bis 0 n = 0
f2Bis q n = q^n + f2Bis q (n-1)

sumatoria :: Integer -> Integer
sumatoria 0 = 0 
sumatoria x = x+ sumatoria (x-1)

-- ejercicio 15 
sumaRacionales :: Integer -> Integer -> Float
sumaRacionales n 0 = 0 
sumaRacionales n m = sumaRacionales n (m-1) + (fromInteger(sumatoria n)) / fromInteger m

--ejercicio 16A 
menorDivisorDesde ::Integer -> Integer -> Integer
menorDivisorDesde n m | n == m = n       
                      | mod m n == 0 =  n 
                      | n > m = 0 
                      | otherwise = menorDivisorDesde (n+1) m 

{-                         ------->
menorDivisorDesde 2 7  = 7         (es primo es 1 o 7 )       
menorDivisorDesde 2 16 = 2         (divisore 16 =|2|,4,8,16)                
menorDivisorDesde 7 12 = 12       
-} 
menorDivisor :: Integer -> Integer
menorDivisor n = menorDivisorDesde 2 n 
--ejercicio 16B
esPrimo :: Integer -> Bool
esPrimo 1 = False
esPrimo n | menorDivisor n == n = True
          | otherwise = False

--ejercicio 16C
sonCoprimos :: Integer -> Integer -> Bool 
sonCoprimos n m | n == m = False 
                | menorDivisor n == menorDivisor m = False 
                | otherwise = True

--ejercicio 16D preguntar
nEsimoPrimo :: Integer -> Integer 
nEsimoPrimo 1 = 2 
nEsimoPrimo n = nEsimoPrimoDesdeAux (1+ nEsimoPrimo (n-1))
{-
nEsimoPrimo 1  = 2 
nEsimoPrimo 5  = 11 
nEsimoPrimo 10 = 29 
-}
nEsimoPrimoDesdeAux :: Integer -> Integer
nEsimoPrimoDesdeAux 2 = 2 
nEsimoPrimoDesdeAux n | esPrimo n = n 
                      | otherwise = nEsimoPrimoDesdeAux (n+1)

----ejercicio 17 preguntar

esFibonacci :: Integer -> Bool 
esFibonacci 1 = True 

----ejercicio 19 preguntar

esSumaInicialDePrimos :: Integer -> Bool 
esSumaInicialDePrimos n = esSumaDePrimerosKPrimos 2 n 

{-
primos 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43,
        47, 53, 59, 61, 67, 71, 73, 79, 83, 89 y 97
esSumaInicialDePrimos 10 = True = 2 + 3 + 5 
esSumaInicialDePrimos 12 = False = 2 + 3 + 5 = 10  + 7 = 17 > 12 
esSumaInicialDePrimos
-}

esSumaDePrimerosKPrimos :: Integer -> Integer -> Bool
esSumaDePrimerosKPrimos k n | (esSumaDeKPrimos k) == n = True 
                            | (esSumaDeKPrimos k) > n = False 
                            | otherwise = esSumaDePrimerosKPrimos (k+1) n
{-
primos 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43,
        47, 53, 59, 61, 67, 71, 73, 79, 83, 89 y 97
esSumaDePrimerosKPrimos 5 10 = |10| == 10 = 2 + 3 +5 = True 
esSumaDePrimerosKPrimos 9 10 = |17| \= 10 = 2 + 3 + 5 + 7 = False 
esSumaDePrimerosKPrimos
-}
esSumaDeKPrimos :: Integer -> Integer 
esSumaDeKPrimos 2 = 2 
esSumaDeKPrimos n = esSumaDeDesdeKPrimos 2 n 


esSumaDeDesdeKPrimos :: Integer -> Integer -> Integer
esSumaDeDesdeKPrimos k n | k > n = 0
                                 | esPrimo k = k + esSumaDeDesdeKPrimos (k+1) n             
                                 | otherwise = esSumaDeDesdeKPrimos (k+1) n

{-
esSumaDePrimerosDesdeKPrimos 2 5  = 2 3 5 = 10
esSumaDePrimerosDesdeKPrimos 3 10 = 3 5 7 = 15
esSumaDePrimerosDesdeKPrimos 4 23 = 7 11 13 17 19 23 = 95 
-}
