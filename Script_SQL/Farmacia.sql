-- Generado por Oracle SQL Developer Data Modeler 4.1.5.907
--   en:        2020-04-26 14:32:26 COT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g




CREATE
  TABLE CLIENTES
  (
    id_clientes    INTEGER NOT NULL ,
    nombre         VARCHAR2 (100) NOT NULL ,
    apellido       VARCHAR2 (100) NOT NULL ,
    direccion      VARCHAR2 (100) NOT NULL ,
    telefono       VARCHAR2 (100) NOT NULL ,
    fecha_creacion datetime
  ) ;
ALTER TABLE CLIENTES ADD CONSTRAINT CLIENTES_PK PRIMARY KEY ( id_clientes ) ;


CREATE
  TABLE DETALLE_FACTURA
  (
    id_detalle     INTEGER NOT NULL ,
    id_factura     INTEGER NOT NULL ,
    id_producto    INTEGER NOT NULL ,
    precio         INTEGER NOT NULL ,
    fecha_entrega  DATE NOT NULL ,
    fecha_creacion DATE NOT NULL ,
    cantidad       INTEGER NOT NULL ,
    id_cliente     INTEGER NOT NULL
  ) ;
ALTER TABLE DETALLE_FACTURA ADD CONSTRAINT DETALLE_FACTURA_PK PRIMARY KEY (
id_detalle ) ;


CREATE
  TABLE FACTURA
  (
    id_factura     INTEGER NOT NULL ,
    fecha_factura  DATE NOT NULL ,
    id_cliente     INTEGER NOT NULL ,
    metodo_pago    VARCHAR2 (100) ,
    fecha_entrega  DATE ,
    fecha_creacion DATE
  ) ;
ALTER TABLE FACTURA ADD CONSTRAINT FACTURA_PK PRIMARY KEY ( id_factura ) ;


CREATE
  TABLE INVENTARIOS
  (
    id_inventario INTEGER NOT NULL ,
    id_producto   INTEGER NOT NULL ,
    ubicacion     VARCHAR2 (100) NOT NULL ,
    cantidad FLOAT NOT NULL ,
    fecha_crecion DATE
  ) ;
ALTER TABLE INVENTARIOS ADD CONSTRAINT VENTAS_PK PRIMARY KEY ( id_inventario )
;


CREATE
  TABLE PRODUCTOS
  (
    id_productos      INTEGER NOT NULL ,
    nombre            VARCHAR2 (100) NOT NULL ,
    codigo_barras     VARCHAR2 (100) NOT NULL ,
    fecha_vencimiento DATE NOT NULL ,
    precio_unitario FLOAT NOT NULL ,
    precio_costo FLOAT NOT NULL ,
    laboratorio    VARCHAR2 (100) NOT NULL ,
    alergias       VARCHAR2 (100) NOT NULL ,
    restrinciones  VARCHAR2 (100) NOT NULL ,
    fecha_creacion DATE NOT NULL ,
    id_proveedor   INTEGER NOT NULL
  ) ;
ALTER TABLE PRODUCTOS ADD CONSTRAINT PRODUCTOS_PK PRIMARY KEY ( id_productos )
;


CREATE
  TABLE PROVEEDOR
  (
    id_proveedor INTEGER NOT NULL ,
    nombre       VARCHAR2 (100) ,
    apellido     VARCHAR2 (100) ,
    direccion    VARCHAR2
    --  ERROR: VARCHAR2 size not specified
    NOT NULL ,
    telefono VARCHAR2
    --  ERROR: VARCHAR2 size not specified
    NOT NULL
  ) ;
ALTER TABLE PROVEEDOR ADD CONSTRAINT PROVEEDOR_PK PRIMARY KEY ( id_proveedor )
;


CREATE
  TABLE USUARIOS
  (
    id_usuarios        INTEGER NOT NULL ,
    usuario            VARCHAR2 (30) NOT NULL ,
    clave              VARCHAR2 (100) NOT NULL ,
    nombre_usuari      VARCHAR2 (100) NOT NULL ,
    fecha_creacion     DATE NOT NULL ,
    fecha_modificacion DATE
  ) ;
ALTER TABLE USUARIOS ADD CONSTRAINT USUARIOS_PK PRIMARY KEY ( id_usuarios ) ;


ALTER TABLE DETALLE_FACTURA ADD CONSTRAINT DETALLE_FACTURA_FACTURA_FK FOREIGN
KEY ( id_factura ) REFERENCES FACTURA ( id_factura ) ;

ALTER TABLE DETALLE_FACTURA ADD CONSTRAINT DETALLE_FACTURA_PRODUCTOS_FK FOREIGN
KEY ( id_producto ) REFERENCES PRODUCTOS ( id_productos ) ;

ALTER TABLE FACTURA ADD CONSTRAINT FACTURA_CLIENTES_FK FOREIGN KEY ( id_cliente
) REFERENCES CLIENTES ( id_clientes ) ;

ALTER TABLE INVENTARIOS ADD CONSTRAINT INVENTARIOS_PRODUCTOS_FK FOREIGN KEY (
id_producto ) REFERENCES PRODUCTOS ( id_productos ) ;

ALTER TABLE PRODUCTOS ADD CONSTRAINT PRODUCTOS_PROVEEDOR_FK FOREIGN KEY (
id_proveedor ) REFERENCES PROVEEDOR ( id_proveedor ) ;

ALTER TABLE USUARIOS ADD CONSTRAINT USUARIOS_CLIENTES_FK FOREIGN KEY (
id_usuarios ) REFERENCES CLIENTES ( id_clientes ) ;


-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             7
-- CREATE INDEX                             0
-- ALTER TABLE                             13
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   3
-- WARNINGS                                 0
