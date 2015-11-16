# Docker full installation + Deployment of docker machine in VirtualBox


## Docker installation
Go to the root of the folder
```
sudo ./install.sh
```

The scripts in the **deploy** folder can be used


## Swarm

This need the last version of [VirtualBox](https://www.virtualbox.org/) in your host, and both docker and docker-machine running.

```
./swarm_deploy.sh
```
Then, do :
```
eval $(docker-machine env --swarm swarm-master)
```
## Remove
To remove the machines, shut down them and delete them on virtualbox, or use swarm_remove.sh.

Be sure they are deleted with :
```
docker-machine ls
```
