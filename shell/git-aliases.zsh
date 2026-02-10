#
# Git abbreviations using zsh-abbr
# Based on ohmyzsh git-plugin
#

# Note: the following abbreviastions can't be used:
# │  1 gpr - blocked by GNU pr command from coreutils (/opt/homebrew/bin/gpr)                                            │
# │  2 gcp - blocked by GNU cp command from coreutils (/opt/homebrew/bin/gcp)                                            │
# │  3 grm - blocked by GNU rm command from coreutils (/opt/homebrew/bin/grm)

# add
abbr ga="git add -A"

# branch
abbr gb="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(authorname) - %(contents:subject) - (%(color:green)%(committerdate:relative)%(color:reset))'"
abbr gbr="git branch -r --sort=committerdate --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(authorname) - %(contents:subject) - (%(color:green)%(committerdate:relative)%(color:reset))'"
abbr gbd="git branch --delete"
abbr ggsup="git branch --set-upstream-to=origin/\$(git_current_branch)"
abbr gpsup="git push --set-upstream origin \$(git_current_branch)"
abbr gpsupf="git push --set-upstream origin \$(git_current_branch) --force-with-lease"

# commit
abbr gc="git commit --verbose"
abbr gca="git commit --verbose --amend"
abbr gcm="git commit --message"

# checkout
abbr gco="git checkout"
abbr gcb="git checkout -b"

# cherry-pick
abbr gchp="git cherry-pick"
abbr gcpa="git cherry-pick --abort"
abbr gcpc="git cherry-pick --continue"

# diff
abbr gd="git diff"
abbr gdca="git diff --cached"
abbr gdcw="git diff --cached --word-diff"
abbr gdct="git describe --tags \$(git rev-list --tags --max-count=1)"
abbr gds="git diff --staged"
abbr gdt="git diff-tree --no-commit-id --name-only -r"
abbr gdup="git diff @{upstream}"
abbr gdw="git diff --word-diff"

# fetch
abbr gf="git fetch"
abbr gfo="git fetch origin"
abbr gfg="git ls-files | grep"

# push
abbr gp="git push"
abbr gpd="git push --dry-run"
abbr gpf="git push --force-with-lease --force-if-includes"
abbr ggpush="git push origin \"\$(git_current_branch)\""
abbr gpoat="git push origin --all && git push origin --tags"
abbr gpod="git push origin --delete"
abbr gpu="git push upstream"
abbr gpv="git push --verbose"

# pull
abbr gpl="git pull --rebase"
abbr gupv="git pull --rebase --verbose"
abbr gupa="git pull --rebase --autostash"
abbr gupav="git pull --rebase --autostash --verbose"
abbr gupom="git pull --rebase origin \$(git_main_branch)"
abbr ggpull="git pull origin \"\$(git_current_branch)\""
abbr gupomi="git pull --rebase=interactive origin \$(git_main_branch)"
abbr glum="git pull upstream \$(git_main_branch)"
abbr gluc="git pull upstream \$(git_current_branch)"

# log
abbr glg="git log --graph --pretty='format:%m %C(yellow)%h %C(red)%ad %C(blue)%an%C(green)%d %C(reset)%s' --date=default"
abbr glgp="git log --stat --patch"
abbr glgg="git log --graph"
abbr glgga="git log --graph --decorate --all"
abbr glgm="git log --graph --max-count=10"
abbr glo="git log --oneline --decorate"
abbr glol="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'"
abbr glols="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --stat"
abbr glod="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'"
abbr glods="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short"
abbr glola="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --all"
abbr glog="git log --oneline --decorate --graph"
abbr gloga="git log --oneline --decorate --graph --all"
abbr gcount="git shortlog --summary --numbered"

# merge
abbr gm="git merge"
abbr gmom="git merge origin/\$(git_main_branch)"
abbr gmtl="git mergetool --no-prompt"
abbr gmtlvim="git mergetool --no-prompt --tool=vimdiff"
abbr gmum="git merge upstream/\$(git_main_branch)"
abbr gma="git merge --abort"
abbr gms="git merge --squash"

# rebase
abbr grb="git rebase"
abbr grba="git rebase --abort"
abbr grbc="git rebase --continue"
abbr grbd="git rebase \$(git_develop_branch)"
abbr grbi="git rebase --interactive"
abbr grbm="git rebase \$(git_main_branch)"
abbr grbom="git rebase origin/\$(git_main_branch)"
abbr grbo="git rebase --onto"
abbr grbs="git rebase --skip"
abbr grev="git revert"

# reset
abbr grh="git reset HEAD"
abbr grhh="git reset HEAD --hard"
abbr groh="git reset origin/\$(git_current_branch) --hard"
abbr gru="git reset --"
abbr grs="git restore"
abbr grss="git restore --source"
abbr grst="git restore --staged"

# status
abbr g="git status"
abbr gsb="git status --short --branch"
abbr gsh="git show"
abbr gsps="git show --pretty=short --show-signature"
abbr gss="git status --short"
abbr gst="git status"
abbr gwch="git whatchanged -p --abbrev-commit --pretty=medium"

# stash
abbr gstaa="git stash apply"
abbr gstc="git stash clear"
abbr gstd="git stash drop"
abbr gstl="git stash list"
abbr gstp="git stash pop"
abbr gsts="git stash show --text"
abbr gstall="git stash --all"

# remote
abbr grmv="git remote rename"
abbr grrm="git remote remove"
abbr grset="git remote set-url"
abbr grup="git remote update"
abbr grv="git remote --verbose"
abbr gr="git remote"
abbr gra="git remote add"

# switch
abbr gsw='f() { git fetch origin "$@" && git switch "$@"; }; f'
abbr gswc="git switch --create"
abbr gswm="git switch \$(git_main_branch)"
abbr gswd="git switch \$(git_develop_branch)"

# tag
abbr gts="git tag --sign"
abbr gtv="git tag | sort -V"

# worktree
abbr gwt="git worktree"
abbr gwta="git worktree add"
abbr gwtls="git worktree list"
abbr gwtmv="git worktree move"
abbr gwtrm="git worktree remove"

# am
abbr gam="git am"
abbr gamc="git am --continue"
abbr gams="git am --skip"
abbr gama="git am --abort"
abbr gamscp="git am --show-current-patch"

# blame & bisect
abbr gbl="git blame -b -w"
abbr gbs="git bisect"
abbr gbsb="git bisect bad"
abbr gbsg="git bisect good"
abbr gbsr="git bisect reset"
abbr gbss="git bisect start"

# other
abbr gcl="git clone --recurse-submodules"
abbr gcf="git config --list"
abbr gclean="git clean -df"
abbr gpristine="git reset --hard && git clean --force -dfx"
abbr ghh="git help"
abbr gsu="git submodule update"
abbr gignore="git update-index --assume-unchanged"
abbr gunignore="git update-index --no-assume-unchanged"
abbr gignored="git ls-files -v | grep '^[[:lower:]]'"
abbr grem="git rm"
abbr gremc="git rm --cached"
