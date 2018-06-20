#!/usr/bin/env bash
#
#  S3 static webSite configuration file
#   * content copy definitions
#
declare -r SITE_DIR=~/sites/mydomain.com
declare -r SITE_BUCKET='mydomain.com'
declare -r LOG_BUCKET='logs.mydomain.com'
declare -ar FILES=(
  'index.html'
  '404.html'
  'favicon.ico'
)

declare -ar DIRS=(
  'build'
)
