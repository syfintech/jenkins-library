FROM anapsix/alpine-java:8_server-jre_unlimited

VOLUME /tmp

ARG TARGET=target
ARG MODULE
ARG JAR_FILE=${MODULE}-1.0.0-SNAPSHOT.jar
ARG DOCKER_BUILD

ENV JAR_FILE=$JAR_FILE \
    MODULE=$MODULE \
    DEPLOY_PATH=/app \
    LANG=zh_CN.UTF-8 \
    LANGUAGE=zh_CN.UTF-8 \
    LD_LIBRARY_PATH=/lib

COPY ${TARGET}/${MODULE} ${DEPLOY_PATH}/${MODULE}/
COPY ${TARGET}/lib ${DEPLOY_PATH}/lib/

RUN wget https://raw.githubusercontent.com/ladenjet/jenkins-library/master/shell/entrypoint.sh -P ${DEPLOY_PATH}/ \
    && chmod +x ${DEPLOY_PATH}/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]