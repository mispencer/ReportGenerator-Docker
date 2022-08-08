ARG PACKAGEVERSION=5.1.9
FROM mcr.microsoft.com/dotnet/sdk:6.0-alpine AS build
ARG PACKAGEVERSION
RUN apk update && \
	mkdir app && \
	cd app && \
	dotnet new console && \
	dotnet add package ReportGenerator --version $PACKAGEVERSION && \
	dotnet restore && \
	rm -rf *.csproj *.cs ./obj

FROM mcr.microsoft.com/dotnet/runtime:6.0-alpine
ARG PACKAGEVERSION
WORKDIR /app
RUN mkdir ./coverage
COPY --from=build ./root/.nuget/packages/reportgenerator/${PACKAGEVERSION}/tools/net6.0/* .

ENTRYPOINT ["dotnet", "ReportGenerator.dll"]
