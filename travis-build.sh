#!/bin/bash
MYGET_ENV=""
case "$TRAVIS_BRANCH" in
  "develop")
    MYGET_ENV="-dev"
    ;;
esac

PROJECTS=(Collectively.Services.Medium Collectively.Services.Medium.Tests)
for PROJECT in ${PROJECTS[*]}
do
  dotnet restore $PROJECT --source "https://api.nuget.org/v3/index.json" --source "https://www.myget.org/F/collectively$MYGET_ENV/api/v3/index.json" --no-cache
  dotnet build $PROJECT
done