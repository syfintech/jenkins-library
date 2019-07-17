#!/bin/sh

cd /${DEPLOY_PATH}/${MODULE}
java -Djava.security.egd=file:/dev/./urandom -Dloader.path=.,../lib ${JAVA_OPTS} -jar ${JAR_FILE} --spring.profiles.active=${SPRING_PROFILE}