FROM node:19-bullseye-slim AS compile-frontend

COPY . /src/TimerTodo
WORKDIR /src/TimerTodo

RUN npm install
RUN npm run build

EXPOSE 3000
#ENTRYPOINT ["/usr/bin/entrypoint"]
CMD ["node", "/src/TimerTodo/buildexport/index.js"]
