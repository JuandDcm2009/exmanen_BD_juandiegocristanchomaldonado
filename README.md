# Base de datos Libreria

## desarrollador:
- Juan Diego C

## Justificacion de Diseño

### Tabla libros
Atributos: 
- id (Clave primaria)
- titulo (varchar)
- categoria (enum)
- fecha_publicacion (datetime)
- isbn (Bigint) Clave unica
- precio (bigint)
- cantidad_stock (bigint)

### Tabla autores 
Atibutos: 
- id (Clave primaria)
- nombre (varchar)
- fecha_nacimiento (datetime) 
- nacionalidad (id paises) clave foranea

### Tabla autores_libros
- id (Clave primaria)
- autor (id autores) clave foranea
- libro (id libros) clave foranea

Esta tabla es la que relaciona los libros con sus respectivos autores y su relacion de muchos a muchos

### Tabla clientes
- id (clave primaria)
- nombre (varchar)
- correo electronico (varchar)
- telefono (varchar) al estar en singular quiere decir que solo se va a usar 1 telefono por lo tanto no es divisible.
- direcion (id direciones) clave foranea

### Talba Pedidos
- id (clave primaria)
- cliente (id clientes) clave foranea
- libros pedidos (id libros pedidos) clave foranea
- fecha compra (datetime)
- estado pedido (enum)

### Tabla pedidos
- id (clave primaria)
- libro (id libros) clave foranea
- cantidad (Int)
Esta tabla permite que cada tipo de libro tenga su cantidad especifica, haciendo que la cantidad no sea general.

### Tabla transaciones 
- id (clave primaria)
- pedido (id pedidos) clave foranea
- metodo de pago (enum)
- monto total (int)
- fecha de transaccion (datetime)
