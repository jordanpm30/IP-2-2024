import math

##ejercicio 1 




"""
##ejercicio 1A
imprimir_hola_mundo = "hola mundo"
print (imprimir_hola_mundo)
print ("----------------------------------------------------------------------------------------------------------------")
##ejercicio 1B
imprimir_un_verso = "Un elefante se balanceaba sobre la tela de una araña \nComo veía que resistía, fue a llamar otro elefante \nDos elefantes se balanceaban sobre la tela de una araña \nComo veían que resistía, fueron a llamar otro elefante\n"
print (imprimir_un_verso)
print ("----------------------------------------------------------------------------------------------------------------")
##ejercicio 1C
raizDe2 = math.sqrt (2)
print (round ((raizDe2),4))
print ("----------------------------------------------------------------------------------------------------------------")
##ejercicio 1D
factorial_2 = math.factorial (2)
print (factorial_2)
print ("----------------------------------------------------------------------------------------------------------------")
##ejercicio 1E
radio = 1
perimetro = 2*math.pi * radio
print (perimetro)
print ("----------------------------------------------------------------------------------------------------------------")
"""
print ("----------------------------------------------------------------------------------------------------------------")



##ejercicio 2
"""
##ejercicio 2A
def imprimir_saludo (nombre:str) : 
    print ("Hola",nombre,"por pantalla")
imprimir_saludo ("pablo")
print ("----------------------------------------------------------------------------------------------------------------")
##ejercicio 2B
def raiz_cuadrada_de (numero) -> float :
    res:float = math.sqrt (numero)
    return (res)

print (raiz_cuadrada_de (2))
print ("----------------------------------------------------------------------------------------------------------------")
##ejercicio 2C
def fahrenheit_a_celsius (farenheit : int) -> int : 
    res:int = (farenheit-32) * (5/9)
    return res
print (fahrenheit_a_celsius (100))

print ("----------------------------------------------------------------------------------------------------------------")
##ejercicio 2D por ahi ta mal porque esta todo junto pero lo cumple 
def imprimir_dos_veces (estribillo) -> str :
    res:str = estribillo * 2
    return res
print (imprimir_dos_veces (imprimir_un_verso) )

print ("----------------------------------------------------------------------------------------------------------------")
##ejercicio 2E
def es_multiplo_de (n:int , m :int) -> bool :
    res:bool = n%m == 0
    return res
print (es_multiplo_de (7,2)) ## 4%2 == 0 True <-->mod 4 2 == 0 = 
print ("----------------------------------------------------------------------------------------------------------------")
##ejercicio 2F
def es_par (numero:int) -> bool : 
    res:bool = es_multiplo_de (numero,2)
    return res

print (es_par(13))
print ("----------------------------------------------------------------------------------------------------------------")
##ejercicio 2E
##def cantidad_de_pizzas(comensales:int, min_cant_de_porciones:int) -> int :


##print (cantidad_de_pizzas (18,8))

"""
print ("----------------------------------------------------------------------------------------------------------------")



##ejercicio 3
"""
##ejercicio 3.1
def alguno_es_0(numero1:int, numero2:int) -> bool :
    res : bool = numero1 == 0 or numero2 == 0 
    return res 

print (alguno_es_0 (2,0) )
print ("----------------------------------------------------------------------------------------------------------------")
##ejercicio 3.2
def ambos_son_0(numero1:int, numero2:int) -> bool :
    res : bool = numero1 == 0 and numero2 == 0 
    return res 
print (ambos_son_0 (0,0) ) 
print ("----------------------------------------------------------------------------------------------------------------")
##ejercicio 3.3 
def es_nombre_largo (nombre:str) -> bool :
    res:bool =  3 <= len(nombre) <= 8
    return res

print (es_nombre_largo ("123456789"))
print ("----------------------------------------------------------------------------------------------------------------")
##ejercicio 3.4
def es_Bisiesto (año) -> bool : 
    res:bool = (año%400 == 0 )or (año%4==0 )and not (año%100==0)
    return res 
print (es_Bisiesto (2024))
"""
print ("----------------------------------------------------------------------------------------------------------------")



