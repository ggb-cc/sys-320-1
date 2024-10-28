#!bin/bash

for i in {1..20}
do
	curl 10.0.17.42/index.html
	curl 10.0.17.42/page1.html
	curl 10.0.17.42/page2.html
done
