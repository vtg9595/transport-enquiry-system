@echo off
echo Cleaning up...
del SimpleTest.class 2>nul
rd /s /q lib 2>nul

echo Creating lib directory...
mkdir lib

echo Downloading JavaFX...
curl -L -o "lib/javafx-controls-17.0.2.jar" "https://repo1.maven.org/maven2/org/openjfx/javafx-controls/17.0.2/javafx-controls-17.0.2.jar"
curl -L -o "lib/javafx-graphics-17.0.2.jar" "https://repo1.maven.org/maven2/org/openjfx/javafx-graphics/17.0.2/javafx-graphics-17.0.2.jar"
curl -L -o "lib/javafx-base-17.0.2.jar" "https://repo1.maven.org/maven2/org/openjfx/javafx-base/17.0.2/javafx-base-17.0.2.jar"

echo Downloading Windows-specific JavaFX...
curl -L -o "lib/javafx-controls-17.0.2-win.jar" "https://repo1.maven.org/maven2/org/openjfx/javafx-controls/17.0.2/javafx-controls-17.0.2-win.jar"
curl -L -o "lib/javafx-graphics-17.0.2-win.jar" "https://repo1.maven.org/maven2/org/openjfx/javafx-graphics/17.0.2/javafx-graphics-17.0.2-win.jar"
curl -L -o "lib/javafx-base-17.0.2-win.jar" "https://repo1.maven.org/maven2/org/openjfx/javafx-base/17.0.2/javafx-base-17.0.2-win.jar"

echo Compiling...
javac --module-path lib --add-modules javafx.controls SimpleTest.java

echo Running test application...
java --module-path lib --add-modules javafx.controls SimpleTest

pause