##ejercicio 4
"""
##ejercicio 4 
## 3 kg por cada centímetro hasta 3 metros,
## 2 kg por cada centímetro arriba de los 3 metros. 
## 2 metros pesan 600 kg, porque 200 * 3 = 600
## 5 metros pesan 1300 kg, porque los primeros 3 metros pesan 900 kg y los siguientes 2 pesan los 400 restantes

def peso_pino (altura_cm:int) -> int : 
    if altura_cm <= 300 : 
        return altura_cm * 3
    else :
        return ((altura_cm-300)*2)+900 
print (peso_pino (300))
print ("----------------------------------------------------------------------------------------------------------------")
##ejercicio 4.2
def es_peso_util (peso_kg:int) -> bool : 
    res : bool = 400 < peso_kg < 1000
    return (res) 
print (es_peso_util (300))


print ("----------------------------------------------------------------------------------------------------------------")
##ejercicio 4.3
def sirve_pino (altura_cm:int) -> bool : 
    peso:int = peso_pino (altura_cm)
    res:bool = es_peso_util (peso)
    print (res)
sirve_pino (300) ## peso_pino (300) == 900 y es_peso_util (900) = True 

print ("----------------------------------------------------------------------------------------------------------------")
##ejercicio 4.4
def sirve_pino_bis (altura_cm:int) -> bool : 
    print ( es_peso_util (peso_pino (altura_cm)) )
sirve_pino_bis (300)
"""
print ("----------------------------------------------------------------------------------------------------------------")



##ejercicio 5
"""
##ejercicio 5.1 
def devolver_el_doble_si_es_par (numero:int) -> int : 
    if numero%2 == 0 : 
        print (numero*2)
    else : 
        print (numero)

devolver_el_doble_si_es_par (3)
print ("----------------------------------------------------------------------------------------------------------------")
##ejercicio 5.2
def devolver_valor_si_es_par_sino_el_que_sigue (numero:int) :
    if numero%2 == 0 : 
        print (numero*2)
    if numero%2 != 0 :
        print (numero+1)
##otra forma 
devolver_valor_si_es_par_sino_el_que_sigue(2)

print ("----------------------------------------------------------------------------------------------------------------")
##ejercicio 5.3
def devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9 (numero:int) ->int : 
    if numero %9 == 0 :
        print (numero*3)
    elif numero %3 == 0 : 
         print (numero*2)
    else : 
        print (numero)
devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9 (6)

print ("----------------------------------------------------------------------------------------------------------------")
##ejercicio 5.4
def lindo_nombre(nombre:str) -> str : 
    if 5 <= len (nombre) : 
        print ("tu nombre tiene muchas letras")
    else : 
        print("Tu nombre tiene menos de 5 caracteres") 
lindo_nombre ("12345")
print ("----------------------------------------------------------------------------------------------------------------")
##ejercicio 5.5
def elRango(numero:int) -> str :
    if numero < 5 : 
        print ("menor a 5")
    elif 5 <= numero  <10 :
        print ("no tiene espesificacion")
    elif 10 <= numero  <=20 :
        print ("entre 10 y 20")
    else : 
        print ("mayor a 20")
print ("----------------------------------------------------------------------------------------------------------------")
##ejercicio 5.6
def vacaciones_o_no (sexo:str,edad:int) -> str : 
    if  edad < 18 or (sexo == "M" and edad >= 65) or (sexo == "F" and edad >= 60) : 
        print ("Anda De vacaciones")
    else : 
        print ("Te Toca Trabajar")
vacaciones_o_no ("M",66)
"""
print ("----------------------------------------------------------------------------------------------------------------")



