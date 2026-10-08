# Bash Scripting

A collection of Bash scripts written as part of my DevOps learning. Each script automates a small, practical task and covers a core scripting skill: user input, arithmetic, conditionals, file operations, permissions, and error handling.

## Contents

| Script | Description |
|---|---|
| `01_calculator.sh` | Basic arithmetic calculator |
| `02_file_operations.sh` | Directory and file creation |
| `03_file_checker.sh` | File existence and permission checker |
| `04_backup.sh` | Timestamped backup of `.txt` files |
| `bonus_system_monitor.sh` | System monitoring script with log output |

## Scripts Overview

### 1. Arithmetic Calculator (`01_calculator.sh`)
Prompts for two numbers and displays the result of addition, subtraction, multiplication, and division. Division by zero is handled with a clear error message instead of crashing.

```bash
./01_calculator.sh
```

### 2. File Operations (`02_file_operations.sh`)
Creates a directory called `bash_demo`, moves into it, creates `demo.txt` containing the current date, and prints the file's contents.

```bash
./02_file_operations.sh
```

### 3. File Checker with Permissions (`03_file_checker.sh`)
Prompts for a filename, checks whether it exists, and reports whether it is readable, writable, and executable.

```bash
./03_file_checker.sh
```

### 4. Backup Script (`04_backup.sh`)
Prompts for a source directory, creates a backup directory with a timestamp in its name (e.g. `backup_2024-11-29_14-30`), copies all `.txt` files into it, and displays how many files were backed up.

```bash
./04_backup.sh
```

### Bonus: System Monitor (`bonus_system_monitor.sh`)
Displays current CPU usage, memory usage (total, used, free), disk usage, and the top 5 processes by memory. Output is saved to a timestamped log file.

```bash
./bonus_system_monitor.sh
```

## Setup

Make the scripts executable before running them:

```bash
chmod +x *.sh
```

## Key Learnings

<!-- Edit these to reflect what you actually learned. Keep 3-5. -->

- **Quoting variables matters.** Using `"$var"` instead of `$var` prevents breakage when values contain spaces or are empty.
- **Validate input before acting on it.** Checking that a file or directory exists (`-f`, `-d`) before using it avoids errors further down the script.
- **Test operators are powerful.** Flags like `-r`, `-w`, and `-x` make permission checks simple and readable.
- **Exit codes communicate success or failure.** Using `exit 0` and `exit 1` makes scripts behave properly when chained together or used in pipelines.
- **`date` formatting enables useful automation.** Timestamps such as `$(date +%Y-%m-%d_%H-%M)` make backups unique and easy to sort.

## Challenge Overcome

<!-- Replace this with a real problem you hit. Suggested structure below. -->

**Problem:** _Describe what went wrong (e.g. the backup script failed when the source directory didn't exist)._

**Cause:** _What was actually causing it._

**Solution:** _What you changed to fix it, and what you'd do differently next time._

## Why Bash Matters in DevOps

Bash is the glue of infrastructure work. It is used to automate repetitive tasks, run commands inside CI/CD pipelines, set up servers, schedule backups, and monitor systems. Tools like Docker, Kubernetes, and AWS all rely on shell scripting at some level, from container entrypoints to deployment scripts. Being comfortable with Bash means being able to automate tasks reliably rather than repeating them by hand.
