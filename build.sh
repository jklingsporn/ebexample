#!/bin/bash
set -e
if [ -n "$1" ]; then
        now=$(date +"%Y-%m-%d_%H-%M-%S")
        tag="./target/app-$1-$now.zip"
        mvn clean install -P$1
        echo "web: ./run.sh" > target/Procfile
        echo "exec java \$JAVA_OPTS -jar app-$1.jar \$JAVA_ARGS" > target/run.sh
        chmod +x target/run.sh
        zip -j ${tag} target/Procfile target/run.sh target/app-$1.jar
    else
        echo "Requires profile [local, dev, qa, prod]!"
        exit 1
fi




