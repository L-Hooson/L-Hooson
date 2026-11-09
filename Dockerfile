# Meridian Operations Portal public training application.
# Source is stored in verified, base64-encoded archive parts on this isolated branch.
FROM tomcat:9.0-jre17-temurin AS tomcatlibs

FROM eclipse-temurin:17-jdk-jammy AS build
COPY --from=tomcatlibs /usr/local/tomcat/lib/servlet-api.jar /usr/local/tomcat/lib/servlet-api.jar
WORKDIR /source
COPY meridian-source/ ./archive-parts/
RUN cat ./archive-parts/part-*.b64 | base64 --decode | tar -xz -C /source \
    && chmod +x ./scripts/build.sh \
    && ./scripts/build.sh

FROM tomcat:9.0-jre17-temurin
ENV PORT=10000
RUN rm -rf /usr/local/tomcat/webapps/* \
    && mkdir -p /usr/local/tomcat/webapps/ROOT/WEB-INF/classes \
    && sed -i 's/port="8080" protocol="HTTP\/1.1"/port="${PORT}" maxPostSize="4096" protocol="HTTP\/1.1"/' /usr/local/tomcat/conf/server.xml
COPY --from=build /source/web/ /usr/local/tomcat/webapps/ROOT/
COPY --from=build /source/out/ /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/
COPY --from=build /source/scripts/start.sh /usr/local/bin/meridian-start
RUN chmod +x /usr/local/bin/meridian-start \
    && sed -i 's/<Server port="8005" shutdown="SHUTDOWN">/<Server port="-1" shutdown="SHUTDOWN">/' /usr/local/tomcat/conf/server.xml
EXPOSE 10000
CMD ["/usr/local/bin/meridian-start"]
