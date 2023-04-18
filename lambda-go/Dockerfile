FROM golang:1.20

WORKDIR /app

COPY . .

RUN apt update
RUN apt install --yes zip

RUN GOARCH=amd64 GOOS=linux go build -o x86/lambda-go
RUN GOARCH=arm64 GOOS=linux go build -o arm/lambda-go

RUN chmod +x bootstrap
RUN chmod +x x86/lambda-go
RUN chmod +x arm/lambda-go

RUN zip -j lambda-go.zip bootstrap x86/lambda-go
RUN zip -j lambda-go-arm.zip bootstrap arm/lambda-go
