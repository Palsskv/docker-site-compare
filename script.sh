#!/bin/bash
if [[ $# -eq 0 ]] ; then
    echo "Usage: $0 OPERATION [URL] [RecursionLevel]
Allowed operations are:
getleft
getright
compare"
    exit 0
fi

function crawl {
  mkdir -p /crawl/

  touch /crawl/preprocessing.temp
  touch /crawl/"$1"

  wget --spider --force-html -r --level=$3 $2 2>&1 \
    | grep '^--' | tee /crawl/preprocessing.temp
    
  awk '{ print $3 }' /crawl/preprocessing.temp \
    | grep -v '\.\(css\|js\)$' \
    | uniq | sort > /crawl/"$1"

  rm /crawl/preprocessing.temp

}

function compare {
	diff /crawl/left.out /crawl/right.out
}


case "$1" in

 "getleft" ) 
 crawl "left.out" $2 ${3:-2}
 ;;
 "getright" ) 
 crawl "right.out" $2 ${3:-2}
 ;;
 "compare" ) 
 compare 
 ;;
esac
