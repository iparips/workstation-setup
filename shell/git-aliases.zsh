#
# Aliases from ohmyzsh git-plugin
#

[alias]
	ga = add -A
	gaa = add --all
	gapa = add --patch
	gau = add --update
	gav = add --verbose
	gap = apply
	gapt = apply --3way

  # git branch
	gb = for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(authorname) - %(contents:subject) - (%(color:green)%(committerdate:relative)%(color:reset))'
	gbr = branch -r --sort=committerdate --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(authorname) - %(contents:subject) - (%(color:green)%(committerdate:relative)%(color:reset))'
	gba = branch --all
	gbd = branch --delete	
	gbD = branch --delete --force
  	gbnm = branch --no-merged
  	ggsup = branch --set-upstream-to = origin/$(git_current_branch)
  	gpsup = push --set-upstream origin $(git_current_branch)
  	gpsupf = push --set-upstream origin $(git_current_branch) --force-with-lease
	
  # commit
	gc = commit --verbose
	gca = commit --verbose --amend
	gcm = commit --message

  # checkout
	gco = checkout
  	gcb = checkout -b
	
  # cherry pick
 	gcp = cherry-pick
	gcpa = cherry-pick --abort
	gcpc = cherry-pick --continue
	
  # diff
	gd = diff
	gdca = diff --cached
	gdcw = diff --cached --word-diff
	gdct = describe --tags $(git rev-list --tags --max-count = 1)
	gds = diff --staged
	gdt = diff-tree --no-commit-id --name-only -r
	gdup = git diff @{upstream}
	gdw = diff --word-diff

  # fetch
	gf = fetch
	gfo = fetch origin
	gfg = ls-files | grep

  # push
  	gp = push
  	gpd = push --dry-run
  	gpf = push --force-with-lease --force-if-includes
  	ggpush = push origin "$(git_current_branch)"
  	gpoat = push origin --all && git push origin --tags
  	gpod = push origin --delete
  	gpu = push upstream
  	gpv = push --verbose
  
  # pull
  	gpl = pull
  	gpr = pull --rebase
  	gupv = pull --rebase --verbose
  	gupa = pull --rebase --autostash
  	gupav = pull --rebase --autostash --verbose
  	gupom = pull --rebase origin $(git_main_branch)
  	ggpull = pull origin "$(git_current_branch)"
  	gupomi = pull --rebase = interactive origin $(git_main_branch)
  	glum = pull upstream $(git_main_branch)
  	gluc = pull upstream $(git_current_branch)

  # log
  	gp = log --pretty='format:%m %C(yellow)%h %C(red)%ad %C(blue)%an%C(green)%d %C(reset)%s' --date=default
	glg = log --graph --pretty='format:%m %C(yellow)%h %C(red)%ad %C(blue)%an%C(green)%d %C(reset)%s' --date=default
	glgp = log --stat --patch
	glgg = log --graph
	glgga = log --graph --decorate --all
	glgm = log --graph --max-count = 10
	glo = log --oneline --decorate
	glol = "log --graph --pretty = %Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset"
	glols = "log --graph --pretty = %Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset --stat"
	glod = "log --graph --pretty = %Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset"
	glods = "log --graph --pretty = %Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset --date = short"
	glola = "log --graph --pretty = %Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset --all"
	glog = log --oneline --decorate --graph
	gloga = log --oneline --decorate --graph --all
	glp = "_git_log_prettily"
  	gcount = shortlog --summary --numbered

  # merge
	gm = merge
	gmom = merge origin/$(git_main_branch)
	gmtl = mergetool --no-prompt
	gmtlvim = mergetool --no-prompt --tool = vimdiff
	gmum = merge upstream/$(git_main_branch)
	gma = merge --abort
	gms = "merge --squash"

  # rebase
	grb = rebase
	grba = rebase --abort
	grbc = rebase --continue
	grbd = rebase $(git_develop_branch)
	grbi = rebase --interactive
	grbm = rebase $(git_main_branch)
	grbom = rebase origin/$(git_main_branch)
	grbo = rebase --onto
	grbs = rebase --skip
	grev = revert
	
  # reset
  	grh = reset HEAD
	grhh = reset HEAD --hard
	groh = reset origin/$(git_current_branch) --hard
	gru = reset --
  	grs = restore
  	grss = restore --source
  	grst = restore --staged

  # status
	g = status
	gsb = status --short --branch
	gsh = show
	gsps = show --pretty = short --show-signature
	gss = status --short
	gst = status
  	gwch = whatchanged -p --abbrev-commit --pretty = medium

  # stash
	gstaa = stash apply
	gstc = stash clear
	gstd = stash drop
	gstl = stash list
	gstp = stash pop
	gsts = stash show --text
	gstu = gsta --include-untracked
	gstall = stash --all
  
  # remote
  	grmv = remote rename
	grrm = remote remove	
	grset = remote set-url
	grt = cd "$(git rev-parse --show-toplevel || echo .)"
	grup = remote update
	grv = remote --verbose
  	gr = remote
  	gra = remote add

# == rarely used aliases ==

  # switch
	gsw = switch
	gswc = switch --create
	gswm = switch $(git_main_branch)
	gswd = switch $(git_develop_branch)

  # tag
	gts = tag --sign
	gtv = tag | sort -V
	gtl = gtl(){ git tag --sort = -v:refname -n --list "${1}*" }; noglob gtl

  # work tree
	gwt = worktree
	gwta = worktree add
	gwtls = worktree list
	gwtmv = worktree move
	gwtrm = worktree remove

  # am
	gam = am
	gamc = am --continue
	gams = am --skip
	gama = am --abort
	gamscp = am --show-current-patch

  # git blame & bisect
  	gbl = blame -b -w
  	gbs = bisect
	gbsb = bisect bad
	gbsg = bisect good
	gbsr = bisect reset
	gbss = bisect start

  # ignored
	gignore = update-index --assume-unchanged
	gignored = ls-files -v | grep "^[[:lower:]]"
	git-svn-dcommit-push = svn dcommit && git push github $(git_main_branch):svntrunk

  # other
  	gcl = clone --recurse-submodules
  	gcf = config --list
  	gclean = clean --interactive -d
  	gpristine = reset --hard && git clean --force -dfx
  	ghh = help
  	gsu = submodule update
  	gunignore = update-index --no-assume-unchanged
  	gg = gui citool
  	gga = gui citool --amend
  	grm = rm
  	grmc = rm --cached
