@echo off
echo Cleaning up previous build...
rd /s /q "target" 2>nul
rd /s /q "lib" 2>nul

echo Creating directories...
mkdir "lib"
mkdir "target\classes"

echo Downloading JavaFX and required libraries...
curl -L -o "lib/javafx-controls-17.0.2.jar" "https://repo1.maven.org/maven2/org/openjfx/javafx-controls/17.0.2/javafx-controls-17.0.2.jar"
curl -L -o "lib/javafx-fxml-17.0.2.jar" "https://repo1.maven.org/maven2/org/openjfx/javafx-fxml/17.0.2/javafx-fxml-17.0.2.jar"
curl -L -o "lib/javafx-graphics-17.0.2.jar" "https://repo1.maven.org/maven2/org/openjfx/javafx-graphics/17.0.2/javafx-graphics-17.0.2.jar"
curl -L -o "lib/javafx-base-17.0.2.jar" "https://repo1.maven.org/maven2/org/openjfx/javafx-base/17.0.2/javafx-base-17.0.2.jar"
curl -L -o "lib/jfoenix-9.0.10.jar" "https://repo1.maven.org/maven2/com/jfoenix/jfoenix/9.0.10/jfoenix-9.0.10.jar"

echo Downloading platform-specific JavaFX files for Windows...
curl -L -o "lib/javafx-controls-17.0.2-win.jar" "https://repo1.maven.org/maven2/org/openjfx/javafx-controls/17.0.2/javafx-controls-17.0.2-win.jar"
curl -L -o "lib/javafx-fxml-17.0.2-win.jar" "https://repo1.maven.org/maven2/org/openjfx/javafx-fxml/17.0.2/javafx-fxml-17.0.2-win.jar"
curl -L -o "lib/javafx-graphics-17.0.2-win.jar" "https://repo1.maven.org/maven2/org/openjfx/javafx-graphics/17.0.2/javafx-graphics-17.0.2-win.jar"
curl -L -o "lib/javafx-base-17.0.2-win.jar" "https://repo1.maven.org/maven2/org/openjfx/javafx-base/17.0.2/javafx-base-17.0.2-win.jar"

echo Creating source directory structure...
mkdir "target\classes\com\transport\controllers" 2>nul
mkdir "target\classes\fxml" 2>nul
mkdir "target\classes\styles" 2>nul
mkdir "target\classes\images" 2>nul

echo Copying resources...
xcopy /Y /S "src\main\resources\*" "target\classes\"

echo Compiling Java files...
dir /s /B src\main\java\com\transport\*.java > sources.txt
dir /s /B src\main\java\com\transport\controllers\*.java >> sources.txt

javac -verbose -cp "lib/*" --module-path "lib" --add-modules javafx.controls,javafx.fxml,javafx.graphics,javafx.base -d "target\classes" @sources.txt

echo Running the application...
java -cp "target\classes;lib/*" --module-path "lib" --add-modules javafx.controls,javafx.fxml,javafx.graphics,javafx.base com.transport.Main

pause
