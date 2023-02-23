docker run --detach \
  --hostname gitlab.admin.com \
  --memory=1024m \
  --publish 1443:443 --publish 81:80 --publish 1022:22 \
  --name gitlab \
  --restart always \
  --volume /Users/tomniu/Study/tmp/gitlab/config:/etc/gitlab \
  --volume /Users/tomniu/Study/tmp/gitlab/logs:/var/log/gitlab \
  --volume /Users/tomniu/Study/tmp/gitlab/data:/var/opt/gitlab \
  gitlab/gitlab-ce:latest
