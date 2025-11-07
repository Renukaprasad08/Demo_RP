# Build stage
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src

COPY ["Demo_RP.csproj", "./"]
RUN dotnet restore "./Demo_RP.csproj"

COPY . .
RUN dotnet publish "./Demo_RP.csproj" -c Release -o /app/publish

# Runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS runtime
WORKDIR /app
EXPOSE 80
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "Demo_RP.dll"]