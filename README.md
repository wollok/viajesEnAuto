# Viajes en auto

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
- por un viaje de 10 kilómetros Lucía le cobra a Mariela 270 pesos (el precio por kilómetro es 27, tres menos que lo que se pactó con Ana María).
- por un viaje de 1 kilómetro le va a cobrar 50 pesos, que es el mínimo que establece Mariela.

Si en cambio Lucía está reemplazando a Gabriela, y manteniendo que Melina trabaja para Ana María, entonces los valores para 10 y 1 km son 324 y 32.4, porque corre el 20% de recargo que establece Gabriela.  
  

<!--
, con cada cliente dos valores: un precio por kilómetro, y un porcentaje de descuento.

A partir de estos valores pactados por la cooperativa, cada chofer decide cómo cobrar un viaje de una cantidad de kilómetros.

Consideramos tres choferes:
- **Roxana** le cobra a cada cliente el precio por kilómetro que pactó con la cooperativa; no tiene en cuenta el descuento.
- **Gabriela** le cobra de base lo mismo a todos los clientes, 250 pesos el viaje, sin importar la longitud. A cada cliente le aplica el descuento que concertó con la agencia.
- **Mariela** cobra como Roxana, a partir del precio pactado por kilómetro. Si el valor obtenido es de 200 pesos o más, aplica el descuento que le corresponde al cliente.

Estos son los valores que la cooperativa pactó con algunos clientes:
- **Ludmila**: 18 pesos el kilómetro, 10% de descuento.
- **Ana María**: 30 pesos el kilómetro, 20% de descuento.
- **Teresa**: 22 pesos el kilómetro, 0% de descuento.

Veamos cuánto cobra cada chofer un viaje de 10 kilómetros.
- _Roxana_: a Ludmila 180 pesos (18 x 10), a Ana María 300, a Teresa 220.
- _Gabriela_: a Ludmila 225 (su precio fijo de 250 con el 10% de descuento que tiene Ludmila), a Ana María 200 (tiene 20% de descuento), a Teresa 250 (no tiene desceuento).
- _Mariela_: a Ludmila 180 pesos, como no llega a 200 no le corresponde descuento; a Ana María 240 (300 menos el 20% de descuento); a Teresa 220 (le corresponde descuento pero es del 0%). 
--> 

<!--
hay varias personas que ofrecen servicios de viajes en auto, y otras que son sus clientes.
Nos piden armar un modelo que maneje el precio que un chofer debe cobrarle a un cliente, y los viajes realizados.

En este modelo vamos a considerar dos choferes: Roxana y Gabriela.
Roxana le cobra a cada cliente un precio distinto, que pacta con cada uno. 
Por otro lado, Gabriela cobra un precio único fijado por ella; pacta con cada cliente un porcentaje de descuento que se aplica sobre el precio único.

<br> 

P.ej. tomemos tres clientes: Gaspar, Azucena y Elsa.
- Roxana pactó: 80 pesos el viaje con Gaspar, 75 con Azucena, 100 con Elsa.
- El precio único de Gabriela es 90 pesos. 

 

Proyecto inicial sobre choferes de auto y sus clientes



una remisera Roxana, que lleva distintos clientes, cada uno con su tarifa x km.
roxana.llevar(cliente, kms)
poder preguntar total kms recorridos y total recaudado.
Además, roxana.precioViaje(cliente, kms)

Variante: cada cliente tiene un % de descuento, el precio por km lo maneja Roxana.

También que cada cliente sepa en qué zona vive (norte, sur, oeste)

A Roxana le interesa llevar a un cliente si su tarifa x km es de 20 pesos o más. O hacer un viaje si es de más de 200 pesos.

A Gabriela le interesa si el cliente vive en la zona de su base actual. Hay cuatro bases: Bernal y Solano en el Sur; Tablada en el Oeste; y Florida en el Norte.

Gabriela cobra tarifa plana, según lo que indique la base actual. Bernal es configurable, Solano 30 pesos más que Bernal, Tablada 200, y Florida 240. Interesa saber cuántos viajes hizo.
-->
