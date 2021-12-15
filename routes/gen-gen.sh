#!/bin/sh

getroutes() {
  ADD=$2
  grep '^router.get' $1 \
    | sed "s/\'/\"/g" \
    | cut -d'"' -f2 \
    | sed 's/:.*//' \
    | sort -u \
    | grep -v '^/$' \
    | grep -v '^/bitcoin.pdf$' \
    | sed 's/^\///' \
    | while read a;
   do echo $a | grep -q '/$' && echo $ADD/$a\* || { echo $ADD/${a%%/}; }
   done
}

{
getroutes baseRouter.js ""
getroutes adminRouter.js /admin
getroutes apiRouter.js /api
getroutes internalApiRouter.js /internal-api
getroutes snippetRouter.js /snippet
getroutes testRouter.js /test
} \
  | tr "\n" " " \
  | sed 's/ $//' \
  | sed 's/^/\/ /'

echo
