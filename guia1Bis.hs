{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Eta reduce" #-}
productoria :: Integer -> Integer 
productoria 0 = 1 
productoria x = x * productoria (x-1)

productoriaHasta:: Integer -> Integer -> Integer
productoriaHasta n m  | n == m =  m 
                      | otherwise = productoriaHasta n (m-1) * m  

{-
de derecha a izquierda             <-------                          reste hasta el caso base 
productoriaHasta 1 5 = 120                      |1| * 2 * 3 * 4 * 5  
productoriaHasta 4 5 = 20                       |4| * 5 
productoriaHasta 4 7 = 20                       |4| * 5 * 6 * 7   
-}

productoriaDesde:: Integer -> Integer -> Integer
productoriaDesde n m  | n == m =  n  
                      | otherwise = n * productoriaDesde (n+1) m 
{-
de izquierda a derecha             -------> | | partern              sume hasta el caso base 
productoriaDesde 1 5 = 120                      1 * 2 * 3 * 4 * |5|    
productoriaDesde 4 5 = 20                       4 * |5|                 
productoriaDesde 4 7 = 20                       4 * 5 * 6 * |7|       
-} 

sumaDivisoresDesde :: Integer -> Integer -> Integer 
sumaDivisoresDesde n m | n == m = n 
                       | mod m n == 0  = n + sumaDivisoresDesde (n+1) m 
                       | otherwise = sumaDivisoresDesde (n+1) m 
{-                                        ------->
sumaDivisoresDesde 1 10 = 1 + 2 + 5 + |10|         = 18         
sumaDivisoresDesde 2 16 = 2 + 4 + 8 + |16|         = 30               
sumaDivisoresDesde 3 12 = 3 + 4 + 6 + |12|         = 21           
-} 
sumaDivisores :: Integer -> Integer 
sumaDivisores n = sumaDivisoresDesde 1 n  --desde 1 n  = 1 10 = 18  suma hasta

sumaDivisoresHasta :: Integer -> Integer -> Integer 
sumaDivisoresHasta n m | m == 1  = 1 
                       | mod n m == 0 = sumaDivisoresHasta n (m-1) + m 
                       | otherwise = sumaDivisoresHasta n (m-1)

{-                                          <-------
sumaDivisoresHasta 10 10 = |1| + 2 + 5 + 10         = 18
sumaDivisoresHasta 10 7  = |1| + 2 + 5              = 8       
sumaDivisoresHasta 16 10 = |1| + 2 + 4 + 8          = 15              
sumaDivisoresHasta 7 100 = |1| + 7                  = 8          
-} 

sumaDivisoresBis :: Integer -> Integer 
sumaDivisoresBis n = sumaDivisoresHasta n n  --desde n n = 10 10 = 18 resta hasta 