##ejercicio 6
"""
##ejercicio 6.1
def numeros_del_1_al_10 (hasta:int) -> str : 
    i = 1 
    while hasta > i :
        print (i)
        i = 1 + i
    return i
print (numeros_del_1_al_10 (10)) 

print ("----------------------------------------------------------------------------------------------------------------")
##ejercicio 6.2
def numeros_Desde_2_a_desde_hasta (desde:int,hasta:int) -> str : 
    while hasta >= desde :
        print (desde)
        desde = 2 + desde

numeros_Desde_2_a_desde_hasta (10,40)  ## no usamos print pq ya lo estamos imprimiendo desde antes porque si pongo print tengo que poner un return algo que no hace falta en es te caso 

print ("----------------------------------------------------------------------------------------------------------------")
##ejercicio 6.3
def eco_n_cantidad_de_veces (n:int) -> str : 
    i = 1
    while n >= i : 
        print ("eco")
        i = i + 1 

eco_n_cantidad_de_veces (10)

print ("----------------------------------------------------------------------------------------------------------------")
##ejercicio 6.4
def cuenta_regresiva_hasta (numero:int) -> str : 
    i:int = 1
    while numero >= 1 : 
        print (numero)
        numero = numero -1 
    print ("despeguennnnnnnnnnn")

cuenta_regresiva_hasta (10)

print ("----------------------------------------------------------------------------------------------------------------")
##ejercicio 6.5  
def viaje_en_el_tiempo (añoDePartida:int,añoDeLlegada:int) -> str : 
    while añoDeLlegada <= añoDePartida : ## aique romper esto osea tiene que ir restando año de partida 
        print ("Viajó un año al pasado, estamos en el año:",añoDePartida)
        añoDePartida -= 1 
    print ("termino el viaje ")

viaje_en_el_tiempo (2022,2000)
print ("----------------------------------------------------------------------------------------------------------------")
##ejercicio 6.6  
def  monitoreo_de_viaje_en_el_tiempo (añoDePartida:int) :
    while añoDePartida >= (-365) :
        if añoDePartida > 0 :
           print ("Viajó 20 años al pasado, estamos en el año: ", añoDePartida)
           añoDePartida -= 20
        else :
            print ("Viajó 20 años al pasado, estamos en el año: a.C ",(añoDePartida*(-1)) )
            añoDePartida -= 20
monitoreo_de_viaje_en_el_tiempo (15)
"""
print ("----------------------------------------------------------------------------------------------------------------")



##ejercicio 7
"""
##ejercicio 7.1
def imprimir_los_numeros_desde_hasta_for (desde:int,hasta:int) -> str :
    for n in range (desde,hasta+1,1): #3 [desde,desde+1,desde+2,.....,hasta] esta incluido el hasta pq hay un +1  
        print (n)

imprimir_los_numeros_desde_hasta_for (1,10)

print ("----------------------------------------------------------------------------------------------------------------")

##ejercicio 7.2 
def imprimir_pares_for_desde_hasta (desde:int,hasta:int) -> str : 
    for n in range (desde,hasta+1,1) : ## [10,11,12,13,14....40] porque es hasta no inclusive
        if n % 2 == 0 : 
            print (n)
##  for n in range (desde,hasta+1,2)
##      print (n)                       por este ej nada mas 

imprimir_pares_for_desde_hasta (10,40)
print ("----------------------------------------------------------------------------------------------------------------")
## ejercicio 7.3 
def imprimir_eco_n_veces_for (n:int) -> str : 
    for n in range (1,n+1,1) : 
        print ("eco")
imprimir_eco_n_veces_for (10) 

print ("----------------------------------------------------------------------------------------------------------------")
##ejercicio 7.4
def imprimir_despegue_for_hasta (hasta:int) -> str : 
    for n in range (hasta,0,(-1)) : 
        print (n)
    print ("despeguennnnnnnnnnnnnnnnnnnnnnnnnn")
imprimir_despegue_for_hasta (10)
print ("----------------------------------------------------------------------------------------------------------------")
##ejercicio 7.5
def imprimir_viaje_en_el_tiempo_for (elAñoDePartida:int,elAñoDeLlegada:int) ->  str : 
    for n in range (elAñoDePartida,elAñoDeLlegada-1,(-1)) :      
        print ("Viajó un año al pasado, estamos en el año:",n)
    print ("su viaje a concluido")

imprimir_viaje_en_el_tiempo_for (2022,2010)    
print ("----------------------------------------------------------------------------------------------------------------")
##ejercicio 7.6
def imprimr_viaje_en_el_tiempo_20_años_for (añoDePartida:int) -> str : 
    for n in range (añoDePartida,(-384)-1,(-20)) : 
        if n >= 0 :
            print ("Viajó 20 años al pasado, estamos en el año: ", n)
        else : 
            print ("Viajó 20 años al pasado, estamos en el año a.C : ", (n*-1))

imprimr_viaje_en_el_tiempo_20_años_for (16)
"""
print ("----------------------------------------------------------------------------------------------------------------")



##ejercicio 8 a 9 tranka 