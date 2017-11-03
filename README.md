# README

This is an Overwatch Performance Tracker, web application inspired by [Basikisk's Google Docs sheet](https://docs.google.com/spreadsheets/d/1x8klqrgx_QXBLsbaNa-Ca0VC-BESogggQJc58tLE4_w/edit#gid=1558584019).

Live version is available at [opst.space](http://opst.space).

# Contributing

[CONTRIBUTING.md](CONTRIBUTING.md)

A little disclaimer: I know the code is pretty terrible. I open sourcing it so anybody could make your contribution and make it a little bit better :)

## Dokku Deployment

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
