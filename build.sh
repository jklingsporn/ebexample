#!/bin/bash
set -e
now=$(date +"%Y-%m-%d_%H-%M-%S")
tag="./target/app-$now.zip"
mvn clean install
echo "web: ./run.sh" > target/Procfile
echo "exec java \$JAVA_OPTS -jar app.jar \$JAVA_ARGS" > target/run.sh
chmod +x target/run.sh
zip -j ${tag} target/Procfile target/run.sh target/app.jar




