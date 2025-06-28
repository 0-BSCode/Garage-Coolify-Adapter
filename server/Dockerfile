FROM alpine AS runner
RUN apk update && apk add envsubst
COPY --from=ghcr.io/tarampampam/curl:8.6.0 /bin/curl /bin/curl
COPY --from=dxflrs/garage:v2.0.0 / /
WORKDIR /app
COPY ./server/build.sh .
COPY ./garage.tmpl.toml .
RUN chmod +x ./build.sh

# Taken from https://git.deuxfleurs.fr/Deuxfleurs/garage/src/branch/main-v1/Dockerfile
ENV RUST_BACKTRACE=1
ENV RUST_LOG=garage=info
CMD ["./build.sh"]