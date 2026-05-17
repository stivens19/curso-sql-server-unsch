# Temario SQL

## 🟢 Bloque 1: Fundamentos y Nivel Principiante (El Inicio)

*El objetivo aquí es entender qué es una base de datos relacional y aprender a extraer y manipular información básica.*

### 1. Configuración del entorno

- Atajos

### 2. Lenguaje de Consulta de Datos (DQL - El comando `SELECT`)

- Estructura básica: `SELECT`, `FROM`.
- Filtrar información: La cláusula `WHERE` y operadores (`=`, `<>`, `>`, `<`, `BETWEEN`, `IN`, `LIKE`).
- Manejo de valores nulos (`IS NULL`, `IS NOT NULL`).
- Ordenamiento de datos: `ORDER BY` (Ascendente y Descendente).
- Limitar resultados: Uso de `TOP` y `DISTINCT`.

### 3. Manipulación de Datos (DML)

- Insertar registros: `INSERT INTO`.
- Actualizar registros de forma segura: `UPDATE`.
- Eliminar registros: `DELETE` vs `TRUNCATE TABLE`.

---

## 🟡 Bloque 2: Nivel Intermedio (Agregaciones y Relaciones)

*Aquí aprenderás a combinar múltiples tablas y a realizar análisis y resúmenes de datos.*

### 4. Uniones de Tablas (JOINS)

- El concepto de combinar conjuntos de datos.
- `INNER JOIN`: Intersección de datos.
- `LEFT JOIN` y `RIGHT JOIN`: Priorizando tablas.
- `FULL OUTER JOIN` y `CROSS JOIN`.
- Buenas prácticas: Uso de alias en tablas.

### 5. Agrupaciones y Funciones de Agregado

- Funciones matemáticas básicas: `SUM`, `AVG`, `COUNT`, `MIN`, `MAX`.
- Agrupar datos con `GROUP BY`.
- Filtrar datos agrupados: La diferencia crucial entre `WHERE` y `HAVING`.

### 6. Operadores de Conjuntos y Subconsultas

- Combinar resultados verticalmente: `UNION` vs `UNION ALL`.
- Intersección y excepción: `INTERSECT` y `EXCEPT`.
- Subconsultas (Subqueries) básicas en el `WHERE` y en el `FROM` (Tablas derivadas).

### 7. Funciones del Sistema Integradas

- Funciones de cadena (`LEN`, `SUBSTRING`, `CONCAT`, `REPLACE`).
- Funciones de fecha (`GETDATE`, `DATEADD`, `DATEDIFF`, `YEAR`, `MONTH`).
- Funciones de conversión de tipo (`CAST` y `CONVERT`).
- Lógica condicional dentro de consultas: Expresión `CASE WHEN`.

---

## 🟠 Bloque 3: Nivel Avanzado - Programación y Objetos (T-SQL)

*En esta etapa dejas de ser un simple consultor de datos y empiezas a automatizar y programar dentro del motor.*

### 8. Definición de Datos Avanzada (DDL) y Restricciones

- Creación y modificación de objetos: `CREATE TABLE`, `ALTER TABLE`, `DROP TABLE`.
- Restricciones de integridad: `UNIQUE`, `CHECK`, `DEFAULT`.

### 9. Expresiones de Tabla Avanzadas (CTEs) y Consultas Jerárquicas

- Expresiones de Tabla Comunes (**CTEs**): Sintaxis `WITH`.
- CTEs Recursivas (para organigramas o estructuras jerárquicas).
- Operadores avanzados: `PIVOT`, `UNPIVOT`, `CROSS APPLY` y `OUTER APPLY`.

### 10. Funciones de Ventana (Window Functions)

- Introducción a la cláusula `OVER()`.
- Funciones de clasificación: `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`, `NTILE()`.
- Funciones analíticas: `LEAD()`, `LAG()`, `FIRST_VALUE()`, `LAST_VALUE()`.
- Agregados móviles (acumulados con `ROWS BETWEEN`).

### 11. Programación T-SQL

- Variables locales (`DECLARE`, `SET`).
- Estructuras de control: `IF...ELSE`, bucles `WHILE`.
- Manejo de tablas temporales (`#TablaTemporal`) y variables de tabla (`@Tabla`).
- Control de errores robusto: Bloques `TRY...CATCH`.

### 12. Automatización: Objetos Programables

- **Vistas (Views):** Cuándo usarlas y vistas indexadas.
- **Procedimientos Almacenados (Stored Procedures):** Parámetros de entrada, salida y buenas prácticas.
- **Funciones Definidas por el Usuario (UDFs):** Escalares y de tabla (Inline vs Multi-statement).
- **Disparadores (Triggers):** Eventos `AFTER` e `INSTEAD OF`. Uso de las tablas del sistema `inserted` y `deleted`.

---

## 🔴 Bloque 4: Nivel Experto - Optimización y Administración (DBA / Data Engineer)

*Cómo hacer que las consultas vuelen, asegurar la base de datos y mantener el servidor sano.*

### 13. Transacciones y Concurrencia

- Propiedades ACID.
- Control explícito: `BEGIN TRANSACTION`, `COMMIT` y `ROLLBACK`.
- Niveles de aislamiento (*Isolation Levels*) y problemas de concurrencia (lecturas sucias, lecturas no repetibles, fantasmas).
- Bloqueos (*Locks*) y cómo resolver Bloqueos Mutuos (*Deadlocks*).

### 14. Arquitectura Interna y Rendimiento (Performance Tuning)

- Cómo almacena SQL Server los datos (Páginas de 8KB, Extents).
- **Estrategia de Índices:** Índices Clúster (*Clustered*) vs No Clúster (*Non-Clustered*).
- Lectura e interpretación de **Planes de Ejecución** (Table Scan vs Index Seek).
- Estadísticas: Importancia y mantenimiento.
- Uso del Consultor de Optimización (*Database Engine Tuning Advisor*).

### 15. Administración Básica y Seguridad

- Estrategias de respaldo: Backups Completos (*Full*), Diferenciales y de Registro de Transacciones (*Log*).
- Seguridad: Logins (servidor) vs Users (base de datos), Roles y Permisos (`GRANT`, `REVOKE`).

### 16. Funcionalidades Modernas y Big Data

- Manejo de datos en formato **JSON** y **XML** desde SQL Server.
- Introducción a tablas optimizadas para memoria (*In-Memory OLTP*).
- Conectividad con herramientas de análisis (Power BI / Excel).
