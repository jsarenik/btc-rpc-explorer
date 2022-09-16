#!/bin/sh

find . -type f \
    -regex ".*\.\(css\|html\|js\|svg\|xml\|map\|ico\)$" \
    -exec brotli -f --best {} \+ \
    -exec gzip -f --best -k {} \+

#    -regex ".*\.\(css\|html\|js\|json\|svg\|xml\|map\)$" \
#-size +1400c

# Next line not needed since json was taken out of the regexp
#find txt/mining-pools-configs -type f -regex '.*\.\(gz\|br\)' -delete
