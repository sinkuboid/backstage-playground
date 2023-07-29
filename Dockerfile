FROM jhipster/jhipster:v8.0.0-beta.2
USER root
RUN \
    npm install -g generator-jhipster-azure-spring-apps

USER jhipster
COPY --chown=jhipster:jhipster target/*.war /home/jhipster/

ENV SPRING_OUTPUT_ANSI_ENABLED=ALWAYS \
    JHIPSTER_SLEEP=0 \
    JAVA_OPTS=""
CMD echo "The application will start in ${JHIPSTER_SLEEP}s..." && \
    sleep ${JHIPSTER_SLEEP} && \
    java ${JAVA_OPTS} -Djava.security.egd=file:/dev/./urandom -jar /home/jhipster/jhonline*.war
EXPOSE 8080
