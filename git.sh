git remote add origin https://TOKEN@github.com/USER/REPO.git  # sets access token to remote USER/REPO (don't forget first to `git remote remove origin`!).
git branch -m master main  # rename master branch to main (locally).
git push -u origin main; git push origin --delete master  # push main branch to remote and delete remote master branch (still need to change default branch on git server).
git revert HEAD~1  # make a new commit that reverts the previous one.
git describe --tag --abbrev=0 --candidates=1  # prints the most recent git tag (preferable for this branch).
git describe --tag `git rev-list --tags --max-count=1`  # prints the most recent tag reachable.
git show-branch | grep '*' | grep -v "$(git rev-parse --abbrev-ref HEAD)" | head -n1 | sed 's/.*\[\(.*\)\].*/\1/' | sed 's/[\^~].*//'  # experimental command for looking up "parent" branch of current commit.
git config --global gpg.program "$(which gpg)"  # configure git to sign commits using gpg.
git config --global commit.gpgsign true  # configure git to always sign commits.
git config --global user.signingkey LONG_KEY_ID  # configure git to sign commits with id LONG_KEY_ID.
git commit --ammend --no-edit  # update the last *local* commit, without changing its message (remember to `git add` first).
git remote set-url origin https://ghp_XXXyourGitHubPersonalAccessTokenXXX@github.com/github_username/repository.git  # change remote to use a github personal access token for authentication.
git reset --hard COMMIT_ID  # moves current branch (pointer) to COMMIT_ID, *discarding* anything the came after COMMIT_ID(!).
