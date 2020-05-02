FROM ubuntu
ENV TZ=Europe/Amsterdam
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get -y update && apt-get install -y npm
RUN npm config -g set strict-ssl false && npm install -g apiconnect || true
RUN mkdir /root/.apiconnect && \
    echo 1588406675036 >/root/.apiconnect/.license-accepted && \
    echo "enable-analytics: false" >/root/.apiconnect/config
