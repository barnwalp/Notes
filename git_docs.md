### 3 stages of Git Workflow
1. Project folder
2. staging area - a hidden area, which either have the code that is in production or the next code that will be pushed to production. After committing, staging area does not become empty.
3. Repositories - hidden subdirectory in the project directory.

### Basic Git Command
```bash
# Shows a better short version of git status
git status -s

# shows oneliner commit history
git log --oneline

# show the details of a commit (addition & deletion)
# 1st way: using commit identifier
git show <commit identifier> 
git show b31f369

# 2nd way: using Head, since head is pointing to the current commit, we
# can specify the commit by backtracking the commit using HEAD~1, which
# means that we want to go one step back
git show HEAD~2

# Showting the exact content of a file instead of the changes/differences
git show HEAD~2:filepath
git show HEAD~2:custom_css.md

# Unstaging a file
git restore --staged <filename>
git restore --staged file1.js

# Restoring a file to an earlier version (one step back)
git restore --source=HEAD~1 <filepath>
git restore --source=HEAD~1 file1.js
```

### Git Branch

```bash
# Checking the available branches of a repo
git branch

# Creating a new branch
git checkout -b <branch_name>
git checkout -b feature-readme-instuctions

# Changing to another branch
git checkout feature-readme-instructions

# Checking the difference in master and another branch
# first, checkout to the master branch, and then check using
git diff <branch_name>
git diff feature-readme-instructions

# When you commit a change in the new branch, first thing
# that needs to be done is to push the code in the repo in new branch
git push -u origin <branch_name>
git push -u origin feature-readme-instructions

# once the changes made in the new branch, is pushed to the repo
# pull request need to be made, which can be done from the github site also.
# after pull request, codes can be merged by the admin.

# deleting a branch
git branch -d <branch_name>
```