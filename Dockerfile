# BUILD PHASE
FROM node:lts-alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build <-- the build folder to serve

# RUN PHASE
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
