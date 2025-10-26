# LMS_Reto3_Pipeline_De_Datos_End-to-End
En este proyecto se utiliza Kafka, Docker, Postgres, Conduktor, Zookeeper para realizar un pipeline que toma datos de transacciones a partir de un archivo csv procesarlo, cargarlos a un topico de kafka y que un consumidor tome esos datos y los persista en postgres.

# Objetivo Principal
Implementar un pipeline de datos end-to-end utilizando el ecosistema de Apache Kafka para procesar transacciones financieras en tiempo real y detectar posibles casos de fraude, este es un proceso, pero les aplica para cualquier proceso de modernización de Legados para procesos CDC.

# Tareas

1) Ingesta de Datos (50% del reto)
- Configurar un Source Connector que lea un archivo CSV con transacciones financieras
- Publicar los datos en el tópico trx-fraud-transactions en formato JSON
- Configurar un Sink Connector para persistir los datos en PostgreSQL

2) Procesamiento de Streaming (50% del reto)
- Crear streams en ksqlDB sobre el tópico de transacciones
- Implementar consultas continuas para filtrado, agregación y enriquecimiento
- Detectar transacciones sospechosas basadas en patrones de fraude

# Componentes del Flujo
- Archivo CSV: Contiene transacciones financieras con campos como account_id, amount, timestamp, location, etc.
- Spooler CSV Source Connector: Lee archivos CSV desde un directorio monitoreado
- Kafka Topic: trx-fraud-transactions - almacena las transacciones en formato JSON
- ksqlDB: Procesa las transacciones en tiempo real para detectar fraude
- PostgreSQL Sink Connector: Almacena las transacciones procesadas en base de datos
- PostgreSQL: Base de datos para almacenamiento persistente
