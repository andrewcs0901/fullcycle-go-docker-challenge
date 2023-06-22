FROM golang:1.21rc2-alpine3.18 as build
WORKDIR /
COPY . ./
RUN go mod download && go mod verify && go build -o andrewcs0901

FROM scratch
COPY --from=build ./andrewcs0901 ./
ENTRYPOINT ["./andrewcs0901"]