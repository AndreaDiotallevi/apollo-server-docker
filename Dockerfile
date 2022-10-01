FROM node:16-alpine AS builder
WORKDIR /app
COPY . .
RUN yarn install
RUN yarn build

FROM node:16-alpine AS final
WORKDIR /app
COPY --from=builder ./app/dist ./dist
COPY package.json .
COPY yarn.lock .
RUN yarn install --production
CMD [ "yarn", "start" ]

# Dockerfile one-stage

# FROM node:16-alpine
# WORKDIR /app
# COPY . .
# RUN yarn install
# RUN yarn build
# RUN rm -rf ./node_modules/*
# RUN yarn install --production
# CMD [ "yarn", "start" ]
