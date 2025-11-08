#!/bin/bash
################################################################################
#   CSV MERGER - LINUX/MAC VERSION
################################################################################

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VAULT="$SCRIPT_DIR/merge_vault"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Create merge vault
mkdir -p "$VAULT"

# Check Python
if ! command -v python3 &> /dev/null; then
    echo -e "${RED}ERROR: Python 3 not found!${NC}"
    echo "Please install Python 3:"
    echo "  Ubuntu/Debian: sudo apt install python3"
    echo "  macOS: brew install python3"
    exit 1
fi

# No arguments? Show help
if [ $# -eq 0 ]; then
    clear
    echo ""
    echo "======================================================================"
    echo "  CSV MERGER"
    echo "======================================================================"
    echo ""
    echo "USAGE:"
    echo "  ./convert.sh <folder> [options]"
    echo ""
    echo "EXAMPLES:"
    echo "  ./convert.sh data/csvs/"
    echo "  ./convert.sh data/ --recursive"
    echo ""
    echo "OPTIONS:"
    echo "  --recursive   Include CSV files in subfolders"
    echo ""
    echo "All outputs saved to: $VAULT"
    echo ""
    exit 0
fi

# Get input
INPUT="$1"

# Check if input exists
if [ ! -e "$INPUT" ]; then
    echo -e "${RED}ERROR: Not found: $INPUT${NC}"
    exit 1
fi

# Create timestamped output folder
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
OUTPUT_FOLDER="$VAULT/$TIMESTAMP"
mkdir -p "$OUTPUT_FOLDER"

echo ""
echo -e "${BLUE}======================================================================"
echo "  CSV MERGER"
echo -e "======================================================================${NC}"
echo ""

# Check if it's a folder
if [ -d "$INPUT" ]; then
    echo -e "${GREEN}Detected: FOLDER${NC}"
    echo ""

    # Count CSV files
    CSV_COUNT=$(find "$INPUT" -maxdepth 1 -name "*.csv" -type f | wc -l)

    if [ $CSV_COUNT -eq 0 ]; then
        echo -e "${RED}No CSV files found in this folder!${NC}"
        exit 1
    fi

    echo ""
    echo -e "${YELLOW}======================================================================"
    echo "  *** YOU ARE ABOUT TO MERGE ALL THESE FILES INTO ONE ***"
    echo -e "======================================================================${NC}"
    echo ""
    echo "  Total CSV files found: $CSV_COUNT"
    echo ""
    echo "  All files will be combined into a single mega CSV file"
    echo "  with one header and all data rows merged together."
    echo ""
    echo "----------------------------------------------------------------------"
    echo ""
    read -p "Continue with merge? (Y/N): " confirm
    echo ""

    if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
        echo -e "${RED}Merge cancelled.${NC}"
        exit 0
    fi

    # Merge all
    RECURSIVE_FLAG=""
    if [[ "$2" == "--recursive" ]]; then
        RECURSIVE_FLAG="--recursive"
    fi
    python3 "$SCRIPT_DIR/csv_merger.py" -d "$INPUT" -o "$OUTPUT_FOLDER/MERGED_ALL.csv" -v $RECURSIVE_FLAG

else
    echo -e "${RED}ERROR: Please provide a folder containing CSV files${NC}"
    exit 1
fi

echo ""
echo -e "${GREEN}======================================================================"
echo "  *** MERGE COMPLETE! ***"
echo -e "======================================================================${NC}"
echo ""
echo "✓ Output saved to: merge_vault/$TIMESTAMP/"
echo ""
echo "   Made with love by ringmast4r <3"
echo ""

# Open folder (platform specific)
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    open "$OUTPUT_FOLDER"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    if command -v xdg-open &> /dev/null; then
        xdg-open "$OUTPUT_FOLDER" 2>/dev/null
    elif command -v nautilus &> /dev/null; then
        nautilus "$OUTPUT_FOLDER" 2>/dev/null
    fi
fi

echo "Done!"
