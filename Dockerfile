FROM node:alpine as builder
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
#CMD ["npm" "run" "build"]
RUN npm run build

##### NGINX stuff from here
### /app/build - all build pieces go here

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
