FROM node AS builder
WORKDIR /app
COPY ./zelda-cookbook-frontend/package.json .
RUN npm install
COPY ./zelda-cookbook-frontend .
RUN npm run-script build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html