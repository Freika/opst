# README

[![Maintainability](https://api.codeclimate.com/v1/badges/f9a98ff2b59a4f24b5ff/maintainability)](https://codeclimate.com/github/Freika/opst/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/f9a98ff2b59a4f24b5ff/test_coverage)](https://codeclimate.com/github/Freika/opst/test_coverage)

This is an Overwatch Performance Tracker, web application inspired by [Basilisk's Google Docs sheet](https://docs.google.com/spreadsheets/d/1x8klqrgx_QXBLsbaNa-Ca0VC-BESogggQJc58tLE4_w/edit#gid=1558584019).

Live version is available at [opst.space](http://opst.space).

# Contributing

[CONTRIBUTING.md](CONTRIBUTING.md)

## Contribution ideas

 - Update seeds to generate reasonable amount of matches (500-1000)
 - Refactorings
 - Improve test coverage (which is zero now :)
 - Rethink/improve user interface
 - Improve performance (page loading speed)
 - Implement overall statistics based on all matches results
 - Suggest?

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
