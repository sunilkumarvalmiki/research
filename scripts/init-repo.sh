#!/bin/bash
# Repository Initialization Script
# Applies standard structure and templates to a new repository

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
REPO_ROOT="$( cd "$SCRIPT_DIR/.." && pwd )"

echo "🚀 Initializing repository..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

# Check if we're in a git repository
if [ ! -d ".git" ]; then
    print_error "Not a git repository. Run 'git init' first."
    exit 1
fi

# Create standard directory structure
echo "📁 Creating directory structure..."

mkdir -p src tests docs .github/workflows .github/ISSUE_TEMPLATE

print_success "Created directory structure"

# Create/update .gitignore
echo "📝 Creating .gitignore..."

if [ ! -f ".gitignore" ]; then
    cat > .gitignore << 'EOF'
# Dependencies
node_modules/
venv/
.venv/
__pycache__/
*.pyc
target/

# Build outputs
dist/
build/
*.egg-info/
.next/
out/

# IDE
.vscode/
.idea/
*.swp
*.swo
*~

# OS
.DS_Store
Thumbs.db

# Environment
.env
.env.local

# Test coverage
coverage/
.coverage
*.lcov

# Logs
*.log
logs/
EOF
    print_success "Created .gitignore"
else
    print_warning ".gitignore already exists, skipping"
fi

# Create README template if doesn't exist
echo "📝 Creating README template..."

if [ ! -f "README.md" ]; then
    cat > README.md << 'EOF'
# Project Name

<!-- Add project description here -->

## Features

- Feature 1
- Feature 2

## Installation

```bash
# Installation steps
```

## Usage

```bash
# Usage examples
```

## Development

```bash
# Development setup
```

## Contributing

Contributions are welcome! Please see [CONTRIBUTING.md](CONTRIBUTING.md).

## License

[MIT](LICENSE)
EOF
    print_success "Created README.md template"
else
    print_warning "README.md already exists, skipping"
fi

# Create LICENSE (MIT by default)
echo "📝 Creating LICENSE..."

if [ ! -f "LICENSE" ]; then
    YEAR=$(date +%Y)
    read -p "Enter your name for the LICENSE: " NAME
    
    cat > LICENSE << EOF
MIT License

Copyright (c) $YEAR $NAME

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF
    print_success "Created LICENSE"
else
    print_warning "LICENSE already exists, skipping"
fi

# Copy issue templates
echo "📝 Creating issue templates..."

cp "$REPO_ROOT/.github/ISSUE_TEMPLATE/"* ".github/ISSUE_TEMPLATE/" 2>/dev/null || print_warning "Issue templates not found in research repo"

# Copy PR template
cp "$REPO_ROOT/.github/PULL_REQUEST_TEMPLATE.md" ".github/" 2>/dev/null || print_warning "PR template not found in research repo"

# Setup git hooks (optional)
echo "🔧 Setting up git hooks..."

read -p "Install git hooks for commit validation? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    mkdir -p .git/hooks
    
    # Pre-commit hook
    cat > .git/hooks/pre-commit << 'EOF'
#!/bin/bash
# Pre-commit hook

# Run linters if available
if command -v ruff &> /dev/null; then
    echo "Running ruff..."
    ruff check .
fi

if command -v eslint &> /dev/null; then
    echo "Running eslint..."
    npm run lint
fi

# Check for secrets
if command -v git-secrets &> /dev/null; then
    git secrets --scan
fi
EOF
    chmod +x .git/hooks/pre-commit
    print_success "Installed pre-commit hook"
fi

# Initialize package files based on detected languages
echo "📦 Initializing package files..."

# Python
if [ -d "src" ] && ! [ -f "pyproject.toml" ]; then
    read -p "Initialize Python project? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        cat > pyproject.toml << 'EOF'
[project]
name = "project-name"
version = "0.1.0"
description = "Project description"
requires-python = ">=3.11"
dependencies = []

[project.optional-dependencies]
dev = [
    "pytest>=7.0.0",
    "pytest-cov>=4.0.0",
    "ruff>=0.1.0",
    "mypy>=1.0.0",
]

[tool.ruff]
line-length = 100

[tool.pytest.ini_options]
testpaths = ["tests"]
python_files = ["test_*.py"]
EOF
        print_success "Created pyproject.toml"
    fi
fi

# JavaScript/TypeScript
if ! [ -f "package.json" ]; then
    read -p "Initialize Node.js project? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        npm init -y
        print_success "Created package.json"
    fi
fi

echo ""
echo "✨ Repository initialization complete!"
echo ""
echo "Next steps:"
echo "1. Update README.md with project details"
echo "2. Install dependencies"
echo "3. Configure CI/CD in .github/workflows/"
echo "4. Add tests in tests/"
echo "5. Start coding in src/"
echo ""
echo "For more guidance, see: https://github.com/sunilkumarvalmiki/research"
