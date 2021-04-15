FROM java:openjdk-8-jdk-alpine

COPY . /kotlin-blockchain-crypto

RUN apk update && \
    apk add build-base bash curl && \
    cd /kotlin-blockchain-crypto && ./gradlew clean && \
    cd /kotlin-blockchain-crypto && ./gradlew build && \
    mkdir -p /usr/local/kotlin-blockchain-crypto/lib && \
    cp -R /kotlin-blockchain-crypto/build/libs/* /usr/local/kotlin-blockchain-crypto/lib && \
    curl -o /usr/local/kotlin-blockchain-crypto/lib/jolokia-jvm-agent.jar https://repo1.maven.org/maven2/org/jolokia/jolokia-jvm/1.3.5/jolokia-jvm-1.3.5-agent.jar && \
    rm -rf /var/cache/apk/* && \
    rm -rf ~/.gradle && \
    rm -rf /kotlin-blockchain-crypto

ENTRYPOINT java $JAVA_OPTS -javaagent:/usr/local/kotlin-blockchain-crypto/lib/jolokia-jvm-agent.jar=port=8778,host=0.0.0.0 -jar /usr/local/kotlin-blockchain-crypto/lib/kotlin-blockchain-crypto-1.0-SNAPSHOT.jar

EXPOSE 4567 8778