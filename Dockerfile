FROM node:16-alpine as builder 

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .


RUN npm run build 


FROM  nginx 

COPY  --from=builder /app/build /usr/share/nginx/html

# that will cares only about the /app/build from the previuos step and anythig else will be dumped
# this image will only contains he nginx image as base any other thing will be dumped 