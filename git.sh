git tag --delete foo  # removes tag foo.
git config core.sshCommand 'ssh -i KEYFILE -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'  # set KEY from ssh keypair login to git repo.
git checkout COMMIT_HASH PATH/TO/MESSEDUP/FILE  # checkout older version of just one specific file.
git branch -a | cut -c3- | cut -d' ' -f 1 | xargs git grep "STRING"  # search for the string STRING in all local and remote branches.
git show-branch | grep '*' | grep -v "$(git rev-parse --abbrev-ref HEAD)" | head -n1 | sed 's/.*\[\(.*\)\].*/\1/' | sed 's/[\^~].*//'  # experimental command for looking up "parent" branch of current commit.
git branch -d BRANCHNAME  # delete a local branch.
git push origin -d BRANCHNAME  # delete a remote branch.
git pull origin master  # fetch remote branch origin/master and merge it into HEAD.?
git describe --tag --abbrev=0 --candidates=1  # prints the most recent git tag (preferable for this branch).
git describe --tag `git rev-list --tags --max-count=1`  # prints the most recent tag reachable.
git revert HEAD~1  # make a new commit that reverts the previous one
git remote add origin https://TOKEN@github.com/USER/REPO.git  # sets access token to remote USER/REPO (don't forget first to `git remote remove origin`!)
git branch -m master main  # rename master branch to main (locally)
git push -u origin main; git push origin --delete master  # push main branch to remote and delete remote master branch (still need to change default branch on git server).
