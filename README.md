```
# Usage:
#
# mkdir foo
# cd foo
# push
push () {
  #git config --global user.name
  curl -s -o /dev/null -u feegloo https://api.github.com/user/repos -d "{\"name\": \"$(basename "$PWD")\"}"
  touch README.md
  git init &> /dev/null
  git add README.md &> /dev/null
  git commit -m "push" &> /dev/null
  git remote add origin https://github.com/feegloo/$(basename "$PWD").git &> /dev/null
  git push -u origin master &> /dev/null
  /usr/bin/open -a "/Applications/Google Chrome.app" https://github.com/feegloo/$(basename "$PWD")
}

pull() {
  git pull --rebase
}

# TODO
# git config --global credential.helper osxkeychain
# https://help.github.com/en/articles/caching-your-github-password-in-git
```
