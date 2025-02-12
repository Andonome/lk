---
title: "jenkins"
tags: [ "void", "build" ]
---
# Jenkins on Void

Jenkins is janky.

## Start
Start the service file.

```sh
su root
ln -s /etc/sv/jenkins /var/service
sv start jenkins
```

Then visit the web interface with `$BROWSER localhost:8080`.

If it's not working, try running the command from the run file the first time:

```sh
chpst -u jenkins java -jar /opt/jenkins/jenkins.war
```

## Updating

Jenkins will not work if out of date.
You will be prompted to update by downloading a `jenkins.war` file.
Download it, then stop the service, and move the file to `/opt/jenkins/jenkins.war`, then start the service again.

