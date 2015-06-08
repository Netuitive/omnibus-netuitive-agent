#!/usr/bin/env python

import SimpleHTTPServer
import SocketServer
from urlparse import urlparse
import logging
import json
import os
import os.path
import sys
import socket

if len(sys.argv) > 2:
    PORT = int(sys.argv[2])
    I = sys.argv[1]
elif len(sys.argv) > 1:
    PORT = int(sys.argv[1])
    I = ""
else:
    PORT = 8000
    I = ""

hostname = socket.gethostname()
logfile = '/vagrant/{0}.log'.format(hostname)
passfile = '/vagrant/{0}.pass'.format(hostname)

if os.path.isfile(logfile):
    os.remove(logfile)

if os.path.isfile(passfile):
    os.remove(passfile)

logger = logging.getLogger()
logger.addHandler(
    logging.FileHandler(logfile))


class ServerHandler(SimpleHTTPServer.SimpleHTTPRequestHandler):

    def do_GET(self):
        logging.warning("======= GET STARTED =======")
        logging.warning(self.headers)
        SimpleHTTPServer.SimpleHTTPRequestHandler.do_GET(self)

    def do_POST(self):
        logging.warning("======= POST STARTED =======")
        logging.warning(self.headers)
        req = urlparse(self.path)
        logging.warning(req.path)
        if req.path == '/ingest/infrastructure/testapikey':
            # This URL will trigger our sample function and send what it
            # returns back to the browser
            content_len = int(self.headers.getheader('content-length', 0))
            body = self.rfile.read(content_len)
            j = json.loads(body)
            if j[0]['name'] == hostname:
                open(passfile, 'a').close()

                logging.warning(
                    '#################### TEST PASS ####################')
            else:
                if os.path.isfile(passfile):
                    os.remove(passfile)

                logging.warning(
                    '#################### TEST FAILED ####################')

            logging.warning(json.dumps(j, indent=2, sort_keys=True))
            logging.warning("\n")
            self.send_response(200)
            self.send_header('Content-type', 'text/html')
            self.end_headers()
            return

Handler = ServerHandler

httpd = SocketServer.TCPServer(("", PORT), Handler)

httpd.serve_forever()
