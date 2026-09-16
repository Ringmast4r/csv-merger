<div align="center">

<img width="100%" alt="CSV MERGER" src="https://capsule-render.vercel.app/api?type=waving&color=0:000000,100:75273E&height=220&section=header&text=CSV%20MERGER&fontSize=60&fontColor=ffffff&animation=twinkling&fontAlignY=35&desc=Cross-platform%20%7C%20Python%20%7C%20CSV%20%7C%20Utility&descSize=16&descAlignY=58"/>

`Cross-platform` [`Python`](https://www.python.org/) `CSV` `Utility` - Merge multiple CSV files into one mega CSV. Simple, fast, offline. Handles huge files with smart header detection and batch processing.

[![Typing SVG](https://readme-typing-svg.herokuapp.com?font=Fira+Code&weight=600&size=20&pause=1000&color=75273E&center=true&vCenter=true&multiline=true&repeat=true&width=950&height=90&lines=Merge+multiple+CSV+files+into+one+mega+CSV%3BCross-platform+%2F+Python+%2F+CSV+%2F+Utility)](https://git.io/typing-svg)

<br>

[![Project](https://img.shields.io/badge/Project-csv--merger-75273E?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Ringmast4r/csv-merger)
[![Format](https://img.shields.io/badge/Format-Python-000000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Ringmast4r/csv-merger/tree/master)

[![Stars](https://img.shields.io/github/stars/Ringmast4r/csv-merger?style=flat-square&color=75273E)](https://github.com/Ringmast4r/csv-merger/stargazers)
[![Forks](https://img.shields.io/github/forks/Ringmast4r/csv-merger?style=flat-square&color=75273E)](https://github.com/Ringmast4r/csv-merger/network/members)
[![Repo Size](https://img.shields.io/github/repo-size/Ringmast4r/csv-merger?style=flat-square&color=75273E)](https://github.com/Ringmast4r/csv-merger)
[![Last Commit](https://img.shields.io/github/last-commit/Ringmast4r/csv-merger?style=flat-square&color=75273E)](https://github.com/Ringmast4r/csv-merger/commits/master)

</div>

---

# 📊 CSV Merger

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Python 3.x](https://img.shields.io/badge/python-3.x-blue.svg)](https://www.python.org/downloads/)
[![Platform](https://img.shields.io/badge/platform-Windows%20%7C%20Linux%20%7C%20macOS-lightgrey)](https://github.com/ringmast4r/csv-merger)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/ringmast4r/csv-merger/pulls)
[![Made with ❤️](https://img.shields.io/badge/Made%20with-%E2%9D%A4%EF%B8%8F-red)](https://github.com/ringmast4r)

Merge multiple CSV files into one mega CSV. Simple, fast, offline.

<a id="why-this"></a>
## `> why_this`

| Manual Merging | CSV Merger |
|----------------|------------|
| ❌ Tedious copy-paste | ✅ One click |
| ❌ Duplicate headers | ✅ Smart header handling |
| ❌ Error-prone | ✅ Automatic validation |
| ❌ Time-consuming | ✅ Batch processing |
| ❌ Scattered outputs | ✅ Organized vault |

<a id="features"></a>
## `> features`

- **🎯 Drag & Drop** - Interactive interface (Windows)
- **Batch Processing** - Merge 100+ files at once
- **Smart Headers** - Automatically keeps one header, skips duplicates
- **Recursive Mode** - Find CSVs in subfolders
- **Organized Output** - Timestamped folders in `merge_vault/`
- **Cross-Platform** - Windows, Linux, macOS
- **No Dependencies** - Just Python 3.x standard library
- **No Size Limits** - Handles huge files

<a id="quick-start"></a>
## `> quick_start`

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

<a id="output"></a>
## `> output`

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

<a id="example"></a>
## `> example`

```bash
# Before: 50 CSV files scattered everywhere
# After: One clean CSV with all data combined

python3 csv_merger.py -d ~/data/csvs -o mega.csv -v
# Output: merge_vault/20241107_1430/MERGED_ALL.csv
```

<a id="how-it-works"></a>
## `> how_it_works`

1. Scans folder for `.csv` files
2. Reads header from first CSV
3. Writes that header to output file
4. Iterates through all files, skipping their headers
5. Appends all data rows to output
6. Skips empty rows and handles errors gracefully

<a id="use-cases"></a>
## `> use_cases`

✅ Combine monthly/weekly CSV reports
✅ Merge data exports from multiple sources
✅ Consolidate database dumps
✅ Aggregate Excel exports
✅ Combine WiGLE/Kismet wardriving data
✅ Merge sensor/IoT data logs
✅ Any CSV files!

<a id="installation"></a>
## `> installation`

No installation needed! Just requires Python 3.x:

**Windows:** [Download Python](https://www.python.org/downloads/)
**Linux:** `sudo apt install python3` (Ubuntu/Debian)
**Mac:** `brew install python3`

<a id="documentation"></a>
## `> documentation`

- **`START_HERE.txt`** - Quick start guide with ASCII art
- **`HOW_TO_USE.txt`** - Visual guide for Windows
- **`QUICKSTART.md`** - Platform-specific instructions
- **`README.md`** - This file

<a id="options"></a>
## `> options`

```bash
python3 csv_merger.py --help

Options:
  -d, --directory     Directory containing CSV files
  -o, --output        Output merged CSV file (required)
  -v, --verbose       Show detailed progress
  --recursive         Include CSVs in subfolders
```

<a id="requirements"></a>
## `> requirements`

- Python 3.6 or higher
- No external dependencies (uses standard library only)

<a id="license"></a>
## `> license`

MIT - See [LICENSE](LICENSE)

---

Made with ❤️ by [ringmast4r](https://github.com/ringmast4r)

---

<div align="center">

<img width="100%" alt="CSV MERGER footer" src="https://capsule-render.vercel.app/api?type=waving&color=0:75273E,100:000000&height=120&section=footer&text=RINGMAST4R%20%2F%2F%20UTILITY&fontSize=18&fontColor=ffffff&fontAlignY=65"/>

</div>
