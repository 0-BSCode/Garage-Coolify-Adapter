FROM khairul169/garage-webui:latest AS build
FROM alpine AS runner
RUN apk update && apk add envsubst
COPY --from=build /bin/main /bin/garage
WORKDIR /app
COPY ./web/build.sh .
COPY ./garage.tmpl.toml .
RUN chmod +x ./build.sh
CMD ["./build.sh"]
