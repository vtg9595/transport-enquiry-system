@echo off
echo Downloading JavaFX and required libraries...

REM Create directories
mkdir "lib" 2>nul
mkdir "target\classes" 2>nul

REM Download JavaFX and other dependencies
curl -L -o "lib/javafx-controls-17.0.2.jar" "https://repo1.maven.org/maven2/org/openjfx/javafx-controls/17.0.2/javafx-controls-17.0.2.jar"
curl -L -o "lib/javafx-fxml-17.0.2.jar" "https://repo1.maven.org/maven2/org/openjfx/javafx-fxml/17.0.2/javafx-fxml-17.0.2.jar"
curl -L -o "lib/javafx-graphics-17.0.2.jar" "https://repo1.maven.org/maven2/org/openjfx/javafx-graphics/17.0.2/javafx-graphics-17.0.2.jar"
curl -L -o "lib/javafx-base-17.0.2.jar" "https://repo1.maven.org/maven2/org/openjfx/javafx-base/17.0.2/javafx-base-17.0.2.jar"
curl -L -o "lib/jfoenix-9.0.10.jar" "https://repo1.maven.org/maven2/com/jfoenix/jfoenix/9.0.10/jfoenix-9.0.10.jar"

REM Download platform-specific JavaFX files for Windows
curl -L -o "lib/javafx-controls-17.0.2-win.jar" "https://repo1.maven.org/maven2/org/openjfx/javafx-controls/17.0.2/javafx-controls-17.0.2-win.jar"
curl -L -o "lib/javafx-fxml-17.0.2-win.jar" "https://repo1.maven.org/maven2/org/openjfx/javafx-fxml/17.0.2/javafx-fxml-17.0.2-win.jar"
curl -L -o "lib/javafx-graphics-17.0.2-win.jar" "https://repo1.maven.org/maven2/org/openjfx/javafx-graphics/17.0.2/javafx-graphics-17.0.2-win.jar"
curl -L -o "lib/javafx-base-17.0.2-win.jar" "https://repo1.maven.org/maven2/org/openjfx/javafx-base/17.0.2/javafx-base-17.0.2-win.jar"

echo Compiling...

REM Compile
javac --module-path "lib" --add-modules javafx.controls,javafx.fxml,javafx.graphics,javafx.base -d "target\classes" src/main/java/com/transport/*.java src/main/java/com/transport/controllers/*.java

echo Running the application...

REM Run
java --module-path "lib" --add-modules javafx.controls,javafx.fxml,javafx.graphics,javafx.base -cp "target\classes;lib/*" com.transport.Main

pause
