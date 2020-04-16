ubuntu-openbox-vnc
=========================
## Features
- VNC server
- SSH

## Pull from dockerhub

```
$ docker pull optsolution/ubuntu-openbox-vnc
```

## Build yourself

```
$ git clone https://github.com/OptSolution/docker-ubuntu-openbox-vnc.git
$ docker build --rm -t optsolution/ubuntu-openbox-vnc docker-ubuntu-openbox-vnc
```

## Run

### Use it headless
```
$ docker run -it optsolution/ubuntu-openbox-vnc
```
Now you can use the command line

### Use it with ssh
```
$ docker run -it -p [port]:22 optsolution/ubuntu-openbox-vnc
```
You will see the random password in terminal. You can use it to login ssh by
```
$ ssh -o 'UserKnownHostsFile=/dev/null' root@localhost -p [port]
```
If you want to set password by yourself, you can run 
```
$ docker run -it -p [port]:22 -e SSHPW=[YOUR_PW] optsolution/ubuntu-openbox-vnc
```

You need to set the port, e.g. `2222`. 

### Use it with vnc
```
$ docker run -i -t -p 5900:5900 optsolution/ubuntu-openbox-vnc
```
if you want to set resolution
```
$ docker run -i -t -p 5900:5900 -e RESOLUTION=1920x1080 optsolution/ubuntu-openbox-vnc
```

Then open vnc viewer and input `<YOUR IP>:5900`, and you can use the desktop by vnc. If you run the image on your own pc, you can only input `:5900` in vnc viewer.

### Use random port
If you don't want to set port by yourself, you can use random port with `-P` param. e.g.
```
$ docker run -it -P optsolution/ubuntu-openbox-vnc
```
Now, you need `docker port` to find out the ports
```
$ docker port [container_id] [port]
```
When [port] is `22`, you get the port for ssh. When [port] is `5900`, you get the port for vnc viewer.

## Trobleshooting
You can find logs under /var/log/ in container.

