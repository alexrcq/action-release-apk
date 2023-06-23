FROM debian:11-slim

LABEL "version"="0.0.6"
LABEL "com.github.actions.name"="Debug APK Publisher"
LABEL "com.github.actions.description"="Build & Publish Debug APK on Github"
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="red"

LABEL "repository"="https://github.com/alexrcq/action-release-debugapk"
LABEL "maintainer"="alexrcq"

RUN apt update \
	&& apt -y upgrade \
	&& apt install -y hub \
	&& apt autoremove \
	&& apt autoclean \
	&& apt clean

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
