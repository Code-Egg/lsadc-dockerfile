# lsadc-dockerfile

## Usage
### Building an image

```
git clone https://github.com/litespeedtech/lsws-dockerfiles.git
cd lsws-dockerfiles/template
bash build.sh -L 3.1.6
```

### Starting a Container
```
docker run --name lslb -p 7090:7090 -p 8090:8090 -it litespeedtech/litespeed-beta:3.1.6
```
You can also run with Detached mode, like so:
```
docker run -d --name lslb -p 7090:7090 -p 8090:8090 -it litespeedtech/litespeed-beta:3.1.6
```
Tip, you can get rid of `-p 7090:7090` from the command if you don’t need the web admin access.  

Note: The container will auto-apply a 15-day trial license. Please contact LiteSpeed to extend the trial, or apply your own license, [starting from $0](https://www.litespeedtech.com/pricing).
