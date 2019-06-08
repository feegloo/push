##### TODO : API

`push foo  // creates directory foo (if doesnt exists) and pushes new repository`

`push // if current directory is git repository, pushes all changes`


```
# Usage:
#
# mkdir foo
# cd foo
# push
push () {
  #git config --global user.name
  response_code=`curl -s -o /dev/null -u feegloo https://api.github.com/user/repos -d "{\"name\": \"$(basename "$PWD")\"}" -w "%{http_code}"`
  touch README.md
  git init &> /dev/null
  git add README.md &> /dev/null
  git commit -m "push" &> /dev/null
  git remote add origin https://github.com/feegloo/$(basename "$PWD").git &> /dev/null
  git push -u origin master &> /dev/null

  if (( $response_code == 201 )); then
    /usr/bin/open -a "/Applications/Google Chrome.app" https://github.com/feegloo/$(basename "$PWD")
  fi


pull() {
  git pull --rebase
}

# TODO
# git config --global credential.helper osxkeychain
# https://help.github.com/en/articles/caching-your-github-password-in-git
```
