# 🛠️ Troubleshooting Guide – Lab 01: Introduction to Red Hat Enterprise Linux (RHEL)

---

This document outlines common issues encountered during the lab along with diagnostic steps and resolutions.

---

## 🔹 Issue 1: `curl` Command Not Found

### ❗ Problem
Running:

```bash
curl -s https://opensource.org/osd | grep -A5 "Open Source Definition"
````

Returns:

```
bash: curl: command not found
```

### 🔍 Cause

The `curl` package is not installed on the system.

### ✅ Resolution

Install curl using:

```bash
sudo dnf install curl -y
```

After installation, verify:

```bash
curl --version
```

---

## 🔹 Issue 2: Incorrect Use of Placeholder Credentials

### ❗ Problem

Running:

```bash
sudo subscription-manager register --username <your_username> --password <your_password>
```

Returns:

```
bash: syntax error near unexpected token `newline'
```

### 🔍 Cause

The shell interprets `< >` as input/output redirection operators.
Placeholders were not replaced with actual credentials.

### ✅ Resolution

Replace placeholders with actual credentials (without `< >`):

```bash
sudo subscription-manager register --username REDACTED --password REDACTED
```

---

## 🔹 Issue 3: `subscription-manager` Command Not Found

### ❗ Problem

Running:

```bash
subscription-manager
```

Returns:

```
bash: subscription-manager: command not found
```

### 🔍 Cause

The `subscription-manager` package is not installed.

### ✅ Resolution

Install it using:

```bash
sudo dnf install subscription-manager -y
```

Verify installation:

```bash
subscription-manager --version
```

---

## 🔹 Issue 4: Subscription Attach Fails

### ❗ Problem

Running:

```bash
sudo subscription-manager attach --auto
```

Returns:

```
Unable to find available subscriptions for all your installed products.
```

### 🔍 Possible Causes

* System not registered properly
* No active subscription available
* Account not linked to Developer Subscription
* Network connectivity issue

### ✅ Resolution Steps

1. Verify registration status:

```bash
sudo subscription-manager status
```

2. List available subscriptions:

```bash
sudo subscription-manager list --available
```

3. Ensure internet connectivity:

```bash
ping subscription.rhsm.redhat.com
```

4. Confirm Developer Subscription is active in your Red Hat account portal.

---

## 🔹 Issue 5: SELinux Not Enforcing

### ❗ Problem

Running:

```bash
sestatus
```

Shows:

```
Current mode: permissive
```

### 🔍 Cause

SELinux is not set to enforcing mode.

### ✅ Resolution

Temporarily enable enforcing mode:

```bash
sudo setenforce 1
```

To permanently enforce:

Edit the configuration file:

```bash
sudo nano /etc/selinux/config
```

Ensure:

```
SELINUX=enforcing
```

Reboot system:

```bash
sudo reboot
```

---

## 🔹 Issue 6: Unable to Access Repositories After Registration

### ❗ Problem

DNF fails to fetch packages after subscription registration.

### 🔍 Cause

Repositories may not be enabled.

### ✅ Resolution

Check repository list:

```bash
sudo subscription-manager repos --list
```

Enable required repository:

```bash
sudo subscription-manager repos --enable=rhel-9-baseos-rpms
```

Verify:

```bash
sudo dnf repolist
```

---

# 🧠 Diagnostic Commands Used During Lab

```bash
uname -r
cat /etc/os-release
sestatus
subscription-manager status
subscription-manager list --consumed
dnf repolist
```

---

# 📌 Best Practices Learned

* Always verify package installation before running commands.
* Replace placeholders properly in CLI commands.
* Confirm SELinux mode in enterprise environments.
* Verify subscription status before performing system updates.
* Ensure repositories are enabled after subscription attachment.

---

# 🏁 Summary

All identified issues were resolved using proper system administration practices.
This lab reinforces:

✔ Package management troubleshooting
✔ Subscription management diagnostics
✔ SELinux configuration verification
✔ Enterprise Linux system validation

---
