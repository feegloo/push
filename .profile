# github.com/feegloo/push
push () {
  _push() {
    if [ -n "$(git ls-files --other --directory --exclude-standard)" ]; then
      git add .
      git commit -m "push" &> /dev/null
      git push --set-upstream origin master &> /dev/null
    fi
  }

  dir=${1%/}
  if [ -n "$dir" ]; then
    response_code=`curl -s -o /dev/null -u feegloo https://api.github.com/user/repos -d "{\"name\": \"$dir\"}" -w "%{http_code}"`
    if (( $response_code == 201 )); then
      mkdir $dir &> /dev/null
      cd $dir && git init &> /dev/null && git remote add origin https://github.com/feegloo/$dir.git && git fetch &> /dev/null
      _push
      /usr/bin/open -a "/Applications/Google Chrome.app" https://github.com/feegloo/$dir &> /dev/null
    fi
  else
    _push
  fi
}
