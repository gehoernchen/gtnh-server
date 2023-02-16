FROM openjdk:8-jre

ARG modpackurl=http://downloads.gtnewhorizons.com/ServerPacks/GT_New_Horizons_2.2.0.0_SERVER.zip

RUN wget ${modpackurl}

RUN unzip $(basename ${modpackurl}) -d /data

WORKDIR /data
RUN chmod +x startserver.sh
RUN sed -i 's;false;true;' eula.txt

EXPOSE 25565/tcp

CMD ["sh", "startserver.sh"]
