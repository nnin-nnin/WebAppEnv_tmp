FROM mirror.gcr.io/library/node:12.22.12-buster AS frontend

WORKDIR /build
COPY source/mall-admin-web-1.0.0/ /build/
COPY source/mall-1.0.3/document/resource/qrcode_for_macrozheng_258.jpg /build/static/qrcode_for_macrozheng_258.jpg

RUN sed -i 's#https://admin-api.macrozheng.com##' config/prod.env.js \
    && sed -i '/<!-- Global site tag/,+7d; /<!--Baidu Analytics-->/,+9d; s#https://unpkg.com/tinymce@4.7.5/tinymce.min.js#./static/tinymce4.7.5/tinymce.min.js#' index.html \
    && sed -i 's#http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/banner/qrcode_for_macrozheng_258.jpg#/static/qrcode_for_macrozheng_258.jpg#' src/views/login/index.vue \
    && sed -i 's#<img class="user-avatar" :src="avatar">#<svg-icon v-if="!avatar" icon-class="user" class="user-avatar"></svg-icon><img v-else class="user-avatar" :src="avatar">#' src/views/layout/components/Navbar.vue \
    && npm ci --no-audit --no-fund \
    && npm run build \
    && test -s dist/index.html

FROM mirror.gcr.io/library/maven:3.9.9-eclipse-temurin-8

WORKDIR /build
ENV MAVEN_OPTS="-Xms128m -Xmx512m -XX:MaxMetaspaceSize=256m -XX:+UseSerialGC"
COPY source/mall-1.0.3/ /build/

RUN printf '%s\n' \
      '<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0 https://maven.apache.org/xsd/settings-1.0.0.xsd"><mirrors><mirror><id>central-only</id><mirrorOf>*</mirrorOf><url>https://repo.maven.apache.org/maven2/</url></mirror></mirrors></settings>' \
      > /tmp/maven-settings.xml \
    && mvn -s /tmp/maven-settings.xml -B -ntp -pl mall-admin -am package \
      -DskipTests \
      -Ddocker.skip=true \
      -Dmaven.javadoc.skip=true \
    && test -s /build/mall-admin/target/mall-admin-1.0-SNAPSHOT.jar \
    && rm -f /tmp/maven-settings.xml

RUN mkdir -p /build/mall-admin-web
COPY --from=frontend /build/dist/ /build/mall-admin-web/dist/
