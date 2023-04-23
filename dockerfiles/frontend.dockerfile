FROM node:gallium-slim
WORKDIR /react
COPY ./frontend/ .
RUN npm run build