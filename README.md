# Provisioning A Quick App On AWS EC2

## What Is The Cloud?

## What Is AWS?

## EC2

## Security Groups (SG)

### Ports

When setting up SGs, certain rules on certain ports must be made. A key example is preventing access to port 22 in particular, as this is the default port for SSH and routinely screened by bots on the internet. Though a key combination is used to access this AWS EC2 instance, thus can not easily be brute forced, it does allow people to constantly 'ping' it since it is not being prevented with a firewall such as `fail2ban` which blocks IP addressed after a certain number of attempts.

## SSH

* SSH keys can be kept wherever you keep most of your other public and private keys (hopefully secure)
	* permissions of `600` or `400` are needed though for them to work

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

* General Outline:
	* Install relevant version of nodejs
	* Update everything
	* Copy configuration for reverse proxy into `/etc/nginx/sites-available/` and link it to `/etc/nginx/sites-enabled/`
		* `default` file should be unlinked if available at this stage
	* Install `pm2` package with `npm`
	* Run the app with `pm2`
	* See the app on `public-ip`

### pics
