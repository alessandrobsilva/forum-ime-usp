#!/bin/bash
rm -R .git
git init
git add .
git add public/* -f
git commit -m "commit"
git remote add origin https://github.com/alessandrobsilva/forum-ime-usp.git
git push -u origin master
heroku apps:create forum-ime-usp
heroku buildpacks:set heroku/ruby
heroku buildpacks:add --index 1 heroku/nodejs
heroku buildpacks:add -i 1 https://github.com/heroku/heroku-buildpack-activestorage-preview
git push heroku master
heroku run rake db:migrate db:seed
