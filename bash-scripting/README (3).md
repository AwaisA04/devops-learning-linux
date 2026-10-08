# Bash Scripting

A collection of Bash scripts written as part of my DevOps learning. Each script automates a small, practical task and covers a core scripting skill: user input, arithmetic, conditionals, file operations, permissions, and error handling.

## Contents

| Script | Description |
|---|---|
| `01_calculator.sh` | Basic arithmetic calculator |
| `02_file_operations.sh` | Directory and file creation |
| `03_file_checker.sh` | File existence and permission checker |
| `04_backup.sh` | Timestamped backup of `.txt` files |

## Scripts Overview

### 1. Arithmetic Calculator (`01_calculator.sh`)
A Bash script that prompts the user for two numbers and calculates their sum, difference, product, and quotient, displaying all four results on one line. Handles division by zero with an error message instead of crashing, and supports being run either interactively (via prompts) or with the numbers passed directly as command-line arguments.

### 2. File Operations (`02_file_operations.sh`)
This script automates basic directory and file handling in Bash. It creates a directory called bash_demo (using mkdir -p so it can safely be run more than once), moves into it, and creates a file named demo.txt. It then writes a line of text to the file that includes the current date, generated at runtime with date and command substitution. Finally, it prints confirmation messages and displays the file’s contents with cat.

### 3. File Checker with Permissions (`03_file_checker.sh`)
A function that prompts for a filename, checks whether the file exists, and if it does, tests it with -r, -w and -x. It prints a ✓ or ✗ message for each of readable, writable and executable. If the file doesn’t exist, it says so and exits.

### 4. Backup Script (`04_backup.sh`)
A function that prompts for a source directory and exits with a message if it doesn’t exist. Otherwise it creates a timestamped backup folder (backup_YYYY-MM-DD_HH-MM) with mkdir -p, then loops over every .txt file in the source directory and copies each one in. A counter tracks how many files were copied, and a single summary line prints the total at the end. A -f check inside the loop keeps the count at 0 when there are no .txt files.

Both scripts follow the same pattern: wrap the logic in a function, read user input, validate it, then do the work and report the result. The main bash skills they cover are read, test flags (-f, -d, -r, -w, -x), if/else, for loops with globs, counters, date formatting, and mkdir -p.

## Key Learnings

<!-- Edit these to reflect what you actually learned. Keep 3-5. -->

- **Quoting variables matters.** Using `"$var"` instead of `$var` prevents breakage when values contain spaces or are empty.
- **Validate input before acting on it.** Checking that a file or directory exists (`-f`, `-d`) before using it avoids errors further down the script.
- **Test operators are powerful.** Flags like `-r`, `-w`, and `-x` make permission checks simple and readable.
- **Parameter uses are important** Knowing when to use positional parameters are important as well as using the `-read` parameter, both have their own use cases allowing user input to be dynamic. `-read` is useful when you want the script to stop and wait for input, positional paratmeters like `$1` are useful when you want the script to run with the input all in one go
- **`date` formatting enables useful automation.** Timestamps such as `$(date +%Y-%m-%d_%H-%M)` make backups unique and easy to sort.

## Challenge Overcome


**Problem:**  The for loop in the backup script copied every .txt file on every iteration instead of copying one file per pass. The counter and the summary message also behaved wrongly because of how the loop was structured.

**Cause:** I didn’t yet understand how the loop variable works. I wrote for file in "$directory"/*.txt, but then used the glob again inside the loop (cp $directory/*.txt $Backup_directory), so file was never used. Each pass re-ran a copy of the whole set. I also placed the “Backup complete!” message inside the loop, so it printed once per file instead of once at the end.

**Solution:** Changed the copy command to use the loop variable: cp "$file" "$backup_directory", so each iteration copies only the current file. Moved the “Backup complete!” line after done, so it prints once with the final count. Added if [ -f "$file" ] inside the loop so an empty folder (where the glob stays as the literal text *.txt) doesn’t inflate the count. Quoted variables and used mkdir -p.

## Why Bash Matters in DevOps

Bash is the glue of infrastructure work. It is used to automate repetitive tasks, run commands inside CI/CD pipelines, set up servers, schedule backups, and monitor systems. Tools like Docker, Kubernetes, and AWS all rely on shell scripting at some level, from container entrypoints to deployment scripts. Being comfortable with Bash means being able to automate tasks reliably rather than repeating them by hand.
