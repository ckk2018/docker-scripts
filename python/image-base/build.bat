@echo off
docker build -t python-deploy:3.7.10 . && ^
docker image prune -f
