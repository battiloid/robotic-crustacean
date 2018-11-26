# robotic-crustation
A training project to automate the setup of a Netflix Style deployment in AWS using Terraform

Information on Docker Setup with Docker Hub on Windows

Docker Configuration File 'config.json'

Set the Credentials Store configuration if it isn't already setup

```json
{

  "credsStore": "wincred",
  "auths": {
    "https://index.docker.io/v1/": {}
  },

}
```

Make sure that the Docker configuration file is setup to use Windows Credentials

Make sure the following items are configured in the Windows Credential Manager

Docker (This one should be setup automatically if you setup Docker in Windows)
```
URI:		'https://index.docker.io/v1/'
Username:	'<Docker Username>'
Password:	'<Docker Hub Password>'
```
