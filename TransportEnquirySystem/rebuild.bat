@echo off
echo Cleaning up old files...
rd /s /q "target" 2>nul
rd /s /q "lib" 2>nul

echo Creating directory structure...
mkdir "lib"
mkdir "target\classes"
mkdir "src\main\java\com\transport\controller" 2>nul
mkdir "src\main\java\com\transport\model" 2>nul
mkdir "src\main\resources\styles" 2>nul

echo Downloading JavaFX libraries...
curl -L -o "lib/javafx-controls-17.0.2.jar" "https://repo1.maven.org/maven2/org/openjfx/javafx-controls/17.0.2/javafx-controls-17.0.2.jar"
curl -L -o "lib/javafx-fxml-17.0.2.jar" "https://repo1.maven.org/maven2/org/openjfx/javafx-fxml/17.0.2/javafx-fxml-17.0.2.jar"
curl -L -o "lib/javafx-graphics-17.0.2.jar" "https://repo1.maven.org/maven2/org/openjfx/javafx-graphics/17.0.2/javafx-graphics-17.0.2.jar"
curl -L -o "lib/javafx-base-17.0.2.jar" "https://repo1.maven.org/maven2/org/openjfx/javafx-base/17.0.2/javafx-base-17.0.2.jar"
curl -L -o "lib/jfoenix-9.0.10.jar" "https://repo1.maven.org/maven2/com/jfoenix/jfoenix/9.0.10/jfoenix-9.0.10.jar"

echo Downloading Windows-specific JavaFX...
curl -L -o "lib/javafx-controls-17.0.2-win.jar" "https://repo1.maven.org/maven2/org/openjfx/javafx-controls/17.0.2/javafx-controls-17.0.2-win.jar"
curl -L -o "lib/javafx-fxml-17.0.2-win.jar" "https://repo1.maven.org/maven2/org/openjfx/javafx-fxml/17.0.2/javafx-fxml-17.0.2-win.jar"
curl -L -o "lib/javafx-graphics-17.0.2-win.jar" "https://repo1.maven.org/maven2/org/openjfx/javafx-graphics/17.0.2/javafx-graphics-17.0.2-win.jar"
curl -L -o "lib/javafx-base-17.0.2-win.jar" "https://repo1.maven.org/maven2/org/openjfx/javafx-base/17.0.2/javafx-base-17.0.2-win.jar"

echo Compiling Java files...

echo Compiling...
javac -d "target\classes" -cp "lib/*" --module-path "lib" --add-modules javafx.controls,javafx.fxml src\main\java\com\transport\*.java src\main\java\com\transport\controller\*.java

echo Running application...
java -cp "target\classes;lib/*" --module-path "lib" --add-modules javafx.controls,javafx.fxml com.transport.Main

pause
