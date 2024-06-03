 Docker Build
docker build --force-rm=true --no-cache=true -t volthread/wso2:latest -f Dockerfile .
`docker build --force-rm=true --no-cache=true -t volthread/wso2:latest -f Dockerfile .`

# Docker Run
```
docker container run --name=teiwso2 --hostname=admineer-imac --add-host=admineer-imac:10.0.0.2 --net=bridge -d -p 9743:9743 volthread/wso2:latest
docker container run --name=teiwso2 --hostname=wso-container01 --add-host=wso-container01:10.0.0.2 --net=host -d -p 9743:9743 volthread/wso2:latest
docker container run --name=teiwso2 --hostname=wso-container01 --add-host=wso-container01:10.0.0.2 --net=bridge -d -p 9743:9743 volthread/wso2:latest
```


# Last

# Build 
docker build --force-rm=true --no-cache=true -t volthread/teiwso2-prod:latest -f Dockerfile .
`docker build --force-rm=true --no-cache=true -t volthread/teiwso2-prod:latest -f Dockerfile .`

# Run
docker container run --name=teiwso2-prodcon01 --hostname=teiwso2-prodcon01 --net=bridge -d -p 9743:9743 volthread/teiwso2-prod:latest
`docker container run --name=teiwso2-prodcon01 --hostname=teiwso2-prodcon01 --net=bridge -d -p 9743:9743 volthread/teiwso2-test:latest`

# Run through Voltranet Registry
`docker container run --name=teiwso2-prodcon01 --hostname=teiwso2-prodcon01 --net=bridge -d -p 9743:9743 registry.voltranet.com/tei_group/tei-wso2-prod-infra/volthread/teiwso2-prod:latest`
