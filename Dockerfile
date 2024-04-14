# Usa la imagen de Maven
FROM maven:3.9.6-eclipse-temurin-17-focal AS build

# Establece el directorio de trabajo en /app
WORKDIR /app

# Copia todo el contenido del proyecto al directorio de trabajo
COPY . .

# Compila la aplicación
RUN mvn clean package

# Segunda etapa del Dockerfile para la ejecución
FROM maven:3.9.6-eclipse-temurin-17-focal

# Establece el directorio de trabajo en /app
WORKDIR /app

# Copia el JAR compilado desde la etapa de compilación
COPY --from=build /app/target/crud-0.0.1-SNAPSHOT.jar ./java-app.jar

# Comando por defecto para ejecutar la aplicación
CMD ["java", "-jar", "java-app.jar"]
