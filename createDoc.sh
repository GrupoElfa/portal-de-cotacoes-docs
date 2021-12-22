#!/bin/sh

MESSAGE=$1

if [ -z  "$MESSAGE" ]
then
  echo "Wrong usage. See example below";
  echo "Usage: ./createDoc.sh \"Your commit message (inside quotes)\"";
else
  (
    rm -rf portal/doc.json &&
    cp doc.json portal/ &&
    cd portal &&
    npx insomnia-documenter --config doc.json &&
    sed -i 's/\"\/insomnia.json\"/\"insomnia.json\"/g' bundle.js &&
    rm -rf doc.json bundle.js.bak
  );
  (
    git add . && git commit -m "$MESSAGE" && git push
  );
fi
