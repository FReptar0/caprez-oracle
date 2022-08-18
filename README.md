# caprez
Proyecto Integrador


### Se usa un contenedor en Docker para la conexi&oacute;n a la BD

Ejecutar para la creaci&oacute;n del contenedor:

- docker run --name CAPREZ -d -p 1521:1521 -p 5500:5500 -e ORACLE_PWD=caprez -e ORACLE_CHARACTERSET=AL32UTF8 container-registry.oracle.com/database/express:21.3.0-xe
- docker exec -it --user=oracle CAPREZ bash
- oraenv | XE

## El script de la base de datos se encuentra contenido dentro de <a href="CAPREZ.sql">CAPREZ.sql</a>
