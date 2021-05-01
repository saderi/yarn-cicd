FROM ubuntu:20.04

RUN apt-get update -yqq && \
    apt-get install -yqq \
    apt-utils ca-certificates \
    locales && \
    locale-gen en_US.UTF-8

ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'
RUN apt-get install -yqq imagemagick curl openssh-client curl

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update -yqq \
    && apt-get install -yqq nodejs yarn

RUN mkdir -p /root/.fonts
COPY fonts/*.ttf /root/.fonts/
