FROM mcr.microsoft.com/dotnet/sdk:6.0-alpine AS build

RUN apk update && \
	dotnet new console && \
    dotnet add package ReportGenerator --version 5.0.4 && \
	dotnet restore && \
	rm -rf *.csproj *.cs ./obj
	
FROM mcr.microsoft.com/dotnet/runtime:6.0

WORKDIR /app
RUN mkdir ./coverage
COPY --from=build ./root/.nuget/packages/reportgenerator/5.0.4/tools/net6.0/* .

ENTRYPOINT ["dotnet", "ReportGenerator.dll"]