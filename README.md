# docker-site-compare
Simple command line tool for crawling and comparing site urls

#Example usage:

docker run --net="host" -v /your/volume:/crawl docker-site-compare getleft https://v1.example.com 4

docker run --net="host" -v /your/volume:/crawl docker-site-compare getright https://v2.example.com 4

docker run --net="host" -v /your/volume:/crawl docker-site-compare compare
