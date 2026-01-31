FROM node:20-alpine AS build
WORKDIR /app
COPY package.json ./
RUN npm install --omit=dev
COPY src ./src

FROM node:20-alpine
WORKDIR /app
RUN addgroup -S app && adduser -S app -G app   && mkdir -p /app   && chown -R app:app /app
COPY --from=build /app /app
USER app
ENV NODE_ENV=production
EXPOSE 3000
CMD ["node", "src/server.js"]
