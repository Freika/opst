# README

Guide: [https://blog.ragnarson.com/2017/03/28/your-own-free-paas-with-dokku-and-letsencrypt.html](https://blog.ragnarson.com/2017/03/28/your-own-free-paas-with-dokku-and-letsencrypt.html)

Setting env variables in dokku: [http://dokku.viewdocs.io/dokku/configuration/environment-variables/](http://dokku.viewdocs.io/dokku/configuration/environment-variables/)

Dokku redis: [https://github.com/dokku/dokku-redis](https://github.com/dokku/dokku-redis)

Creating redis container:

`dokku redis:create opst_redis`

Attaching redis container to app container:

`dokku redis:link opst_redis opst`

Restarting the app:

`dokku ps:rebuild opst`

Enabling monit:

`dokku monit:enable opst`

Sidekiq must starts after deployment because of contents of DOKKU_SCALE file.
If it wasn't started, use this command:

`dokku ps:scale opst worker=1`
