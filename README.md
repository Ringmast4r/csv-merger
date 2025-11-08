# 📊 CSV Merger

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Python 3.x](https://img.shields.io/badge/python-3.x-blue.svg)](https://www.python.org/downloads/)
[![Platform](https://img.shields.io/badge/platform-Windows%20%7C%20Linux%20%7C%20macOS-lightgrey)](https://github.com/ringmast4r/csv-merger)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/ringmast4r/csv-merger/pulls)
[![Made with ❤️](https://img.shields.io/badge/Made%20with-%E2%9D%A4%EF%B8%8F-red)](https://github.com/ringmast4r)

Merge multiple CSV files into one mega CSV. Simple, fast, offline.

## Why This?

| Manual Merging | CSV Merger |
|----------------|------------|
| ❌ Tedious copy-paste | ✅ One click |
| ❌ Duplicate headers | ✅ Smart header handling |
| ❌ Error-prone | ✅ Automatic validation |
| ❌ Time-consuming | ✅ Batch processing |
| ❌ Scattered outputs | ✅ Organized vault |

## Features

- **🎯 Drag & Drop** - Interactive interface (Windows)
- **Batch Processing** - Merge 100+ files at once
- **Smart Headers** - Automatically keeps one header, skips duplicates
- **Recursive Mode** - Find CSVs in subfolders
- **Organized Output** - Timestamped folders in `merge_vault/`
- **Cross-Platform** - Windows, Linux, macOS
- **No Dependencies** - Just Python 3.x standard library
- **No Size Limits** - Handles huge files

## Quick Start

### Windows (Interactive Mode!)
```bash
# 1. Double-click to launch
CSV Merger.bat

# 2. Type or paste folder path - done!
```

### Linux/Mac
```bash
chmod +x convert.sh
./convert.sh /path/to/csvs
```

### Python (All Platforms)
```bash
# Merge entire folder
python3 csv_merger.py -d ./data -o merged.csv -v

# Merge specific files
python3 csv_merger.py file1.csv file2.csv file3.csv -o merged.csv -v

# Recursive merge (include subfolders)
python3 csv_merger.py -d ./data -o merged.csv --recursive -v
```

## Output

All outputs saved to timestamped folders:

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

## Example

```bash
# Before: 50 CSV files scattered everywhere
# After: One clean CSV with all data combined

python3 csv_merger.py -d ~/data/csvs -o mega.csv -v
# Output: merge_vault/20241107_1430/MERGED_ALL.csv
```

## How It Works

1. Scans folder for `.csv` files
2. Reads header from first CSV
3. Writes that header to output file
4. Iterates through all files, skipping their headers
5. Appends all data rows to output
6. Skips empty rows and handles errors gracefully

## Use Cases

✅ Combine monthly/weekly CSV reports
✅ Merge data exports from multiple sources
✅ Consolidate database dumps
✅ Aggregate Excel exports
✅ Combine WiGLE/Kismet wardriving data
✅ Merge sensor/IoT data logs
✅ Any CSV files!

## Installation

No installation needed! Just requires Python 3.x:

**Windows:** [Download Python](https://www.python.org/downloads/)
**Linux:** `sudo apt install python3` (Ubuntu/Debian)
**Mac:** `brew install python3`

## Documentation

- **`START_HERE.txt`** - Quick start guide with ASCII art
- **`HOW_TO_USE.txt`** - Visual guide for Windows
- **`QUICKSTART.md`** - Platform-specific instructions
- **`README.md`** - This file

## Options

```bash
python3 csv_merger.py --help

Options:
  -d, --directory     Directory containing CSV files
  -o, --output        Output merged CSV file (required)
  -v, --verbose       Show detailed progress
  --recursive         Include CSVs in subfolders
```

## Requirements

- Python 3.6 or higher
- No external dependencies (uses standard library only)

## License

MIT - See [LICENSE](LICENSE)

---

Made with ❤️ by [ringmast4r](https://github.com/ringmast4r)
