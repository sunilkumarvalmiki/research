# Production Environment Setup - Execution Plan

## Current Status Audit

### ✅ Installed & Working
- **Ollama:** Installed with 7 models
- **Docker Desktop:** Version 29.0.1 (running)
- **External Storage:** Both drives connected
  - `/Volumes/sunil kumar` - 931GB (98% used, 22GB free) - Seagate HDD
  - `/Volumes/Sunil Kumar 1` - 931GB (42% used, 546GB free) - Samsung SSD
- **Python:** Installed (need to verify version)
- **Homebrew:** Installed

### ❌ Not Installed / Needs Setup
- **VSCode:** Not found, needs installation
- **LM Studio:** Installed but not verified
- **MCP Servers:** Not installed
- **MLX Framework:** Not installed
- **Development Tools:** Need verification

### 🔍 Models Installed (Ollama)
1. **qwen3:8b** (5.2GB) - Good general model ✅
2. **deepseek-r1:8b** (5.2GB) - Reasoning model ✅
3. **wizardcoder:latest** (3.8GB) - Coding ⚠️ (older)
4. **codellama:7b** (3.8GB) - Coding ⚠️ (older, replaced by newer)
5. **qwen2.5-coder:7b** (4.7GB) - Coding ✅ (excellent)
6. **deepseek-coder-v2:latest** (8.9GB) - Coding ✅ (best for M1 Pro)
7. **starcoder2:7b** (4.0GB) - Coding ✅

**Assessment:** Good selection but needs optimization. Will remove `wizardcoder` and `codellama` (redundant/older), keep the best performers.

---

## Execution Plan

### Phase 1: Storage Configuration (PRIORITY)
1. Move Ollama models to Samsung SSD (546GB free)
2. Configure Docker to use Samsung SSD
3. Set up backup strategy (HDD for backups)

### Phase 2: Development Environment
1. Install VSCode (replacing Cursor/PyCharm role)
2. Configure VSCode extensions for AI development
3. Install MLX framework for Apple Silicon
4. Install development tools

### Phase 3: Model Optimization
1. Remove redundant models (wizardcoder, codellama)
2. Add recommended models from OpensourceDevelopment.md
3. Configure LM Studio with optimal models
4. Set up model hot-swapping

### Phase 4: MCP & Tools Installation
1. Install FastMCP for Python
2. Install key MCP servers (filesystem, git, browser automation)
3. Configure LangChain with MCP adapters
4. Install CrewAI for multi-agent workflows

### Phase 5: Docker Configuration
1. Configure Docker resources for M1 Pro
2. Set up ChromaDB container
3. Set up Weaviate container
4. Configure Docker volumes on SSD

### Phase 6: Final Integration & Push
1. Test all tools integration
2. Configure git remote
3. Push to GitHub
4. Create deployment documentation

---

## Detailed Actions

### Storage Strategy

```
Internal SSD (926GB, 119GB used):
├── System & Applications
├── Active Projects (/Users/sunilkumar/workspace)
└── Docker base images

Samsung SSD (/Volumes/Sunil Kumar 1, 546GB free):
├── Ollama Models (~30GB)
├── Docker Volumes (~50GB)
├── LM Studio Models (~30GB)
├── Active Datasets (~100GB)
└── Build caches

Seagate HDD (/Volumes/sunil kumar, 22GB free - FULL!):
├── Time Machine Backups
└── Need to free space or get new drive
```

**ISSUE:** Seagate HDD is 98% full! Need to either:
- Free up space
- Get new backup drive
- Use Samsung SSD for Time Machine temporarily

### Recommended Model Set

**For Coding (keep 2-3):**
1. `deepseek-coder-v2:16b-lite` (9GB) - Best for actual coding ✅ ALREADY HAVE
2. `qwen2.5-coder:7b` (4.7GB) - Fast, excellent ✅ KEEP
3. `starcoder2:7b` (4GB) - Good alternative ✅ KEEP
4. ❌ REMOVE: wizardcoder, codellama (redundant)

**For Research/Analysis (keep 2):**
1. `qwen3:8b` (5.2GB) - Excellent reasoning ✅ KEEP
2. `mistral:7b` - Add for general tasks
3. `deepseek-r1:8b` (5.2GB) - Reasoning ✅ KEEP

**For Specialized:**
1. `llama3:8b` - General purpose, very fast (ADD)

**Total After Optimization:** ~35GB (manageable on SSD)

---

## Next Steps

Proceeding with autonomous installation and configuration...
