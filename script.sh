#!/bin/bash

docker build -t blazor_image .

CONTAINER_NAME="blazor_container"

# Borrar el contenedor y capturar el resultado
if docker rm -f "$CONTAINER_NAME"; then
    echo "El contenedor '$CONTAINER_NAME' ha sido borrado exitosamente."
else
    echo "Error: No se pudo borrar el contenedor '$CONTAINER_NAME'."
fi

docker run -dp 8080:80 --name "$CONTAINER_NAME" blazor_image
