FROM alpine:3.12
RUN apk --no-cache add postgresql-client

RUN apk add --update netcat-openbsd
# Copy init files
COPY entrypoint.sh /entrypoint.sh
COPY ./db /db

ENTRYPOINT ["/bin/sh","/entrypoint.sh"]