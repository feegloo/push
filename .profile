# github.com/feegloo/push
push () {
  _push() {
    if [ -n "$(git status --porcelain)" ]; then
      git add .
      git commit -m "push" &> /dev/null
      git push --set-upstream origin master &> /dev/null
    fi
  }

  if [ -d ".git" ]; then
    _push
  else
    dir=${PWD##*/}
    read -p "GitHub username: " username
    response_code=`curl -s -o /dev/null -u $username https://api.github.com/user/repos -d "{\"name\": \"$dir\"}" -w "%{http_code}"`
    if (( $response_code == 201 )); then
      git init &> /dev/null
      git remote add origin https://github.com/$username/$dir.git
      git fetch &> /dev/null
      _push
      /usr/bin/open -a "/Applications/Google Chrome.app" https://github.com/$username/$dir &> /dev/null
    fi
  fi
}
