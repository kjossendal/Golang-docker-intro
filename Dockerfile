FROM golang

RUN go env

RUN ["apt-get", "update"]
RUN ["apt-get", "install", "-y", "vim-tiny"]
# exec into container and use vi to open with vim

ARG app_env
ENV APP_ENV $app_env
ENV GOBIN=/go/bin

COPY ./ /go/src/github.com/user/myProject/app
WORKDIR /go/src/github.com/user/myProject/app

RUN go get ./
RUN go get -d github.com/goestoeleven/go-programming/code_samples/001-hello-world
RUN go get -d github.com/goestoeleven/golangtraining/01_getting-started/01_helloWorld
RUN go get -d github.com/goestoeleven/golang-web-dev/000_temp/01_rand
RUN go build

CMD if [ ${APP_ENV} = production ]; \
    then \
    app; \
    else \
    go get github.com/pilu/fresh && \
    fresh; \
    fi

EXPOSE 8080