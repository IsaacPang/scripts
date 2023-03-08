# using awk to get the proxy lines in .zshrc
awk '/http_proxy/{gsub(/# /"")};/http_proxy/{print}' ~/.zshrc

# git to track all remote branches to local
for remote in `git branch -r | grep -v /HEAD`; do git checkout --track $remote ; done

# alternative to the above:
for i in `git branch -a | grep remote | grep -v HEAD | grep -v master`; do git branch --track ${i#remotes/origin/} $i; done

