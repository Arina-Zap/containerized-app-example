# containerized-app-example

## Introduction
This file aims to describe, what steps have been done during completing the task, viz. containerizing Web Application and deploying it in the Kubernetes Cluster.

## Requirements

* Java Runtime Environment 8 to 11
* maven 3.3+
* docker
* kubectl

## Steps
1. Building JAR archive:
```
mvn clean install
```

2. Containerizing the Application:
```
docker login -u [username]
docker build -t spring-boot-helloworld .
docker tag 1057b04f7cdf [username]/spring-boot-cc-app:0.0.1
docker push [username]/spring-boot-cc-app:0.0.1
```
In Docker Hub [repository](https://hub.docker.com/repository/docker/arinazap/spring-boot-cc-app/general) you can find docker image.

3. Deploying Web App in the Kubernetes Cluster:
```
kubectl create ns nginx
kubectl apply -f nginx_deploymemt.yaml
kubectl get pods -n nginx -o wide
kubectl apply -f nginx_svc.yaml
kubectl get svc -n nginx
```
After a while, the last command will show the Service's external IP: ```af7c752d7e44b4d90ac727508c8993c2-1781732280.us-east-2.elb.amazonaws.com```.

Now we can use this [URL](http://af7c752d7e44b4d90ac727508c8993c2-1781732280.us-east-2.elb.amazonaws.com/) to access the App.
