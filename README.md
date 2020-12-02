# Provisioning A Quick App On AWS EC2

## What Is The Cloud?

## What Is AWS?

## EC2

## Security Groups (SG)

### Ports

* Why is 22 not open to all IPs?

## SSH

## Sending Files

* Tend to be sent with the `rsync` command
* Basic syntax:
```
rsync [options] [location] [destination]
```
* If using a new private key, one has to specify it with the `-e` option .e.g.
```
rsync -e "ssh -i ~/key_location" [location] [destination]
```
* Multiple files can be sent with either wild cards or just specifying a directory .e.g.
```
rsync -avz ~/test/* ubuntu@<ip>:/directory/
```

## Getting App Running

### pics
