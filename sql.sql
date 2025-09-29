CREATE TABLE `libros`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `titulo` VARCHAR(50) NOT NULL,
    `editorial` VARCHAR(50) NOT NULL,
    `categoria` ENUM(
        'drama',
        'comedia',
        'novela',
        'terror',
        'misterio',
        'fantasia',
        'historia'
    ) NOT NULL,
    `fecha_publicacion` DATETIME NOT NULL,
    `isbn` BIGINT NOT NULL,
    `precio` BIGINT NOT NULL,
    `cantidad_stock` BIGINT NOT NULL
);
ALTER TABLE
    `libros` ADD UNIQUE `libros_isbn_unique`(`isbn`);
CREATE TABLE `autores`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre` VARCHAR(250) NOT NULL,
    `fecha_nacimiento` DATETIME NOT NULL,
    `id_nacionalidad_fk` BIGINT NOT NULL
);
CREATE TABLE `clientes`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre` VARCHAR(50) NOT NULL,
    `corre_electronico` VARCHAR(50) NOT NULL,
    `telefono` VARCHAR(50) NOT NULL,
    `id_direcion_fk` BIGINT NOT NULL
);
CREATE TABLE `direciones`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `calle` BIGINT NOT NULL,
    `carrera` BIGINT NOT NULL,
    `numero` BIGINT NOT NULL,
    `id_barrio_fk` BIGINT NOT NULL
);
CREATE TABLE `barrios`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre` BIGINT NOT NULL,
    `id_ciudad_fk` BIGINT NOT NULL
);
CREATE TABLE `ciudades`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre` BIGINT NOT NULL,
    `id_pais_fk` BIGINT NOT NULL
);
CREATE TABLE `paises`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre` BIGINT NOT NULL
);
CREATE TABLE `pedidos`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_libros_pedido_fk` BIGINT NOT NULL,
    `id_cliente_fk` BIGINT NOT NULL,
    `fecha_compra` DATETIME NOT NULL,
    `estado_pedido` ENUM(
        'pendiente',
        'procesado',
        'completado'
    ) NOT NULL DEFAULT 'pendiente'
);
CREATE TABLE `libros_pedidos`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_libro_fk` BIGINT NOT NULL,
    `cantidad` BIGINT NOT NULL
);
CREATE TABLE `transacciones`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_pedido_fk` BIGINT NOT NULL,
    `metodo_pago` ENUM(
        'tarjeta_de_credito',
        'pay_pal',
        'nequi'
    ) NOT NULL,
    `monto_total` BIGINT NOT NULL,
    `fecha_transaccion` DATETIME NOT NULL
);
CREATE TABLE `autores_libros`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_autor_lfk` BIGINT NOT NULL,
    `id_libro_fk` BIGINT NOT NULL
);
ALTER TABLE
    `libros_pedidos` ADD CONSTRAINT `libros_pedidos_id_libro_fk_foreign` FOREIGN KEY(`id_libro_fk`) REFERENCES `pedidos`(`id_libros_pedido_fk`);
ALTER TABLE
    `direciones` ADD CONSTRAINT `direciones_id_barrio_fk_foreign` FOREIGN KEY(`id_barrio_fk`) REFERENCES `barrios`(`id`);
ALTER TABLE
    `libros_pedidos` ADD CONSTRAINT `libros_pedidos_id_libro_fk_foreign` FOREIGN KEY(`id_libro_fk`) REFERENCES `libros`(`id`);
ALTER TABLE
    `transacciones` ADD CONSTRAINT `transacciones_id_pedido_fk_foreign` FOREIGN KEY(`id_pedido_fk`) REFERENCES `pedidos`(`id`);
ALTER TABLE
    `pedidos` ADD CONSTRAINT `pedidos_id_cliente_fk_foreign` FOREIGN KEY(`id_cliente_fk`) REFERENCES `clientes`(`id`);
ALTER TABLE
    `autores_libros` ADD CONSTRAINT `autores_libros_id_libro_fk_foreign` FOREIGN KEY(`id_libro_fk`) REFERENCES `libros`(`id`);
ALTER TABLE
    `autores` ADD CONSTRAINT `autores_id_nacionalidad_fk_foreign` FOREIGN KEY(`id_nacionalidad_fk`) REFERENCES `paises`(`id`);
ALTER TABLE
    `ciudades` ADD CONSTRAINT `ciudades_id_pais_fk_foreign` FOREIGN KEY(`id_pais_fk`) REFERENCES `paises`(`id`);
ALTER TABLE
    `barrios` ADD CONSTRAINT `barrios_id_ciudad_fk_foreign` FOREIGN KEY(`id_ciudad_fk`) REFERENCES `ciudades`(`id`);
ALTER TABLE
    `clientes` ADD CONSTRAINT `clientes_id_direcion_fk_foreign` FOREIGN KEY(`id_direcion_fk`) REFERENCES `direciones`(`id`);
ALTER TABLE
    `autores_libros` ADD CONSTRAINT `autores_libros_id_autor_lfk_foreign` FOREIGN KEY(`id_autor_lfk`) REFERENCES `autores`(`id`);