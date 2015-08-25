FROM golang

WORKDIR /app

# copy binary into image
COPY myapp /app/

ENTRYPOINT ["./myapp"]
