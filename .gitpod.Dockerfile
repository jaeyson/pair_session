FROM elixir:1.10.4-alpine

RUN apk --update add --no-cache curl

CMD ["/bin/sh"]