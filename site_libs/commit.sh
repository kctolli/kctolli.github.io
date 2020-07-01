#!/bin/sh
cd D:/Portfolio
git add --all
timestamp() {
  date +"at %H:%M on %d/%m/%Y"
}
git commit -am "auto-commit : Update $(timestamp)"
git pull
git push origin master