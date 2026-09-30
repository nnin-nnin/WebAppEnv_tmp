FROM tomcat:8.5-jre8-slim

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN sed -i 's/deb.debian.org/archive.debian.org/g; s/security.debian.org/archive.debian.org/g; /stretch-updates/d' /etc/apt/sources.list \
    && apt-get -o Acquire::Check-Valid-Until=false update \
    && apt-get install -y --allow-unauthenticated --no-install-recommends curl \
    && rm -rf /var/lib/apt/lists/*

RUN sed -i 's/port="8080"/port="7777"/g' /usr/local/tomcat/conf/server.xml \
    && rm -rf /usr/local/tomcat/webapps/*

EXPOSE 7777
CMD ["catalina.sh", "run"]
