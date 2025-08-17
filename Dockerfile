FROM alpine:latest AS packager

RUN apk --no-cache add binutils
RUN apk --no-cache add openjdk21-jdk openjdk21-jmods

ENV JAVA_MINIMAL="/opt/java-minimal"

# build minimal JRE
RUN /usr/lib/jvm/java-21-openjdk/bin/jlink \
    --verbose \
    --add-modules \
        java.base,java.sql,java.naming,java.management,java.security.jgss,java.instrument,jdk.zipfs,java.desktop \
    --compress 2 --strip-debug --no-header-files --no-man-pages \
    --release-info="add:IMPLEMENTOR=radistao:IMPLEMENTOR_VERSION=radistao_JRE" \
    --output "$JAVA_MINIMAL"

FROM alpine:latest

ENV JAVA_HOME=/opt/java-minimal
ENV PATH="$PATH:$JAVA_HOME/bin"

COPY --from=packager "$JAVA_HOME" "$JAVA_HOME"
COPY target/ConvirgancePetClinic.jar ConvirgancePetClinic.jar

# Reduce startup time by caching startup processes
RUN /opt/java-minimal/bin/java -jar ConvirgancePetClinic.jar --prepare-container

ENTRYPOINT ["java","-jar","ConvirgancePetClinic.jar"]
EXPOSE 8080