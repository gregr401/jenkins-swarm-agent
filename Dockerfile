FROM docker:17.09

RUN apk --update add openjdk8-jre git ca-certificates wget\
    && update-ca-certificates

RUN wget -O swarm-client.jar https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/3.6/swarm-client-3.6.jar

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh  \
    && sed -i -e 's/\r$//' /entrypoint.sh

CMD ["/entrypoint.sh"]
