FROM nginx:1.21-alpine AS base

FROM base AS local

COPY ./docker/nginx/conf.d/default-local.conf /etc/nginx/conf.d/default.conf

FROM base AS prod

COPY ./docker/nginx/conf.d/default-prod.conf /etc/nginx/conf.d/default.conf
