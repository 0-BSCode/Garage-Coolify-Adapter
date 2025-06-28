FROM alpine AS runner
RUN apk update && apk add envsubst
COPY --from=ghcr.io/tarampampam/curl:8.6.0 /bin/curl /bin/curl
COPY --from=khairul169/garage-webui:latest /bin/main /bin/garage
WORKDIR /app
COPY ./web/build.sh .
COPY ./garage.tmpl.toml .
RUN chmod +x ./build.sh
CMD ["./build.sh"]
