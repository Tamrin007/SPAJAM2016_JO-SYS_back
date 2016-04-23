# SPAJAM2016_JO-SYS_back

## Install

```sh
$ bundle install --path vendor/bundle --without production
$ gem install foreman
$ foreman start
```

## DB migration in local

```sh
$ bundle exec rake db:migrate
```
