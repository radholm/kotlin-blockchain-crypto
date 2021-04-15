kotlin-blockchain-crypto
====

## Description

### Appendix

- [Learn Blockchains by Building One -The fastest way to learn how Blockchains work is to build one-](https://hackernoon.com/learn-blockchains-by-building-one-117428612f46)

## Demo

```
# Create Docker Image
$ docker build -t kotlin-blockchain-crypto .

# Start Container
$ docker run -d -p 4567:4567 -p 8778:8778 kotlin-blockchain-crypto
```

```
# Get current chain info
$ curl -s http://localhost:4567/chain
```

```
# Register a new transaction
$ curl -s http://localhost:4567/transactions/new -X POST -d '{"sender":"testSender","recipient":"testRecipient","amount":1}'
```


```
# Mining
$ curl -s http://localhost:4567/mine
```

```
# Register a new node
$ curl -s http://localhost:4567/nodes/register -X POST -d '{"url":"https://radholm.com"}'
```

```
# Consensus algorithm
$ curl -s http://localhost:4567/nodes/resolve
```

## Environment

- Docker version 18.03.0-ce, build 0520e24
- Kotlin version 1.2.21-release-88 (JRE 1.8.0_73-b02)

## Contributing
Contributions are welcome! Please feel free to submit a Pull Request.
