#!/bin/bash
# project/bin/deploy.sh
# Build everything and deploy this app to Heroku
# Taken from: http://rhodesmill.org/brandon/2012/quietly-pushing-to-heroku/

set -e

# Change to the project root directory
cd "$(dirname ${BASH_SOURCE[0]})"
cd ..


# Temporarily add the generated files to version control
# (-f says "even though this file is in .gitignore")
git add -f build/app.css
git add -f build/index.js

# Push them to Heroku, then repent of the commit
git commit . -m 'Temporary Heroku-only deployment commit'
git push production master --force
git reset --soft HEAD~1

# Un-stage the generated files to finish
git reset HEAD build