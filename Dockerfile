FROM node:10.14.0-alpine as step1
WORKDIR /src
COPY . /src
RUN npm install 
RUN npm run build

FROM nginx:1.15.7
WORKDIR /usr/share/nginx/html
COPY --from=step1  /src/dist .

#docker image build -t web:1.0 .
#docker container run -d -p 8000:80 web:1.0