--Se crear Stream principal que trae todas las transacciones del topico
CREATE STREAM "s_ksql_transactions_fraud" 
(
    transaction_id VARCHAR,
    account_id VARCHAR,
    transaction_date VARCHAR,
    transaction_time VARCHAR,
    amount VARCHAR,
    merchant_name VARCHAR,
    merchant_category VARCHAR,
    location VARCHAR,
    card_present VARCHAR,
    fraud_type VARCHAR,
    risk_score VARCHAR
) 
WITH (kafka_topic = 'topic-fraud-transactions', value_format = 'AVRO');

--Consultas directas al stream principal
SELECT * FROM `s_ksql_transactions_fraud`;

--Se crea stream para filtrar las transacciones de alto riesgo en donde el riesgo sea mayor o igual a 95
CREATE STREAM "s_ksql_transactions_high_risk" AS
SELECT *
FROM "s_ksql_transactions_fraud"
WHERE CAST(risk_score AS INT) >= 95 EMIT CHANGES;

--Se crea tabla para agrupacion de datos
CREATE TABLE "s_ksql_transactions_groups" AS
SELECT FRAUD_TYPE, COUNT(1) AS COUNTS
FROM "s_ksql_transactions_high_risk"
GROUP BY FRAUD_TYPE
EMIT CHANGES;