# 🎤 Interview Q&A – Lab 04: Accessing Local Help and Documentation

---

## 1️⃣ What is the difference between `man` and `info`?

**Answer:**

- `man` provides traditional Unix-style manual pages organized by sections.
- `info` provides GNU-style hierarchical documentation with links and structured navigation.

`man` is more commonly used for quick reference, while `info` is often more detailed for GNU utilities.

---

## 2️⃣ What are manual page sections in Linux?

**Answer:**

Manual pages are divided into numbered sections:

| Section | Description |
|----------|-------------|
| 1 | User commands |
| 2 | System calls |
| 3 | Library functions |
| 4 | Special files |
| 5 | File formats |
| 8 | System administration commands |

Example:

```bash
man 5 passwd
````

This opens documentation for the `/etc/passwd` file format (section 5).

---

## 3️⃣ How do you search inside a man page?

**Answer:**

Inside a man page:

* `/keyword` → Search forward
* `n` → Next match
* `N` → Previous match
* `q` → Quit

Example:

```
/color
```

---

## 4️⃣ When would you use `--help` instead of `man`?

**Answer:**

`--help` is useful for:

* Quick syntax reference
* Seeing commonly used options
* Checking available flags without opening full documentation

Example:

```bash
ls --help
```

---

## 5️⃣ What is `/usr/share/doc` used for?

**Answer:**

It stores documentation installed with packages, such as:

* README files
* Examples
* License information
* Changelogs

Example:

```bash
less /usr/share/doc/bash/README
```

---

## 6️⃣ What does the `whatis` command do?

**Answer:**

`whatis` provides a short one-line description of a command from the manual database.

Example:

```bash
whatis ls
```

Output:

```
ls (1) - list directory contents
```

---

## 7️⃣ What is the purpose of `apropos`?

**Answer:**

`apropos` searches manual page descriptions for a keyword.

Example:

```bash
apropos container
```

It helps discover commands when you don’t know the exact name.

---

## 8️⃣ How can you check if a package is installed in RHEL?

**Answer:**

Using `dnf`:

```bash
sudo dnf list installed podman
```

Or using `rpm`:

```bash
rpm -q podman
```

---

## 9️⃣ How do you view detailed information about a package?

**Answer:**

Using:

```bash
sudo dnf info podman
```

This displays:

* Version
* Architecture
* Repository
* Summary
* License
* Description

---

## 🔟 How do you check when a package was installed?

**Answer:**

Using:

```bash
sudo rpm -qi podman
```

Example output:

```
Install Date: Thu 22 Feb 2026 09:58:41 AM UTC
```

---

## 1️⃣1️⃣ Why is local documentation important in enterprise environments?

**Answer:**

* Internet access may be restricted
* Production systems may not allow external browsing
* Faster troubleshooting
* Security compliance environments require offline documentation

---

## 1️⃣2️⃣ How can you find commands related to networking?

**Answer:**

Using:

```bash
apropos network
```

This may return commands such as:

* `nmcli`
* `ip`
* `ss`

---

## 1️⃣3️⃣ What is the benefit of using `dnf changelog`?

**Answer:**

It allows administrators to:

* Review recent updates
* Check security fixes
* Audit changes before deploying updates
* Understand version history

Example:

```bash
sudo dnf changelog podman
```

---

# ✅ Interview Readiness Summary

This lab demonstrates strong documentation literacy — a critical skill for:

* RHCSA certification
* Linux system administration
* DevOps engineering
* Cloud operations
* Security auditing

Knowing how to find answers locally is a core professional Linux competency.
