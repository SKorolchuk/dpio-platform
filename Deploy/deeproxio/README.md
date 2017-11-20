# Deeproxio

Deeproxio is a sample μService app.

## Introduction

This chart bootstraps Deeproxio as a k8s set of deployments.

## Prerequisites

- Kubernetes 1.6+
- Traefik Ingress
- Postgres database
- Prometheus
- Prometheus PushGateway

## A Quick Note on Versioning

This convention, in practice, suffered from a few problems, not the least of
which was that it defied what was permitted by
[semver 2.0.0](http://semver.org/spec/v2.0.0.html). This, in turn, lead to some
difficulty in Helm understanding the versions of this chart.

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ cd deeproxio
$ helm install --name my-release --namespace default
```

After installing the chart, create DNS records for applicable domains to direct inbound traffic to
the load balancer. You can use the commands below to find the load balancer's IP/hostname:

__NOTE:__ It may take a few minutes for this to become available.


## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```bash
$ helm delete my-release --purge
```

The command removes all the Kubernetes components associated with the chart and deletes the
release.

## Configuration

The following table lists the configurable parameters of the DeepProxio chart and their default values.

| Parameter                              | Description                                                                                                                  | Default                                           |
| -------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------- |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example:

```bash
$ helm install --name my-release \
  --set param1=value
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while
installing the chart. For example:

```bash
$ helm install --name my-release --values values.yaml
```
