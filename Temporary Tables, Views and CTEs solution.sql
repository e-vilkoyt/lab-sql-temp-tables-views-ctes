USE sakila;

-- Desafío
-- Creación de un Informe de Resumen de Clientes
-- En este ejercicio, crearás un informe de resumen de clientes que resume información clave sobre los clientes en la base de datos Sakila, incluyendo su historial de alquiler y detalles de pago. El informe se generará utilizando una combinación de vistas, CTEs y tablas temporales.

-- Paso 1: Eliminar la Vista si Existe y Crear una Nueva Vista
-- Primero, elimina la vista si ya existe y luego crea una nueva vista que resuma la información de alquiler para cada cliente.
DROP VIEW IF EXISTS customer_rental_information;

CREATE VIEW customer_rental_information AS
SELECT c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    c.email,
    COUNT(DISTINCT (r.rental_id)) AS rental_count
FROM customer AS c
LEFT JOIN rental AS r ON c.customer_id = r.customer_id
GROUP BY c.customer_id;

-- Paso 2: Crear una Tabla Temporal
-- A continuación, crea una Tabla Temporal que calcule el monto total pagado por cada cliente (total_paid). La Tabla Temporal debe usar la vista de resumen de alquiler creada en el Paso 1 para unirse con la tabla de pagos y calcular el monto total pagado por cada cliente.
CREATE TEMPORARY TABLE total_amount_customer AS
SELECT cri.customer_id,
    SUM(p.amount) AS total_paid
FROM customer_rental_information AS cri
JOIN payment AS p ON cri.customer_id = p.customer_id
GROUP BY cri.customer_id;

-- Paso 3: Crear un CTE y el Informe de Resumen de Clientes
-- Crea un CTE que una la vista de resumen de alquiler con la Tabla Temporal de resumen de pagos de clientes creada en el Paso 2. El CTE debe incluir el nombre del cliente, la dirección de correo electrónico, el número de alquileres y el monto total pagado.
-- A continuación, utilizando el CTE, crea la consulta para generar el informe final de resumen de clientes, que debe incluir: nombre del cliente, correo electrónico, rental_count, total_paid y average_payment_per_rental. Esta última columna es una columna derivada de total_paid y rental_count.
WITH customer_summary AS (
    SELECT cri.customer_name, cri.email, cri.rental_count, tac.total_paid,
        CASE 
            WHEN cri.rental_count > 0 THEN tac.total_paid / cri.rental_count
            ELSE 0
        END AS average_payment_per_rental
    FROM customer_rental_information AS cri
    JOIN total_amount_customer AS tac ON cri.customer_id = tac.customer_id
)
SELECT customer_name, email, rental_count, total_paid, average_payment_per_rental
FROM customer_summary
ORDER BY customer_name;
