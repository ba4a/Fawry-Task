# Fawry-Task


---
#  `Q1`

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

------------------------------------------------------------------------------------------------------------------------------------------------------------------------


# Q2

# 📄 Internal Dashboard Connectivity Troubleshooting Guide

## 🛠️ Steps:

1. **Check DNS Resolution**
   ```bash
   cat /etc/resolv.conf
   dig internal.fawry.com
   ```
   - If it doesn't resolve, continue to next step.

2. **Check IP Reachability**
   ```bash
   ping 127.0.0.1
   ```

3. **Check Port 5000 Reachability**
   ```bash
   telnet 127.0.0.1 5000
   ```

4. **Check if the Service is Running**
   ```bash
   ss -tulnp | grep 5000
   ```
   - If service is running, proceed to fix DNS.

5. **Bypass DNS Temporarily**
   - Edit `/etc/hosts`:
     ```bash
     sudo vim /etc/hosts
     ```
   - Add:
     ```
     127.0.0.1 internal.fawry.com
     ```
   - Test:
     ```bash
     ping internal.fawry.com
     curl http://internal.fawry.com:5000/
     ```

6. **Fix DNS Permanently**
   - Edit `/etc/systemd/resolved.conf`:
     ```bash
     sudo vim /etc/systemd/resolved.conf
     ```
   - Set:
     ```
     [Resolve]
     DNS=127.0.0.1
     FallbackDNS=8.8.8.8
     ```

7. **Apply Changes**
   ```bash
   sudo systemctl daemon-reload
   sudo systemctl restart systemd-resolved
   systemd-resolve --status
   ```

---

# 🧠 Quick Summary Table

| Check                  | Command                          |
|-------------------------|----------------------------------|
| DNS Resolution          | `dig internal.example.com`       |
| IP Reachability         | `ping <server-ip>`               |
| Port Reachability       | `telnet <server-ip> 5000`         |
| Service Listening       | `ss -tulnp`                      |
| Temporary DNS Bypass    | Edit `/etc/hosts`                |
| Permanent DNS Fix       | Edit `/etc/systemd/resolved.conf` |

---
![dns](https://github.com/user-attachments/assets/481f2747-a46d-4889-b34c-7e2c5fe2b557)
![image](https://github.com/user-attachments/assets/22b36cb2-91a5-478f-b882-088f2e5bfd32)
![s1](https://github.com/user-attachments/assets/22541bb8-ee3d-40ac-8768-079938e79f8e)
![ping ip](https://github.com/user-attachments/assets/8149cecb-61af-4e9e-b41b-aeaf22213196)
![check port](https://github.com/user-attachments/assets/77618b67-61e2-4b89-b8db-6726f6dc4fbe)
![check service](https://github.com/user-attachments/assets/0d5cd5e1-9a9b-4df1-9540-313c2325b6f9)
![s2](https://github.com/user-attachments/assets/d8b77b55-a08a-463e-b072-c2bb4c2fff88)
![s3](https://github.com/user-attachments/assets/03f7cd5e-f008-4161-9596-10024c245122)
![image](https://github.com/user-attachments/assets/97607a13-75e4-4a56-acd4-758369516868)
![bounus](https://github.com/user-attachments/assets/7e7ece9f-ced2-4ddb-b8e9-810add787902)
![b2](https://github.com/user-attachments/assets/ceb2542b-6cbf-4293-a6a0-56dfb3ea538d)










