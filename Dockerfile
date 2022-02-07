FROM node:14.19.0-alpine3.14
WORKDIR /reactjs
COPY package*.json ./
RUN npm install
COPY . .
RUN addgroup app && adduser -S -G app app
RUN mkdir node_modules/.cache
RUN chown app:app node_modules/.cache
USER app
ENV API_URL=http://api.myapp.com/
EXPOSE 3000
CMD [ "npm","start" ]