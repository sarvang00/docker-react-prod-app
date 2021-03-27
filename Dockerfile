# BUILD PHASE
FROM node:lts-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build <-- the build folder to serve

# RUN PHASE
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
