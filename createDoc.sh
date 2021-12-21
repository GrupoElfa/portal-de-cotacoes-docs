#!/bin/sh

(
  rm -rf portal/doc.json &&
  cp doc.json portal/ &&
  cd portal &&
  npx insomnia-documenter --config doc.json &&
  sed -i 's/\"\/insomnia.json\"/\"insomnia.json\"/g' bundle.js &&
  rm -rf doc.json bundle.js.bak
)
