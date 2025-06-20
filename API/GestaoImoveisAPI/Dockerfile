# Etapa base com runtime do ASP.NET
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80

# Etapa de build com SDK do .NET
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src

# Copia apenas o .csproj e faz o restore
COPY ["API/GestaoImoveisAPI/GestaoImoveisAPI.csproj", "API/GestaoImoveisAPI/"]
COPY ["SharedClassess/SharedClasses/SharedClasses.csproj", "SharedClassess/SharedClasses/"]
RUN dotnet restore "API/GestaoImoveisAPI/GestaoImoveisAPI.csproj"

# Copia o restante dos arquivos
COPY . .

# Compila o projeto
WORKDIR "/src/API/GestaoImoveisAPI"
RUN dotnet build "GestaoImoveisAPI.csproj" -c Release -o /app/build

# Publica
FROM build AS publish
RUN dotnet publish "GestaoImoveisAPI.csproj" -c Release -o /app/publish

# Final
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "GestaoImoveisAPI.dll"]
