This is an example for how to build a teeny, tiny Docker image for your golang programs.

This example is an web server that prints Hello World and ends up in a **4.7MB** Docker image.

## 0. Clone this repo anywhere

Does not need to be in your GOPATH. You don't even need Go.

## 1. Get dependencies

We only have one dependency, so let's get it and vendor it:

```sh
docker run --rm -v $PWD:/app -w /app treeder/go vendor
```

## 2. Build it

We want this to be static because we're running it inside a container with nothing in it, so this command is a bit long, but
just copy and paste it into your console.

```
docker run --rm -v $PWD:/app -w /app treeder/go build -o myapp
```

## 3. Run it

```
docker run --rm -v $PWD:/app -w /app -p 8080:8080 golang ./myapp
```

## 4. Build Docker image with program in it

The Dockerfile in this repo will take care of this, it's really simple (take a look).

```
docker build -t treeder/myapp:latest .
```

## 5. Test the image

Now that we built the image, let's run it.

```
docker run --rm -it -p 8080:8080 treeder/myapp
```

Surf to: http://localhost:8080/

Boom.

## Further Reading

If you want to cross compile a Go program to a bunch of different platforms, see this: https://medium.com/iron-io-blog/how-to-cross-compile-go-programs-using-docker-beaa102a316d.
