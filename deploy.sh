#!/bin/bash

# Comprobación de Docker
echo "Comprobando si Docker está instalado..."

if ! command -v docker &> /dev/null; then
    echo "Error: Docker no está instalado."
    exit 1
fi

# Comprobación de Docker Compose
echo "Comprobando si Docker Compose está instalado..."

if ! command -v docker-compose &> /dev/null; then
    echo "Error: Docker Compose no está instalado."
    exit 1
fi

# Comprobación de puertos (80 y 3306)
echo "Comprobando si los puertos 80 y 3306 están libres..."

if lsof -i:80 &> /dev/null; then
    echo "Error: El puerto 80 ya está en uso."
    exit 1
fi

if lsof -i:3306 &> /dev/null; then
    echo "Error: El puerto 3306 ya está en uso."
    exit 1
fi

# Levantar los contenedores con Docker Compose
echo "Todo está bien. Levantando los contenedores..."
docker-compose up -d

echo "¡Despliegue completado exitosamente!"
