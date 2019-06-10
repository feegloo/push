#### Terminal

`push foo`&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`// pushes new repository to github`

`push`&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`// pushes all changes from current directory`

#### Installation

```
test -f ~/.profile && 
grep -q "# github.com/feegloo/push" ~/.profile; [ $? -ne 0 ] &&
curl -s https://raw.githubusercontent.com/feegloo/push/master/.profile >> ~/.profile &&
. ~/.profile
```
