"""Merging zero files must fail loudly, not exit 0 in silence."""

import sys

import pytest

from csv_merger import CSVMerger, main


def _write_csv(path, rows):
    with open(path, "w", newline="", encoding="utf-8") as fh:
        fh.write("\n".join(rows) + "\n")


def test_all_inputs_missing_returns_false(tmp_path):
    out = tmp_path / "merged.csv"
    merger = CSVMerger()
    assert merger.merge_csv_files(
        [str(tmp_path / "nope1.csv"), str(tmp_path / "nope2.csv")],
        str(out),
    ) is False


def test_all_inputs_missing_main_exit_code(tmp_path, monkeypatch, capsys):
    out = tmp_path / "merged.csv"
    monkeypatch.setattr(
        sys, "argv", ["csv_merger.py", str(tmp_path / "nope.csv"), "-o", str(out)]
    )
    assert main() == 1
    captured = capsys.readouterr()
    assert "no" in captured.out.lower() and "merg" in captured.out.lower()


def test_partial_success_still_merges(tmp_path):
    good = tmp_path / "good.csv"
    _write_csv(good, ["a,b", "1,2"])
    out = tmp_path / "merged.csv"
    merger = CSVMerger()
    assert merger.merge_csv_files(
        [str(good), str(tmp_path / "nope.csv")], str(out)
    ) is True
    with open(out, encoding="utf-8") as fh:
        assert fh.read().splitlines() == ["a,b", "1,2"]
