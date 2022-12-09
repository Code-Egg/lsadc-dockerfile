# lsadc-dockerfile
[![Build Status](https://github.com/Code-Egg/lsadc-dockerfile/workflows/docker-build/badge.svg)](https://github.com/Code-Egg/lsadc-dockerfile/actions/)
[<img src="https://img.shields.io/badge/slack-LiteSpeed-blue.svg?logo=slack">](litespeedtech.com/slack) 
[<img src="https://img.shields.io/twitter/follow/litespeedtech.svg?label=Follow&style=social">](https://twitter.com/litespeedtech)


## Usage
### Building an image

```
git clone https://github.com/Code-Egg/lsadc-dockerfile.git
cd lsadc-dockerfiles/template
bash build.sh -L 3.1.6
```

### Starting a Container
```
docker run --name lslb -p 7090:7090 -p 8090:8090 -it litespeedtech/loadbalancer:3.1.6
```
You can also run with Detached mode, like so:
```
docker run -d --name lslb -p 7090:7090 -p 8090:8090 -it litespeedtech/loadbalancer:3.1.6
```
Tip, you can get rid of `-p 7090:7090` from the command if you don’t need the web admin access.  

Note: The container will auto-apply a 15-day trial license. Please contact LiteSpeed to extend the trial, or apply your own license, [starting from $0](https://www.litespeedtech.com/pricing).


## Support & Feedback
If you still have a question after using LSADC Docker, you have a few options.
* Join [the GoLiteSpeed Slack community](https://litespeedtech.com/slack/) for real-time discussion
* Post to [the LiteSpeed Forums](https://www.litespeedtech.com/support/forum/) for community support
* Reporting any issue on [Github lsws-dockerfiles](https://github.com/Code-Egg/lsadc-dockerfile/issues) project

**Pull requests are always welcome** 
