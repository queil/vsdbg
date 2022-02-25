#!/bin/sh
dotnet restore $APP_DIR
dotnet watch run --project $APP_DIR --no-restore
