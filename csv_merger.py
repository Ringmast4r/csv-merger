#!/usr/bin/env python3
"""
CSV Merger Tool
Merges multiple CSV files into one mega CSV file
"""

import csv
import os
import sys
import argparse
from pathlib import Path
from datetime import datetime


class CSVMerger:
    """Universal CSV merger with smart header handling"""

    def __init__(self):
        self.total_rows = 0
        self.total_files = 0
        self.failed_files = []

    def merge_csv_files(self, input_files, output_file, verbose=False):
        """
        Merge multiple CSV files into a single output file.

        Args:
            input_files: List of input CSV file paths
            output_file: Path to the output merged CSV file
            verbose: Print progress information
        """
        if not input_files:
            print("[!] Error: No input files provided")
            return False

        header_written = False
        header = None

        if verbose:
            print(f"[*] Starting merge operation...")
            print(f"[*] Total files to process: {len(input_files)}")
            print()

        try:
            with open(output_file, 'w', newline='', encoding='utf-8') as outfile:
                writer = None

                for i, input_file in enumerate(input_files, 1):
                    if verbose:
                        print(f"[{i}/{len(input_files)}] Processing: {os.path.basename(input_file)}")

                    if not os.path.exists(input_file):
                        if verbose:
                            print(f"    [!] Warning: File not found, skipping")
                        self.failed_files.append(input_file)
                        continue

                    try:
                        with open(input_file, 'r', newline='', encoding='utf-8') as infile:
                            reader = csv.reader(infile)

                            # Handle header
                            try:
                                file_header = next(reader)
                            except StopIteration:
                                if verbose:
                                    print(f"    [!] Warning: Empty file, skipping")
                                self.failed_files.append(input_file)
                                continue

                            if not header_written:
                                # First file: write the header
                                writer = csv.writer(outfile)
                                header = file_header
                                writer.writerow(header)
                                header_written = True
                                if verbose:
                                    print(f"    [+] Header: {', '.join(header[:5])}{'...' if len(header) > 5 else ''}")

                            # Write data rows
                            row_count = 0
                            for row in reader:
                                if row:  # Skip empty rows
                                    writer.writerow(row)
                                    row_count += 1
                                    self.total_rows += 1

                            if verbose:
                                print(f"    [+] Added {row_count} rows")

                            self.total_files += 1

                    except Exception as e:
                        if verbose:
                            print(f"    [!] Error processing file: {e}")
                        self.failed_files.append(input_file)
                        continue

            if verbose:
                print()
                print("=" * 70)
                print("   *** MERGE COMPLETE! ***")
                print("=" * 70)
                print()
                print(f"   >>> Files processed: {self.total_files}/{len(input_files)}")
                print(f"   >>> Total rows merged: {self.total_rows}")
                print(f"   >>> Output file: {output_file}")
                if self.failed_files:
                    print(f"   >>> Failed files: {len(self.failed_files)}")
                print()
                print("=" * 70)

            return True

        except Exception as e:
            print(f"[!] Error writing output file: {e}")
            return False


def get_csv_files_from_directory(directory, recursive=False):
    """Get all CSV files from a directory."""
    csv_files = []

    if recursive:
        for file in Path(directory).rglob('*.csv'):
            if file.is_file():
                csv_files.append(str(file))
    else:
        for file in Path(directory).glob('*.csv'):
            if file.is_file():
                csv_files.append(str(file))

    return sorted(csv_files)


def main():
    parser = argparse.ArgumentParser(
        description='Merge multiple CSV files into one mega CSV file',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # Merge specific files
  python csv_merger.py file1.csv file2.csv file3.csv -o merged.csv

  # Merge all CSV files in a directory
  python csv_merger.py -d ./data_folder -o merged.csv

  # Merge all CSV files recursively
  python csv_merger.py -d ./data_folder -o merged.csv --recursive

  # With verbose output
  python csv_merger.py -d ./data -o merged.csv -v
        """
    )

    parser.add_argument('files', nargs='*', help='CSV files to merge')
    parser.add_argument('-d', '--directory', help='Directory containing CSV files to merge')
    parser.add_argument('-o', '--output', required=True, help='Output merged CSV file')
    parser.add_argument('-v', '--verbose', action='store_true', help='Verbose output')
    parser.add_argument('--recursive', action='store_true', help='Recursively find CSV files in subdirectories')

    args = parser.parse_args()

    # Collect input files
    input_files = []

    if args.directory:
        input_files.extend(get_csv_files_from_directory(args.directory, args.recursive))
        if args.verbose:
            print(f"[*] Found {len(input_files)} CSV files in directory")
            if args.recursive:
                print(f"[*] Recursive mode: searching subdirectories")
            print()

    if args.files:
        input_files.extend(args.files)

    if not input_files:
        print("[!] Error: No input files specified. Use -d for directory or provide file names.")
        parser.print_help()
        return 1

    # Remove duplicates while preserving order
    seen = set()
    input_files = [x for x in input_files if not (x in seen or seen.add(x))]

    # Perform merge
    merger = CSVMerger()
    success = merger.merge_csv_files(input_files, args.output, args.verbose)

    return 0 if success else 1


if __name__ == '__main__':
    sys.exit(main())
