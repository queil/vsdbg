FROM mcr.microsoft.com/dotnet/sdk:5.0

ENV ASPNETCORE_ENVIRONMENT=Development

RUN apt-get update && apt-get install -y --no-install-recommends unzip procps
RUN curl -sSL https://aka.ms/getvsdbgsh | bash /dev/stdin -v latest -l /var/vsdbg

WORKDIR /app

COPY ./watch.sh ./watch.sh
RUN chmod +x ./watch.sh

ENTRYPOINT ["sh", "/app/watch.sh"]
