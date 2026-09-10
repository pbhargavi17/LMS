# MAVEN + GIT COMMANDS — EXAM CHEAT SHEET

## ==================== MAVEN ====================

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


# Check Maven installation
mvn -version

# Check/validate the pom.xml
mvn validate

# Compile the Java source code
mvn compile

# Run unit tests
mvn test

# Create the JAR/WAR file
mvn package

# Delete the previous target/ folder
mvn clean

# Clean and create a fresh JAR/WAR
mvn clean package

# Verify the project
mvn verify

# Install the generated artifact into the local Maven repository
mvn install

# Clean and install
mvn clean install

# Force Maven to update dependencies
mvn clean package -U

# Skip tests while building
mvn clean package -DskipTests


## MAVEN LIFECYCLE ORDER

# validate → check project
# compile  → compile source code
# test     → run tests
# package  → create JAR/WAR
# verify   → verify the package
# install  → install artifact into local .m2 repository
# deploy   → deploy artifact to remote repository


## MAVEN OUTPUT

# Java application:
# target/*.jar

# Web application:
# target/*.war


## ==================== GIT ====================

# Check Git installation
git --version

# Configure username
git config --global user.name "Your Name"

# Configure email
git config --global user.email "your@email.com"

# Check Git configuration
git config --list


## CREATE LOCAL REPOSITORY

# Initialize Git inside the current project
git init

# Check current repository status
git status


## ADD FILES

# Add all files to staging area
git add .

# Add only one file
git add filename


## COMMIT

# Save staged changes into Git history
git commit -m "Initial commit"

# View complete commit history
git log

# View compact commit history
git log --oneline


## ==================== GITHUB / REMOTE ====================

# Check connected remote repositories
git remote -v

# Add GitHub repository as remote named origin
git remote add origin https://github.com/USERNAME/REPOSITORY.git

# Remove an existing remote
git remote remove origin

# Rename current branch to master
git branch -M master

# Push master branch for the first time
# -u connects local master with origin/master
git push -u origin master

# Push future changes
git push


## CLONE A GITHUB REPOSITORY

# Download an existing repository
git clone https://github.com/USERNAME/REPOSITORY.git

# Enter the repository
cd REPOSITORY


## ==================== GIT BRANCHES ====================

# Display all local branches
git branch

# Create a new branch
git branch feature

# Create a branch AND switch to it
git checkout -b feature

# Modern command for creating + switching
git switch -c feature

# Switch to master
git checkout master

# Switch to another branch
git checkout feature

# Modern command for switching
git switch feature

# Delete a branch after merging
git branch -d feature

# Force delete a branch
git branch -D feature


## ==================== GIT MERGE ====================

# Switch to the branch that will receive the changes
git checkout master

# Merge feature branch into master
git merge feature

# Push merged changes to GitHub
git push


## MERGE CONFLICT

# Check which files have conflicts
git status

# Open the conflicted file and resolve:
#
# <<<<<<< HEAD
# Your code
# =======
# Feature branch code
# >>>>>>> feature
#
# Delete the conflict markers and keep the correct code.

# Stage the resolved file
git add .

# Complete the merge
git commit -m "Resolve merge conflict"

# Push changes
git push


## ==================== GIT REBASE ====================

# Move feature commits on top of the latest master
git checkout feature
git rebase master

# If a conflict occurs:
git status

# Resolve the conflict manually

# Stage the resolved file
git add .

# Continue the rebase
git rebase --continue

# Cancel the entire rebase
git rebase --abort


## MERGE vs REBASE

# MERGE:
# Combines branches and normally creates a merge commit.

# REBASE:
# Replays feature commits on top of another branch.
# It creates a cleaner linear history.


## ==================== GIT DIFFERENCES ====================

# Show changes that are not staged
git diff

# Show changes that are already staged
git diff --staged


## ==================== GIT UNDO ====================

# Remove a file from staging but keep its changes
git restore --staged filename

# Discard changes made to a file
git restore filename

# Undo the last commit but keep changes staged
git reset --soft HEAD~1

# Undo the last commit and keep changes unstaged
git reset HEAD~1

# Undo the last commit AND discard changes
# Use carefully because local changes can be lost
git reset --hard HEAD~1


## ==================== GIT STASH ====================

# Temporarily save unfinished changes
git stash

# Display saved stashes
git stash list

# Restore the latest stash and remove it from stash list
git stash pop

# Restore stash without removing it
git stash apply

# Delete a stash
git stash drop


## ==================== GIT TAGS ====================

# Create a version tag
git tag v1.0

# Display tags
git tag

# Push one tag to GitHub
git push origin v1.0

# Push all tags
git push --tags


## ==================== GIT FETCH / PULL ====================

# Download remote changes without merging
git fetch

# Download remote changes and merge them
git pull


## ============================================================
## COMPLETE EXAM WORKFLOW — MAVEN + GIT
## ============================================================

# STEP 1: Go to project folder
cd project-folder

# STEP 2: Check Maven project
mvn validate

# STEP 3: Build project
mvn clean package

# STEP 4: Check generated file
# Java → target/*.jar
# Web  → target/*.war

# STEP 5: Initialize Git
git init

# STEP 6: Check files
git status

# STEP 7: Add all project files
git add .

# STEP 8: Commit
git commit -m "Initial commit"

# STEP 9: Rename branch
git branch -M master

# STEP 10: Connect GitHub repository
git remote add origin https://github.com/USERNAME/REPOSITORY.git

# STEP 11: Push for first time
git push -u origin master

# STEP 12: For future modifications
git add .
git commit -m "Updated project"
git push


## ============================================================
## COMPLETE EXAM WORKFLOW — BRANCH + MERGE
## ============================================================

# Create feature branch
git checkout -b feature

# Make changes to project

# Stage changes
git add .

# Commit changes
git commit -m "Added feature"

# Switch to master
git checkout master

# Merge feature into master
git merge feature

# Push merged project
git push


## ============================================================
## COMPLETE EXAM WORKFLOW — REBASE
## ============================================================

# Switch to feature branch
git checkout feature

# Rebase feature onto master
git rebase master

# If conflict:
git status

# Resolve conflict manually

# Stage resolved files
git add .

# Continue rebase
git rebase --continue

# Push if required
git push


## ============================================================
## IMPORTANT EXAM COMMANDS TO MEMORIZE
## ============================================================

# MAVEN
mvn clean package
mvn compile
mvn test
mvn package
mvn install

# GIT BASIC
git init
git status
git add .
git commit -m "message"
git log
git clone URL
git remote -v
git remote add origin URL
git push
git pull

# GIT BRANCHING
git branch
git checkout -b feature
git checkout master
git merge feature
git rebase master
git rebase --continue
git rebase --abort

# GIT CONFLICT
git status
git add .
git commit

# GIT UNDO
git restore
git reset

# GIT TEMPORARY STORAGE
git stash
git stash pop
//////////////////////////////////////////////////////////////////////
nano Dockerfile
docker build -t mywebapp .
docker run -p 8080:8080 mywebapp
docker images
docker commit <container-id> <username>/mywebapp
docker push <username>/mywebapp

git init
git add .
git commit -m "push"
git remote add origin <repo-URL>
git push -u origin main
---------------------------------------------------------------------------------------------------------
