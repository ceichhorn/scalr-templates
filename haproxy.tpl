{
            "alias": "SITENAME-lb",
            "role": {
                "id": 79184
            },
            "cloudPlatform": "gce",
            "cloudLocation": "us-west1",
            "availabilityZones": [
                "us-west1-a"
            ],
            "instanceType": {
                "id": "g1-small"
            },
            "scaling": {
                "enabled": true,
                "minInstances": 1,
                "maxInstances": 2,
                "scalingBehavior": "launch-terminate",
                "considerSuspendedServers": "running",
                "rules": []
            },
            "networking": {
                "networks": [
                    {
                        "id": "gannett-paas-xpn\/global\/networks\/gannett-west-xpn-network"
                    }
                ],
                "subnets": [
                    {
                        "id": "gannett-paas-staging-us-west1"
                    }
                ]
            },
            "bootstrapping": {
                "enabled": true,
                "type": "ChefServerBootstrapConfiguration",
                "server": {
                    "id": 2
                },
                "environment": "staging",
                "logLevel": "auto",
                "sslVerificationMode": "auto",
                "scope": "role",
                "daemonize": false,
                "runList": "[\"recipe[gci-haproxy]\"]"
            },
            "cloudFeatures": {
                "type": "GceCloudFeatures",
                "networkTags": [
                    "scalr",
                    "gannett-internal-https",
                    "gannett-internal-haproxy-status"
                ]
            },
            "variables": [
                {
                    "name": "HAPROXY_CONFIGURATION",
                    "value": "{\n   \"name\": \"SITENAME-lb\",\n   \"docker\": true,\n   \"listen\": {\n     \"bind\": \"*\",\n     \"port\": 80\n   },\n   \"upstream\": [{\n     \"alias\": \"kubernetes-worker\",\n     \"port\": 80,\n     \"healthcheck_uri\": \"\/version-info.html\"\n   }]\n}"
                }
            ],
            "orchestration": {
                "rules": []
            },
            "storage": []
        },
