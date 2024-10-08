FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build

WORKDIR /app

COPY . .

RUN dotnet restore "BlazingPizza.csproj"

RUN dotnet publish -c release -o /out

FROM mcr.microsoft.com/dotnet/aspnet:6.0

WORKDIR /app

EXPOSE 80

EXPOSE 443

COPY --from=build /out .

ENTRYPOINT ["dotnet", "BlazingPizza.dll"]
