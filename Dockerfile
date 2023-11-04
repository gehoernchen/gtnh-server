FROM bellsoft/liberica-runtime-container:jdk-all-17-slim-glibc

ARG modpackurl=http://downloads.gtnewhorizons.com/ServerPacks/GT_New_Horizons_2.4.0_Server_Java_17-20.zip

RUN wget ${modpackurl}

RUN unzip $(basename ${modpackurl}) -d /data

WORKDIR /data
RUN chmod +x startserver-9.sh
RUN sed -i 's;false;true;' eula.txt

EXPOSE 25565/tcp

CMD ["sh", "startserver-9.sh"]
