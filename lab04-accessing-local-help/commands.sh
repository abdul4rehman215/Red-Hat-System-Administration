### 📂 Lab 04 – File 2 of 6

Here is the complete **`commands.sh`**

This includes **only the commands executed**, in clean sequential format.

---

```bash
#!/bin/bash
# ==========================================
# Lab 04 - Accessing Local Help and Documentation
# Commands Executed During Lab
# ==========================================

# ------------------------------
# Task 1: Using Manual Pages
# ------------------------------

man ls

man 5 passwd

sudo dnf install man-db -y


# ------------------------------
# Task 2: Using Info Pages
# ------------------------------

info coreutils


# ------------------------------
# Task 3: Using --help Flag
# ------------------------------

ls --help

podman --help

podman run --help


# ------------------------------
# Task 4: Exploring /usr/share/doc
# ------------------------------

ls /usr/share/doc | head

less /usr/share/doc/bash/README


# ------------------------------
# Task 5: Using whatis and apropos
# ------------------------------

whatis ls

whatis podman

apropos "list directory"

apropos container


# ------------------------------
# Task 6: Examining Package Information
# ------------------------------

sudo dnf list installed podman

sudo dnf info podman

sudo dnf changelog podman | head


# ------------------------------
# Final Skill Verification
# ------------------------------

apropos network

man ls

sudo rpm -qi podman | grep Install
```

---

### ✅ Next File

I will now provide:

📄 `output.txt`
(Complete command outputs, no truncation)

Proceed?
