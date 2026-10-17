# Git Module Notes

## 2. What Is Version Control?
- A system that tracks changes to your code over time.
- It lets you **undo mistakes**, **see who changed what**, and **collaborate** without overwriting each other.
- In DevOps it covers more than app code: Terraform, Kubernetes manifests, Dockerfiles, Ansible roles and CI/CD configs.
- Git gives you a safe space to experiment, review and recover, like a **time machine for code and infrastructure**.
- Pipelines, deployments and infra usually start from a Git repo.

## 3. Centralised vs Distributed
| | Centralised (SVN, CVS) | Distributed (Git) |
|---|---|---|
| Where the repo lives | One central server | Every developer has a full copy, including all history |
| Server down? | Can't commit or update | Keep working offline |
| Collaboration | File locking, merge conflict wars | Branch freely, merge later |

- **Analogy:** SVN is one Google Doc everyone edits. Git is everyone having their own copy with full history, merged when ready.
- Git was created in 2005 after the Linux kernel team lost access to BitKeeper.
- Every commit is a snapshot, a save point you can rewind to.

## 4. Evolution of Git
- Created in **2005 by Linus Torvalds** (also creator of Linux) for kernel developers.
- Design goals: **fast, distributed, handles chaos**.
- Branching and merging are very fast, which suits feature branches, bug fixes and infra changes.
- It is now the default tool across open source, microservices, Terraform, K8s and more.

## 5. Git's Architecture (Not Just a File Tracker)
- Git stores **snapshots, not diffs**. Each commit is a picture of the whole project at that moment.
- Under the hood it's a **key-value store**: keys are **SHA-1 hashes**, values are content.
- Three object types:
  - **Blob**: file contents
  - **Tree**: directories and structure
  - **Commit**: a pointer to a snapshot, plus metadata
- Git is **content-addressed**, not filename-based. If content changes, the hash changes. If the content is the same, the same object is reused.
- That's why it's fast and efficient with lots of config files (Terraform, manifests, Helm charts).
- **One-liner:** a smart, compressed, hash-based snapshot engine.

## 6. Terminology
| Term | Meaning |
|---|---|
| **Repository (repo)** | A folder tracked by Git. It has a `.git` directory inside. |
| **Commit** | Snapshot plus metadata (author, timestamp, message, parent pointer) |
| **Branch** | A pointer to a commit (`main`, `master`, `dev`, `feature/login`) |
| **Remote / origin** | The external copy of your repo (GitHub, GitLab, Bitbucket). "Origin" is the default name. |
| **Staging area / index** | The prep zone for changes before committing |
| **Blob** | Binary large object. It stores file content and ignores filenames. |
| **Tree** | Links paths to blobs and other trees (directories) |
| **Refs** | References: branches, tags and special pointers like HEAD |
| **HEAD** | **Pointer to where you currently are** (branch or commit). Very important. |
| **Index** | The actual binary file on disk that stores staging data |
| **Object store** | `.git/objects`, where everything is stored by hash |
| **Tag** | A named pointer to a specific commit, used for releases (`v1.0.0`) |

## 7. The `.git` Directory
- A hidden folder, so use `ls -a` or `ls -la` to see it.
- It is the **brain of the project**: history, config, branches, everything.

| Path | Purpose |
|---|---|
| `.git/refs` | Branches and tags |
| `.git/objects` | Object store: all commits, blobs and trees, compressed. The project's "hard drive". |
| `.git/config` | Repo-specific settings (remotes, user info) |
| `.git/HEAD` | Which branch or commit you're on |
| `.git/index` | The staging area |

- **No `.git` = no Git.** Without it you just have files, with no history, branches or config.

## 8. Common Commands (Chapter 2: Git Basics)
**Core**
- `git init`: create a new repo (sets up `.git`)
- `git add`: stage changes
- `git commit`: save a snapshot of what's staged
- `git status`: see what's staged, unstaged or changed. You'll use it constantly.
- `git log`: commit history
- `git diff`: see what changed (working files, staging area, commits)

**Extras**
- `git config`: set your name and email (required on first setup)
- `git help`: built-in docs
- `git clone`: copy a remote repo to your machine
- `git rm`: remove tracked files
- `git mv`: rename or move files while preserving history
- `git restore`: undo file changes without rolling back a full commit

Don't memorise them all. You'll use them in the labs.

## 9. The Three Areas of Git
```
Working Directory  --git add-->  Staging Area  --git commit-->  Repository
```
1. **Working directory**: where you edit files. Git isn't tracking these changes yet.
2. **Staging area (index)**: files you've marked for the next snapshot.
3. **Repository**: the local `.git` folder where commits and history live.

**Key points:**
- Saving a file in VS Code does **not** mean Git has it.
- `git add` does **not** mean it's saved permanently. You need to **commit**.
- Understanding this flow clears up about 80% of beginner confusion.

## 10. Viewing History
| Command | What it does |
|---|---|
| `git log` | Full commit history |
| `git log --oneline --graph` | Clean visual of branches and merges |
| `git show <commit>` | Exactly what happened in one commit (changes, author, message) |
| `git diff` | Unstaged changes (see the correction below) |
| `git diff --staged` | What's about to be committed |
| `git blame <file>` | Who last changed each line |
| `git reflog` | Every HEAD movement, even deleted or reset stuff. It can help recover a nuked branch or bad rebase. |

Use these to find the **when, why and who** when something breaks.

## 11. Git vs GitHub
| Git | GitHub |
|---|---|
| CLI version control tool | Cloud platform that hosts repos |
| Runs locally | Runs online |
| Works offline | Needs internet |
| Open source | Owned by Microsoft |
| Tracks history | Collaboration: pull requests, code review, issues, CI/CD (GitHub Actions) |

- **Analogy:** Git is your personal notebook, GitHub is the shared whiteboard.
- Alternatives to GitHub: GitLab, Bitbucket, Azure DevOps. It's the same Git underneath.

## 12. Branching 101
Branches let you work on features, bug fixes or tests without touching the main project.

| Command | Purpose |
|---|---|
| `git branch` | **List** branches (or create one with a name). Doesn't switch. |
| `git checkout -b <name>` | Create and switch (older way, still valid) |
| `git switch -c <name>` | Create and switch (modern, cleaner) |
| `git switch <name>` | Switch to an existing branch |
| `git branch -d <name>` | Delete a branch. Git blocks it if the branch isn't merged. |

- **`switch`** is more beginner-friendly and explicit. **`checkout`** also handles files and commits, so it's more confusing.
- Branching is fast and cheap, so you can experiment without fear of breaking the main codebase.

## Corrections to the transcript
- **`git diff`:** it compares your working directory against the **staging area**, not against the last commit. The video says "last commit", which is loose. Once you stage a file, plain `git diff` shows nothing for it, and `git diff --staged` shows staged vs last commit.
- **Snapshots:** Git thinks in snapshots, but it stores them efficiently using compression and packfiles. It isn't literally copying whole files every time.
- **SHA-1:** newer Git versions support SHA-256 as an option, but SHA-1 is still the default.
- **Transcription typos:** "SSE pipeline" is probably "CI pipeline", and "other CSS" is probably "other CLI tools".
