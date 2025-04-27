# Fawry-Task


---

# `mygrep.sh`

A mini version of the `grep` command written in Bash.

---

## Features
- Search for a string (case-insensitive).
- Show line numbers with `-n`.
- Invert match with `-v`.
- Count matching lines with `-c`.
- Combine options like `-vn`, `-nc`, etc.
- Display help information with `--help`.

---

## Usage

```bash
./mygrep.sh [options] search_string filename
```

### Options

| Option | Description |
|:------|:------------|
| `-n` | Show line numbers for matches |
| `-v` | Invert the match (show non-matching lines) |
| `-c` | Count matching lines instead of printing them |
| `--help` | Show usage information |

---

## Example Commands

```bash
./mygrep.sh hello testfile.txt
./mygrep.sh -n hello testfile.txt
./mygrep.sh -vn hello testfile.txt
./mygrep.sh -v testfile.txt   # Error: Missing search string
./mygrep.sh -c hello testfile.txt
```

---

## Reflection

### How the script handles arguments and options
The script uses `getopts` to parse `-n`, `-v`, and the newly added `-c` options. After option parsing, it shifts to read the search string and filename. It validates input, checks if the file exists, and processes the file line-by-line using `grep` with case-insensitive matching. Depending on the flags, it either prints matching lines, shows line numbers, inverts matches, or counts matching lines.

### Supporting more options like regex, `-i`, `-c`, `-l`
To support regex (`-E`) or other options like `-l`, the script structure would need small changes: adding more flags to `getopts`, adjusting `grep` options, and changing the behavior after a match (e.g., stopping early if `-l` is used).

### Hardest part
The hardest part was handling combinations of options like `-vn`, `-nc`, and making sure they work together properly. Using `getopts` made it much cleaner and more reliable.

---
![Screenshot 2025-04-27 154639](https://github.com/user-attachments/assets/c25841be-7cfe-4d36-b86d-57a329d5e35d)
![Screenshot 2025-04-27 154723](https://github.com/user-attachments/assets/160297c7-cfcc-44b4-8e9e-666715512f53)
![Screenshot 2025-04-27 154756](https://github.com/user-attachments/assets/2b15b69a-81c0-461a-8dde-3091600470c2)


