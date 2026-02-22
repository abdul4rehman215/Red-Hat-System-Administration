
# 🛠 Troubleshooting Guide – Lab 04: Accessing Local Help and Documentation

---

# 🔎 1️⃣ `man` Command Not Found

## Problem

```bash
man: command not found
````

## Cause

The manual page database or `man-db` package is not installed.

## Solution

Install it using:

```bash
sudo dnf install man-db -y
```

Verify installation:

```bash
man ls
```

---

# 🔎 2️⃣ No Manual Entry Found

## Problem

```bash
No manual entry for podman
```

## Cause

* Man pages for the package are not installed
* The `man-db` index is outdated

## Solution

Update the man database:

```bash
sudo mandb
```

Check available sections:

```bash
man -k podman
```

---

# 🔎 3️⃣ `whatis` or `apropos` Returns Nothing

## Problem

```bash
whatis: nothing appropriate.
```

## Cause

The man page database index is not built.

## Solution

Rebuild the database:

```bash
sudo mandb
```

Then retry:

```bash
whatis ls
apropos network
```

---

# 🔎 4️⃣ `info` Command Not Installed

## Problem

```bash
info: command not found
```

## Cause

GNU info utility not installed.

## Solution

Install it:

```bash
sudo dnf install info -y
```

Verify:

```bash
info coreutils
```

---

# 🔎 5️⃣ Permission Denied Accessing `/usr/share/doc`

## Problem

```bash
less: /usr/share/doc/package: Permission denied
```

## Cause

Restricted permissions or SELinux context restrictions.

## Solution

Check permissions:

```bash
ls -ld /usr/share/doc
```

Check SELinux context:

```bash
ls -lZ /usr/share/doc
```

If necessary:

```bash
sudo less /usr/share/doc/bash/README
```

---

# 🔎 6️⃣ `dnf` Command Fails

## Problem

```bash
Error: Unable to find a match: podman
```

## Cause

* Incorrect package name
* Repository not enabled
* Subscription not attached (RHEL-specific)

## Solution

Check repositories:

```bash
sudo dnf repolist
```

Verify subscription:

```bash
sudo subscription-manager status
```

---

# 🔎 7️⃣ Podman Not Installed

## Problem

```bash
podman: command not found
```

## Solution

Install Podman:

```bash
sudo dnf install podman -y
```

Verify:

```bash
podman --version
```

---

# 🔎 8️⃣ `rpm -qi` Shows No Output

## Problem

```bash
package podman is not installed
```

## Cause

Package not installed or incorrect package name.

## Solution

Verify package name:

```bash
rpm -qa | grep podman
```

Install if missing:

```bash
sudo dnf install podman
```

---

# 🔎 9️⃣ Searching Within `man` Doesn’t Work

## Problem

User types `/keyword` but nothing happens.

## Cause

User may not press Enter after typing `/keyword`.

## Correct Usage

Inside man page:

```text
/keyword
(Press Enter)
```

Navigate results:

* `n` → next
* `N` → previous

---

# 🔎 🔟 Slow `dnf` Performance

## Problem

`dnf info` or `dnf list` runs slowly.

## Cause

Metadata refresh or repository latency.

## Solution

Refresh metadata manually:

```bash
sudo dnf clean all
sudo dnf makecache
```

---

# 📌 Best Practices Learned

✔ Always check manual documentation before searching online
✔ Rebuild man database if search tools fail
✔ Verify package installation before troubleshooting
✔ Understand subscription requirements in RHEL
✔ Use local documentation in restricted environments

---

# 💼 Professional Insight

System administrators are expected to:

* Troubleshoot without internet access
* Use local documentation effectively
* Verify software versions and updates
* Audit installed packages
* Understand documentation sections

Documentation literacy is a **core RHCSA competency**.

---
