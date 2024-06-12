FROM alpine:latest
# Install Helm
RUN apk add --update --no-cache curl tar gzip
RUN curl -L https://get.helm.sh/helm-v3.7.0-linux-amd64.tar.gz | tar zxvf - && mv linux-amd64/helm /usr/local/bin/helm && rm -rf linux-amd64
# Copy Helm chart và values vào image
COPY config-service /config-service
COPY config-service/values.yaml /values.yaml
# Expose Helm chart và values
VOLUME /config-service
VOLUME /values.yaml
