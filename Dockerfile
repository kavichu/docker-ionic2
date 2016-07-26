FROM lvlds/android-sdk

RUN mkdir /app/ && \
    apt-get update && \
    apt-get install  -y curl && \
    curl -sL https://deb.nodesource.com/setup_5.x | bash - && \
    apt-get install -y nodejs
RUN npm install -g ionic@beta 
RUN npm install -g cordova 
RUN chwon -R jenkins:jenkins /app/
USER jenkins
WORKDIR /app/

VOLUME /app/

CMD ["ionic", "serve", "--lab", "--port", "8080", "--nobrowser", "--nolivereload"]