#!/bin/bash
PORT=8000
SWAGGER_DIR=modules/swagger-ui/dist
SWAGGER_FILE=zts.yaml

cp -f "$SWAGGER_FILE" "$SWAGGER_DIR"
sed -i \
    -e "s,http://petstore.swagger.io/v2/swagger.json,http://localhost:$PORT/$SWAGGER_FILE," \
    "$SWAGGER_DIR/index.html"
cd "$SWAGGER_DIR"
python2 -m SimpleHTTPServer $PORT
