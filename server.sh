mkdir -p /tmp/letsencrypt/public_html/.well-known/acme-challenge
cd /tmp/letsencrypt/public_html
FIRST_PART=`echo "$TOKEN" | awk -F "." '{print $1}'`
SECOND_PART=`echo "$TOKEN" | awk -F "." '{print $2}'`
printf "%s" $TOKEN > .well-known/acme-challenge/$FIRST_PART
# run only once per server:
$(command -v python2 || command -v python2.7 || command -v python2.6) -c \
"import BaseHTTPServer, SimpleHTTPServer; \
s = BaseHTTPServer.HTTPServer(('', 80), SimpleHTTPServer.SimpleHTTPRequestHandler); \
s.serve_forever()"