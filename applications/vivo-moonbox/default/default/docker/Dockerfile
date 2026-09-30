FROM --platform=linux/amd64 eclipse-temurin:8-jre

WORKDIR /moonbox

RUN apt-get update && apt-get install -y --no-install-recommends curl zip && rm -rf /var/lib/apt/lists/*

COPY moon-box-web /moonbox/moon-box-web.jar
COPY moonbox-agent.tar /moonbox/moonbox-agent.tar
COPY sandbox-agent.tar /moonbox/sandbox-agent.tar
COPY dist /moonbox/dist

RUN mkdir -p /root/moonbox-agent-download && \
    cp /moonbox/moonbox-agent.tar /root/moonbox-agent-download/moonbox-agent-1.tar && \
    cp /moonbox/sandbox-agent.tar /root/moonbox-agent-download/sandbox-agent-1.tar

RUN mkdir -p /tmp/BOOT-INF/classes/static && \
    cp -r /moonbox/dist/* /tmp/BOOT-INF/classes/static/ && \
    cd /tmp && zip -u /moonbox/moon-box-web.jar -r BOOT-INF/classes/static/ && \
    rm -rf /tmp/BOOT-INF

ENV SPRING_DATASOURCE_URL="jdbc:mysql://db:3306/repeater_console?characterEncoding=UTF-8&autoReconnect=true&allowMultiQueries=true" \
    SPRING_DATASOURCE_USERNAME="root" \
    SPRING_DATASOURCE_PASSWORD="AdminPassword123!" \
    SPRING_REDIS_CLUSTERNODES="none" \
    SPRING_WEB_RESOURCES_STATIC_LOCATIONS="file:/moonbox/dist/,classpath:/static/" \
    SPRING_RESOURCES_STATIC_LOCATIONS="file:/moonbox/dist/,classpath:/static/"

EXPOSE 8080

HEALTHCHECK --interval=5s --timeout=5s --start-period=30s --retries=10 \
  CMD curl -f -s http://127.0.0.1:8080/api/app/supportEnv || exit 1

ENTRYPOINT ["java", "-jar", "/moonbox/moon-box-web.jar"]
