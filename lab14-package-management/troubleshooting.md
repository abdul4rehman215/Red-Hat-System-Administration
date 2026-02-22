# 🛠 Troubleshooting Guide - Lab 14: Installing and Updating Software Packages (RHEL 9)

# 🔎 Common Issues & Solutions

---

## 1️⃣ System Not Registered

### ❌ Error:
```bash
This system is not registered with an entitlement server.
````

### 🔍 Cause:

System not registered with Red Hat Subscription Manager.

### ✅ Solution:

```bash
sudo subscription-manager register --username=<username> --password=<password> --autoattach
```

Verify:

```bash
sudo subscription-manager status
```

---

## 2️⃣ Repository Not Found

### ❌ Error:

```bash
Error: No matching repo to modify: codeready-builder-for-rhel-9-rpms
```

### 🔍 Cause:

Incorrect repository name or subscription not attached.

### ✅ Solution:

List available repositories:

```bash
sudo dnf repolist all
```

Check subscription:

```bash
sudo subscription-manager list --available
```

Attach subscription:

```bash
sudo subscription-manager attach --auto
```

---

## 3️⃣ Dependency Errors During Install

### ❌ Error:

```bash
Error: Problem: conflicting requests
```

### 🔍 Cause:

Broken dependency or disabled repo.

### ✅ Solution:

```bash
sudo dnf clean all
sudo dnf makecache
sudo dnf update
```

Check unsatisfied dependencies:

```bash
sudo dnf repoquery --unsatisfied
```

---

## 4️⃣ Module Conflict Error

### ❌ Error:

```bash
Problems in request:
module nodejs:20 conflicts with nodejs:18
```

### 🔍 Cause:

Multiple streams enabled.

### ✅ Solution:

Reset module:

```bash
sudo dnf module reset nodejs
```

Enable correct stream:

```bash
sudo dnf module enable nodejs:18
```

---

## 5️⃣ DNF Transaction Failure

### ❌ Error:

Transaction failed after download.

### 🔍 Cause:

Corrupted metadata or incomplete transaction.

### ✅ Solution:

Clean cache:

```bash
sudo dnf clean all
```

Rebuild cache:

```bash
sudo dnf makecache
```

Retry installation.

---

## 6️⃣ RPM Database Issues

### ❌ Error:

```bash
rpmdb: BDB0113 Thread/process error
```

### 🔍 Cause:

Corrupted RPM database.

### ✅ Solution:

```bash
sudo rm -f /var/lib/rpm/__db*
sudo rpm --rebuilddb
```

Then verify:

```bash
sudo dnf check
```

---

## 7️⃣ Unable to Remove Package

### ❌ Error:

Package is required by another package.

### 🔍 Cause:

Dependency relationship.

### ✅ Solution:

Check dependencies:

```bash
sudo dnf repoquery --whatrequires <package>
```

Remove dependent package first.

---

# 🔐 Enterprise Best Practices

* Always test updates in staging first
* Use version pinning in production
* Schedule patch windows
* Monitor DNF history
* Maintain repository governance
* Automate updates using Ansible or Satellite
* Avoid mixing third-party repositories blindly

---

# 🧹 Recovery & Rollback

View transaction history:

```bash
sudo dnf history
```

Undo transaction:

```bash
sudo dnf history undo <ID>
```

Rollback entire transaction:

```bash
sudo dnf history rollback <ID>
```

---

# ✅ Verification Checklist

✔ Subscription active
✔ Correct repositories enabled
✔ Packages installed successfully
✔ No broken dependencies
✔ Modules configured properly
✔ System updated
✔ No RPM database errors

---
