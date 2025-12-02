# Quick Reference Guide - Production Environment

## 🚀 Quick Start

### Test Your Setup (Run These Commands)

```bash
# 1. Test Ollama models
ollama list
ollama run llama3:8b "Write a Python hello world"

# 2. Test MLX framework
python3 -c "import mlx.core as mx; print(f'MLX {mx.__version__} ready!')"

# 3. Check protection system status
./scripts/check-protection.sh

# 4. Verify Git setup
git remote -v
git branch -a
```

---

## 📚 Model Quick Reference

### Coding
```bash
# Best overall - Complex coding tasks
ollama run deepseek-coder-v2 "your coding question"

# Fast - Quick completions
ollama run qwen2.5-coder "your coding question"

# Alternative - Code completion
ollama run starcoder2 "your coding question"
```

### Research
```bash
# Best - Research and analysis
ollama run qwen3 "your research question"

# Advanced - Complex reasoning
ollama run deepseek-r1 "your reasoning task"
```

### General
```bash
# Fastest - General queries
ollama run llama3 "your question"

# Alternative - Strong reasoning
ollama run mistral "your question"
```

---

## 🛡️ Daily Workflow

### Morning (5 min)
```bash
cd ~/workspace/research
./scripts/daily-check.sh  # Review tests, merge if passed
git checkout dev           # Start work
```

### During Work
```bash
# Frequent commits
git add .
git commit -m "feat: your changes"

# Always review AI changes
git diff
```

### Evening (5 min)
```bash
./scripts/daily-sync.sh  # Push to test branch
```

### Emergency Rollback
```bash
./scripts/quick-rollback.sh --date yesterday
```

---

## 🔧 Common Tasks

### Run a Model
```bash
ollama run MODEL_NAME "your prompt"
ollama run MODEL_NAME  # Interactive mode
```

### Docker Containers
```bash
# ChromaDB
docker run -p 8000:8000 chromadb/chroma

# Weaviate
docker run -p 8080:8080 semitechnologies/weaviate
```

### VSCode
```bash
# Open project
code ~/workspace/research

# Open file
code path/to/file.py
```

### Check What's Running
```bash
# Ollama
ps aux | grep ollama

# Docker
docker ps

# Python processes
ps aux | grep python
```

---

## ⚠️ CRITICAL: Seagate HDD Full (98%)

Your backup drive is almost full! Do ONE of these:

### Option 1: Delete Old Backups
```bash
sudo tmutil listlocalsnapshotdates
sudo tmutil deletelocalsnapshots YYYY-MM-DD
```

### Option 2: Get New Backup Drive
- Buy 2TB+ external drive
- Configure as new Time Machine destination

### Option 3: Temporary Fix
- Use Samsung SSD for backups temporarily
- Then move models to internal SSD

---

## 📦 Installed Software

### Core
- ✅ Python 3.14.0
- ✅ pip 25.2
- ✅ Git (configured)
- ✅ Docker Desktop 29.0.1
- ✅ Homebrew
- ✅ VSCode

### AI/ML
- ✅ Ollama (7 models, 38GB)
- ✅ MLX v0.30.0
- ⏳ LangChain (installing)
- ⏳ ChromaDB (installing)
- ⏳ CrewAI (installing)

### Tools
- ✅ Git safety hooks
- ✅ Automation scripts (5)
- ✅ Protection system (7 layers)

---

## 🌐 GitHub Repository

**URL:** https://github.com/sunilkumarvalmiki/research.git

**Branches:**
- `main` - Production-ready code
- `test` - Daily integration + automated tests
- `dev` - Active development (work here)

**Push/Pull:**
```bash
git push origin dev
git pull origin dev
```

---

## 💾 Storage Map

```
Internal SSD (782GB free):
├── System & Apps
└── Active work

Samsung SSD (546GB free):
├── [MOVE HERE] Ollama models (38GB)
├── [MOVE HERE] Docker volumes (50GB)
└── Datasets

Seagate HDD (22GB free - FULL!):
└── [CRITICAL] Time Machine backups
```

---

## 🆘 Emergency Commands

### System Frozen
```bash
# Kill Ollama
pkill ollama

# Kill Docker
killall Docker

# Restart services
ollama serve
open -a Docker
```

### Out of Space
```bash
# Check space
df -h

# Find large files
du -sh * | sort -h

# Clear Docker
docker system prune -a
```

### Git Issues
```bash
# Reset to last good state
git reset --hard HEAD

# Rollback to yesterday
./scripts/quick-rollback.sh --date yesterday

# Restore from main
git reset --hard origin/main
```

---

## 📞 Support Resources

- **Ollama:** https://ollama.ai/docs
- **MLX:** https://ml-explore.github.io/mlx/
- **LangChain:** https://python.langchain.com/
- **ChromaDB:** https://docs.trychroma.com/
- **CrewAI:** https://docs.crewai.com/

---

## ✅ Success Checklist

- [x] MLX installed and working
- [x] 7 Ollama models optimized
- [x] Git repository pushed to GitHub
- [x] Protection system active
- [x] External SSDs connected
- [ ] Dev tools installation complete (check with: `python3 -c "import langchain"`)
- [ ] VSCode configured with extensions
- [ ] Seagate HDD space freed up
- [ ] Ollama models moved to Samsung SSD

**Next:** Run `python3 -c "import langchain; import chromadb; import crewai; print('All ready!')"` to verify dev tools.
