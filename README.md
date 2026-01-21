# Git Collaboration Game – 2 Person Activity

This repository is a **hands-on Git learning activity** designed for **2 participants** to practice real-world Git collaboration concepts such as branching, merging, conflicts, pull requests, and git stash.

---

## 👥 Roles

- **Person A** → Developer  
- **Person B** → Team Lead / Repository Owner  

---

## 📌 Assumptions

- Repository name: `fintech-app`
- Default branch: `main`
- Both users have:
  - Git installed
  - GitHub / GitLab accounts

---

## 🎯 Learning Objectives

By completing this activity, learners will understand:

- Repository collaboration
- Clone, pull, and push workflow
- Feature branches
- Merge conflicts and resolution
- Pull Request (PR) flow
- Using `git stash` for urgent interruptions

---

## 🧩 Phase 1 — Project Birth

### Step 1: Developer A creates project locally
```bash
mkdir fintech-app
cd fintech-app
echo "FinTech App - Initial Version" > README.md
echo "console.log('Hello FinTech');" > app.js
git init
git add .
git commit -m "Initial local project setup"
```

### Step 2: Team Lead B creates remote repository
Create a repository named `fintech-app` on GitHub/GitLab.

### Step 3: B adds A as collaborator

### Step 4: A pushes code to remote
```bash
git remote add origin https://github.com/b/fintech-app.git
git branch -M main
git push -u origin main
```

---

## 🔁 Phase 2 — Clone & Sync

### Step 5: B clones the repository
```bash
git clone https://github.com/b/fintech-app.git
cd fintech-app
```

---

## 🤝 Phase 3 — Basic Collaboration

### Step 6: B makes a change
```bash
echo "// Added by B" >> app.js
git add app.js
git commit -m "B added comment"
git push
```

### Step 7: A pulls latest changes
```bash
git pull
```

---

## 🌱 Phase 4 — Feature Branch Workflow

### Step 8: A creates feature branch
```bash
git checkout -b feature-login
echo "Login feature by A" > feature-login.txt
git add .
git commit -m "Added login feature"
git push -u origin feature-login
```

### Step 9: B merges feature branch
```bash
git checkout main
git pull
git merge origin/feature-login
git push
```

---

## ⚔️ Phase 5 — Merge Conflict Scenario

### Step 10: Both edit the same line

A edits and pushes:
```bash
sed -i '2s/.*/Line 2 updated by A/' README.md
git add README.md
git commit -m "A updated README"
git push
```

B edits without pulling:
```bash
sed -i '2s/.*/Line 2 updated by B/' README.md
git add README.md
git commit -m "B updated README"
git pull
```

### Step 11: Resolve conflict
Edit file to:
```
Line 2 updated by A and B
```

Then:
```bash
git add README.md
git commit -m "Resolved merge conflict"
git push
```

---

## 🔀 Phase 6 — Pull Request Flow

### Step 12: A creates bug-fix branch
```bash
git checkout -b bug-fix
echo "// Bug fixed by A" >> app.js
git add app.js
git commit -m "Bug fix"
git push -u origin bug-fix
```

### Step 13: Pull Request
Create PR from `bug-fix` → `main` and merge after review.

---

## 📦 Phase 7 — Git Stash Story

### Step 14: A stashes work
```bash
echo "Feature work by A" >> app.js
echo "Temp notes" > temp.txt
git stash
git stash list
```

### Step 15: A fixes urgent issue
```bash
git checkout -b hotfix-payment
echo "// Hotfix applied" >> app.js
git add app.js
git commit -m "Payment hotfix"
git push -u origin hotfix-payment
```

### Step 16: A restores stashed work
```bash
git checkout main
git pull
git stash pop
```

---

## 🧠 Core Git Commands Covered

```bash
git clone
git pull
git push
git checkout -b
git merge
git stash
git stash pop
```

---

## 📄 License

This project is for **educational and training purposes only**.
