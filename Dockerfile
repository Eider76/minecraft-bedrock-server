# Usa una imagen base de Ubuntu
FROM ubuntu:latest

# Instala las dependencias necesarias
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    libssl1.1 \
    libcurl4

# Descarga el servidor de Minecraft Bedrock
RUN curl -L -o bedrock-server.zip https://minecraft.azureedge.net/bin-linux/bedrock-server-1.17.11.01.zip

# Descomprime el servidor
RUN unzip bedrock-server.zip -d bedrock-server

# Expone el puerto del servidor de Minecraft Bedrock
EXPOSE 19132/udp

# Copia los archivos de configuración del servidor
COPY server.properties bedrock-server/

# Ejecuta el servidor de Minecraft Bedrock
CMD cd bedrock-server && LD_LIBRARY_PATH=. ./bedrock_server
