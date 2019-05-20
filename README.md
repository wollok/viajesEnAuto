# Viajes en auto
 
[![Build Status](https://travis-ci.org/wollok/viajesEnAuto.svg?branch=master)](https://travis-ci.org/wollok/viajesEnAuto)


La cooperativa de remiseros de Doctor Olaechea nos pide que le armemos un programa para manejar cuánto cobrar los viajes.
La cooperativa pacta con cada cliente el precio por kilómetro que le va a cobrar. Estos son los valores que arregló con algunos clientes
- **Ludmila**: 18 pesos el kilómetro.
- **Ana María**: 30 pesos el kilómetro.
- **Teresa**: 22 pesos el kilómetro.

A partir de estos valores, cada chofer tiene un margen de decisión sobre cuánto cobrar un viaje. En particular:
- **Roxana** le cobra a cada cliente el precio por kilómetro que pactó con la cooperativa sin variaciones.
- **Gabriela** le aumenta un 20%, porque su auto de alta gama.
- **Mariela** no aplica recargo, pero establece un mínimo de 50 pesos el viaje.
- **Juana** por su parte, cobra 100 pesos hasta 8 kilómetros, y 200 pesos si son más de 8 kilómetros. A Juana no le importa lo que pactó la agencia, le cobra lo mismo a todos.

Veamos cuánto cobra cada chofer un viaje de 10 kilómetros.
- _Roxana_: a Ludmila 180 pesos (18 * 10), a Ana María 300, a Teresa 220.
- _Gabriela_: a Ludmila 216 pesos (180 * 1.2), a Ana María 360, a Teresa 264.
- _Mariela_: lo mismo que Roxana.
- _Juana_: 200 pesos a todos.

Si el viaje es de 2 kilómetros, los valores son estos:
- _Roxana_: a Ludmila 36 pesos (18 * 2), a Ana María 60, a Teresa 44.
- _Gabriela_: a Ludmila 43.20 pesos (36 * 1.2), a Ana María 72, a Teresa 52.80.
- _Mariela_: a Ludmila y a Teresa 50 pesos que es el mínimo, a Ana María 60.
- _Juana_: 100 pesos a todos.

<br>

Se pide representar a los choferes y a los clientes, de forma tal de poder preguntarle a un chofer cuánto le cobra a un determinado cliente por un viaje, del cual se indican los kilómetros.
P.ej. `roxana.precioViaje(ludmila,10)` debe devolver 180.

<br>

## Lucía y la cadete

Agregar al modelo a la chofer Lucía, y a la cliente Melina.
- **Lucía** es una chofer que hace reemplazos, o sea, cubre los turnos que las otras remiseras se tienen que tomar por alguna razón.
Hay que informar a quién está reeemplazando Lucía.
Lucía cobra lo mismo que el chofer al que está reemplazando.
- **Melina** es una cadeta que trabaja para los otros clientes de la remisería. En cada momento trabaja para un cliente, se debe informar para quién. El precio por kilómetro pactado con Melina es 3 pesos menos que el precio del cliente para el que esté trabajando en cada momento.

P.ej. si Lucía está reemplazando a Mariela, y Melina está trabajando para Ana María, entonces:
- por un viaje de 10 kilómetros Lucía le cobra a Melina 270 pesos (el precio por kilómetro es 27, tres menos que lo que se pactó con Ana María).
- por un viaje de 1 kilómetro le va a cobrar 50 pesos, que es el mínimo que establece Mariela.

Si en cambio Lucía está reemplazando a Gabriela, y manteniendo que Melina trabaja para Ana María, entonces los valores para 10 y 1 km son 324 y 32.4, porque corre el 20% de recargo que establece Gabriela.  


<br>

## Oficina de la cooperativa

Agregar al modelo un objeto que represente a la oficina desde la que la cooperativa despacha viajes.

En este modelo simplificado, cuando la oficina recibe un viaje, hay dos choferes que pueden tomarlo: uno que tiene prioridad (al que llamaremos _primera opción_ o _primer chofer_) y otro que es la _segunda opción_ (o _segundo chofer_).

El objeto `oficina` debe entender estos mensajes:
- `asignarChoferes(chofer1, chofer2)`: establece los choferes de primera y de segunda opción.
- `cambiarPrimerChoferPor(chofer)`: cambia el chofer de primera opción por el que se indica.
- `cambiarSegundoChoferPor(chofer)`: cambia el chofer de segunda opción por el que se indica.
- `intercambiarChoferes()`: intercambia los choferes de primera y segunda opción. O sea, el que era primera pasa a segunda, y viceversa.
- `choferElegidoParaViaje(cliente, kms)`: devuelve el chofer que corresponde asignar a un viaje, dados el cliente y la cantidad de kilómetros.
  El criterio es el siguiente: si para ese viaje, el precio del segundo chofer es menor al del primero con una diferencia de más de 30 pesos, entonces se elige el segundo chofer; si no, se elige el primero.

Supongamos que en un momento dado el chofer de primera opción es Roxana, y el de segunda opción es Juana. En este caso
- para un viaje de 10 kilómetros para Ana María, el chofer elegido es Juana, porque su precio de 200 pesos, es menor al de Roxana (300 pesos), y la diferencia es de más de 30 pesos.
- si el viaje es para Teresa, entonces Roxana ofrece 220 pesos y Juana 200. El precio de Juana es menor, pero la diferencia no llega a 30 pesos. Por lo tanto, el chofer elegido es Roxana.
- si el viaje es de 4 kilómetros para Teresa, entonces Roxana cobra 88 pesos y Juana 100. El precio de Roxana es menor pero la diferencia no es mayor a 30, por lo tanto Juana es la elegida.  
