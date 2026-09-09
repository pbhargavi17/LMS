
<?xml version="1.0" encoding="UTF-8"?>

<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0
         https://maven.apache.org/xsd/maven-4.0.0.xsd">

    <!-- Maven model version -->
    <modelVersion>4.0.0</modelVersion>

    <!-- Project coordinates -->
    <groupId>com.example</groupId>
    <artifactId>JavaApplication</artifactId>
    <version>1.0-SNAPSHOT</version>

    <!-- JAR application -->
    <packaging>jar</packaging>

    <!-- Project properties -->
    <properties>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
        <maven.compiler.source>17</maven.compiler.source>
        <maven.compiler.target>17</maven.compiler.target>
    </properties>

    <!-- Dependencies -->
    <dependencies>

        <!-- JUnit -->
        <dependency>
            <groupId>junit</groupId>
            <artifactId>junit</artifactId>
            <version>4.13.2</version>
            <scope>test</scope>
        </dependency>

    </dependencies>

    <!-- Build configuration -->
    <build>

        <!-- Name of generated JAR -->
        <finalName>JavaApplication</finalName>

        <plugins>

            <!-- Compiler plugin -->
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
                <version>3.13.0</version>
                <configuration>
                    <source>17</source>
                    <target>17</target>
                </configuration>
            </plugin>

            <!-- JAR plugin -->
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-jar-plugin</artifactId>
                <version>3.4.2</version>
            </plugin>

        </plugins>

    </build>

</project>



<?xml version="1.0" encoding="UTF-8"?>

<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0
         https://maven.apache.org/xsd/maven-4.0.0.xsd">

    <!-- Maven model version -->
    <modelVersion>4.0.0</modelVersion>

    <!-- Project coordinates -->
    <groupId>com.example</groupId>
    <artifactId>WebApplication</artifactId>
    <version>1.0-SNAPSHOT</version>

    <!-- WAR application -->
    <packaging>war</packaging>

    <!-- Project properties -->
    <properties>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
        <maven.compiler.source>17</maven.compiler.source>
        <maven.compiler.target>17</maven.compiler.target>
    </properties>

    <!-- Dependencies -->
    <dependencies>

        <!-- Servlet API -->
        <dependency>
            <groupId>javax.servlet</groupId>
            <artifactId>javax.servlet-api</artifactId>
            <version>4.0.1</version>
            <scope>provided</scope>
        </dependency>

        <!-- JSP API -->
        <dependency>
            <groupId>javax.servlet.jsp</groupId>
            <artifactId>javax.servlet.jsp-api</artifactId>
            <version>2.3.3</version>
            <scope>provided</scope>
        </dependency>

        <!-- JUnit -->
        <dependency>
            <groupId>junit</groupId>
            <artifactId>junit</artifactId>
            <version>4.13.2</version>
            <scope>test</scope>
        </dependency>

    </dependencies>

    <!-- Build configuration -->
    <build>

        <!-- Name of generated WAR -->
        <finalName>WebApplication</finalName>

        <plugins>

            <!-- Compiler plugin -->
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
                <version>3.13.0</version>
                <configuration>
                    <source>17</source>
                    <target>17</target>
                </configuration>
            </plugin>

            <!-- WAR plugin -->
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-war-plugin</artifactId>
                <version>3.4.0</version>
            </plugin>

        </plugins>

    </build>

</project>




FROM eclipse-temurin:17-jdk
WORKDIR /app
COPY target/*.jar app.jar
CMD ["java", "-jar", "app.jar"]

# 1. Build the JAR using Maven
mvn clean package

# 2. Build Docker image
docker build -t myjavaapp .

# 3. Run the container
docker run -d -p 8080:8080 --name java-container myjavaapp

# 4. Check running container
docker ps

# 5. Login to Docker Hub
docker login

# 6. Tag the image
docker tag myjavaapp:latest <dockerhub-username>/javaapp:1.0

# 7. Push image to Docker Hub
docker push <dockerhub-username>/javaapp:1.0



FROM tomcat:9
COPY target/*.war /usr/local/tomcat/webapps/

# 1. Build the WAR using Maven
mvn clean package

# 2. Build Docker image
docker build -t mywebapp .

# 3. Run the container
docker run -d -p 8081:8080 --name web-container mywebapp

# 4. Check running container
docker ps

# 5. Login to Docker Hub
docker login

# 6. Tag the image
docker tag mywebapp:latest <dockerhub-username>/webapp:1.0

# 7. Push image to Docker Hub
docker push <dockerhub-username>/webapp:1.0

