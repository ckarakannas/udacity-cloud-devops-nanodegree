[![ckarakannas](https://circleci.com/gh/ckarakannas/udacity-cloud-devops-capstone.svg?style=svg)](https://circleci.com/gh/ckarakannas/udacity-cloud-devops-capstone)

# Capstone project submission

This folder includes all the submission files required for the final Capstone Project for the AWS Cloud DevOps Engineer Nanodegree by Udacity.

- screenshots/ -> Screenshots for all the steps required

## Project code

The code for this project submission can be found in my GitHub [repo](https://github.com/ckarakannas/udacity-cloud-devops-capstone).

The code has been imported from one of my older Github projects where I developed a sample Currency Exchange API using Flask.

This has been extended for the purpose of this Nanodegree to incorporate deployment into a production-like AWS EKS cluster, as well as adding a CircleCi CI/CD pipeline.

### Load Balancer URL

The Currency Exchange API is deployed into 2 separate nodes, situated into private subnets within AWS.

The K8S deployment defines a replicaset with 2 pods for the app, each pod running into each one of the nodes. The API can be accessed externally (subject to availability) via an internet facing Load Balancer that has been provisioned via a K8S AWS Load Balancer Controller.

The Load Balancer URL is:

http://k8s-udacity-c753b4f696-612246760.eu-west-2.elb.amazonaws.com/