FROM mcr.microsoft.com/dotnet/sdk:5.0

ENV ASPNETCORE_ENVIRONMENT=Development

RUN apk add --update-cache unzip procps curl && rm -rf /var/cache/apk/*
RUN curl -sSL https://aka.ms/getvsdbgsh | sh /dev/stdin -v latest -l /var/vsdbg 

WORKDIR /app

COPY ./watch.sh ./watch.sh
RUN chmod +x ./watch.sh

ENTRYPOINT ["sh", "/app/watch.sh"]
