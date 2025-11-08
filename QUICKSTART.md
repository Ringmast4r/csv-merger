# CSV Merger - Quick Start

## 🚀 Platform-Specific Instructions

### Windows 🪟

**Method 1: Interactive Mode (Easiest)**
1. Double-click `CSV Merger.bat`
2. Type or paste your folder path
3. Choose your option (1 or 2)
4. Done! Check `merge_vault` folder

**Method 2: Command Line**
```cmd
cd C:\path\to\CSV-Merger
"CSV Merger.bat"
# Then paste folder path when prompted
```

**Method 3: Direct Python**
```cmd
python csv_merger.py -d "C:\path\to\csvs" -o merged.csv -v
```

---

### Linux/Mac 🐧🍎

**Method 1: Shell Script**
```bash
cd /path/to/CSV-Merger
./convert.sh /path/to/your/csvs
```

**Method 2: Make it System-Wide**
```bash
# Make executable (first time only)
chmod +x convert.sh

# Create symlink (optional)
sudo ln -s $(pwd)/convert.sh /usr/local/bin/csv-merge

# Now use from anywhere:
csv-merge ~/Documents/data/
```

**Method 3: Direct Python**
```bash
python3 csv_merger.py -d ~/data/csvs -o merged.csv -v
python3 csv_merger.py file1.csv file2.csv file3.csv -o merged.csv -v
```

---

## 📋 What You Can Merge

✅ **Multiple CSV Files in One Folder**
```bash
# Windows
"CSV Merger.bat"
# Enter: C:\data\csvs\

# Linux/Mac
./convert.sh ~/data/csvs/
```

✅ **CSV Files in Subfolders (Recursive)**
```bash
# Windows
python csv_merger.py -d "C:\data" -o merged.csv --recursive -v

# Linux/Mac
python3 csv_merger.py -d ~/data -o merged.csv --recursive -v
```

✅ **Specific Files**
```bash
# Windows
python csv_merger.py file1.csv file2.csv file3.csv -o merged.csv -v

# Linux/Mac
python3 csv_merger.py file1.csv file2.csv file3.csv -o merged.csv -v
```

---

## 📦 Output Location

All merges are saved in timestamped folders:

```
CSV-Merger/
└── merge_vault/
    ├── 20241107_093015/
    │   └── MERGED_ALL.csv
    ├── 20241107_143022/
    │   └── MERGED_ALL.csv
    └── 20241107_201545/
        └── MERGED_ALL.csv
```

---

## 💡 Examples

### Example 1: Merge All CSVs in a Folder
```bash
# Windows (Interactive)
"CSV Merger.bat"
# Paste: C:\Users\Squir\Documents\data
# Choose: 2 (MERGE)

# Linux/Mac
./convert.sh ~/Documents/data
# Choose: 2 (MERGE)
```

### Example 2: Merge Specific Files
```bash
# Windows
python csv_merger.py jan.csv feb.csv mar.csv -o Q1.csv -v

# Linux/Mac
python3 csv_merger.py jan.csv feb.csv mar.csv -o Q1.csv -v
```

### Example 3: Recursive Merge of All Subfolders
```bash
# Windows
python csv_merger.py -d "C:\Data" -o everything.csv --recursive -v

# Linux/Mac
python3 csv_merger.py -d ~/Data -o everything.csv --recursive -v
```

---

## 🎯 Features

✅ No size limits (handles huge files)
✅ Batch processing (merge 100+ files at once)
✅ Smart header detection (keeps only one header)
✅ 100% offline (no internet needed)
✅ Timestamped outputs (never lose work)
✅ Cross-platform (Windows/Linux/Mac)
✅ No dependencies (just Python 3.x)

---

## 🛠️ Troubleshooting

**Windows: "Python not found"**
- Install from: https://python.org/downloads/
- Check "Add Python to PATH" during install

**Linux: "python3: command not found"**
```bash
# Ubuntu/Debian
sudo apt update && sudo apt install python3

# Fedora/RHEL
sudo dnf install python3

# Arch
sudo pacman -S python
```

**Mac: "python3: command not found"**
```bash
# Install Homebrew first (if needed)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Python
brew install python3
```

**Permission denied (Linux/Mac)**
```bash
chmod +x convert.sh
chmod +x csv_merger.py
```

---

## 📊 How It Works

1. Scans folder for .csv files
2. Reads header from first CSV
3. Writes header to output file
4. Iterates through all CSVs, skipping their headers
5. Appends all data rows to output file
6. Creates timestamped folder in merge_vault/
7. Opens output folder when complete

---

## 🆘 Need Help?

Check these files:
- `README.md` - Full documentation
- `START_HERE.txt` - Quick start guide
- `HOW_TO_USE.txt` - Visual guide (Windows)

---

**That's it! Simple CSV merging.** 🚀

Made with ❤️ by [ringmast4r](https://github.com/ringmast4r)
