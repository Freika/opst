# README

Guide: [https://blog.ragnarson.com/2017/03/28/your-own-free-paas-with-dokku-and-letsencrypt.html](https://blog.ragnarson.com/2017/03/28/your-own-free-paas-with-dokku-and-letsencrypt.html)

Setting env variables in dokku: [http://dokku.viewdocs.io/dokku/configuration/environment-variables/](http://dokku.viewdocs.io/dokku/configuration/environment-variables/)

Dokku redis: [https://github.com/dokku/dokku-redis](https://github.com/dokku/dokku-redis)

Creating redis container:

`dokku redis:create sublet_app`

Attaching redis container to app container:

`dokku redis:link sublet_app sublet_app`

Restarting the app:

`dokku ps:rebuild sublet_app`

Enabling monit:

`dokku monit:enable sublet_app`

Sidekiq must starts after deployment because of contents of DOKKU_SCALE file.
If it wasn't started, use this command:

`dokku ps:scale sublet_app worker=1`
