#!/bin/sh
set -e

cd ./lambda-dotnet && sh build.sh
cd ..

cd ./lambda-go && sh build.sh
cd ..

cd ./lambda-java && sh build.sh
cd ..

sam build --use-container NodeJsFunction --build-dir lambda-nodejs/output/x86
sam build --use-container NodeJsArmFunction --build-dir lambda-nodejs/output/arm

sam build --use-container PythonFunction --build-dir lambda-python/output/x86
sam build --use-container PythonArmFunction --build-dir lambda-python/output/arm

sam build --use-container RubyFunction --build-dir lambda-ruby/output/x86
sam build --use-container RubyArmFunction --build-dir lambda-ruby/output/arm
