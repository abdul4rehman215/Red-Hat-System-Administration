# 🎤 Interview Q&A - Lab 14: Installing and Updating Software Packages (RHEL 9)

---

# 🔹 Basic Level

---

## 1️⃣ What is DNF?

**Answer:**

DNF (Dandified YUM) is the package manager used in RHEL 8/9.

It is responsible for:

- Installing packages
- Removing packages
- Updating packages
- Resolving dependencies
- Managing repositories
- Working with modules and groups

DNF replaced YUM and offers better performance and dependency resolution.

---

## 2️⃣ How do you check if a package is installed?

```bash
rpm -q httpd
````

or

```bash
dnf list installed httpd
```

---

## 3️⃣ What is the difference between `dnf install` and `rpm -i`?

| dnf                                 | rpm                           |
| ----------------------------------- | ----------------------------- |
| Resolves dependencies automatically | Does NOT resolve dependencies |
| Uses repositories                   | Installs local RPM file       |
| Enterprise safe                     | Low-level package install     |

DNF is preferred in production environments.

---

# 🔹 Intermediate Level

---

## 4️⃣ What is RHSM?

**Answer:**

RHSM (Red Hat Subscription Manager) manages:

* System registration
* Subscription attachment
* Repository access
* Entitlement compliance

Without RHSM, official RHEL repositories cannot be accessed.

---

## 5️⃣ What are repositories?

Repositories are locations that store RPM packages.

Common RHEL 9 repos:

* BaseOS
* AppStream
* CodeReady Builder

You can list them using:

```bash
dnf repolist all
```

---

## 6️⃣ What are DNF modules?

Modules allow multiple versions of software to coexist.

Example:

```bash
dnf module list nodejs
```

You can enable a specific stream:

```bash
dnf module enable nodejs:18
```

This ensures version control in enterprise systems.

---

# 🔹 Advanced Level

---

## 7️⃣ What is a package group?

A package group is a collection of related packages installed together.

Example:

```bash
dnf group install "Development Tools"
```

This installs GCC, Make, Debuggers, etc.

---

## 8️⃣ How do you view DNF transaction history?

```bash
dnf history
```

To undo:

```bash
dnf history undo <ID>
```

This is useful for rollback in production systems.

---

## 9️⃣ What happens during `dnf update`?

* Checks repositories
* Compares installed versions
* Resolves dependencies
* Downloads updated RPMs
* Applies updates safely

---

# 🔹 Scenario-Based Questions

---

## 🔟 A repository is disabled. How do you enable it?

```bash
dnf config-manager --enable <repo_name>
```

---

## 1️⃣1️⃣ How would you troubleshoot dependency conflicts?

Steps:

1. Check error message
2. Run:

```bash
dnf clean all
dnf makecache
```

3. Verify repositories
4. Check module conflicts
5. Use:

```bash
dnf repoquery --unsatisfied
```

---

## 1️⃣2️⃣ Why are modules important in enterprise Linux?

Because:

* Applications depend on specific versions
* Prevents accidental upgrades
* Ensures compatibility
* Supports long-term support streams

---

# 🔐 Real-World Relevance

Package management impacts:

* Security patching cycles
* CI/CD pipelines
* Container builds
* Compliance audits
* Production uptime

Incorrect repository configuration can break entire systems.

---

# ✅ Summary Knowledge Check

✔ Understand DNF vs RPM
✔ Know repository management
✔ Understand RHSM
✔ Know how modules work
✔ Can perform rollback
✔ Understand enterprise patching workflow

---
