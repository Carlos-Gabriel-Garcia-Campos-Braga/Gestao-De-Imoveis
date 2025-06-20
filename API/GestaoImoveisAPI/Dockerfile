FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["API/GestaoImoveisAPI/GestaoImoveisAPI.csproj", "API/GestaoImoveisAPI/"]
RUN dotnet restore "API/GestaoImoveisAPI/GestaoImoveisAPI.csproj"
COPY . .
WORKDIR "/src/API/GestaoImoveisAPI"
RUN dotnet build "GestaoImoveisAPI.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "GestaoImoveisAPI.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "GestaoImoveisAPI.dll"]
