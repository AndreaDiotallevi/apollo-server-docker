FROM node:16-alpine AS builder
WORKDIR /app
COPY . .
RUN yarn install
RUN yarn clean
RUN yarn build

FROM node:16-alpine AS final
WORKDIR /app
COPY --from=builder ./app/dist ./dist
COPY package.json .
COPY yarn.lock .
RUN yarn install --production
CMD [ "yarn", "start" ]
