# 🛠️ Troubleshooting Guide – Lab 02: Logging into RHEL and Using the Shell

---

> This document outlines common issues encountered during console login, SSH access, basic shell usage, and prompt customization.

---

# 🔹 Issue 1: Login Incorrect (Local Console)

## ❗ Problem

After entering username and password:

```

Login incorrect

````

## 🔍 Possible Causes

- Incorrect password
- Caps Lock enabled
- Incorrect username
- Keyboard layout mismatch
- Account locked

## ✅ Resolution

1. Verify Caps Lock is off.
2. Carefully retype username and password.
3. Confirm correct username exists:

```bash
cat /etc/passwd | grep student
````

4. If necessary, reset password (requires root access):

```bash
sudo passwd student
```

---

# 🔹 Issue 2: SSH Service Not Running

## ❗ Problem

Running:

```bash
sudo systemctl status sshd
```

Shows:

```
Active: inactive (dead)
```

## 🔍 Cause

The SSH daemon (`sshd`) is not running.

## ✅ Resolution

Start the service:

```bash
sudo systemctl start sshd
```

Enable it at boot:

```bash
sudo systemctl enable sshd
```

Verify:

```bash
sudo systemctl status sshd
```

---

# 🔹 Issue 3: SSH Connection Refused

## ❗ Problem

Attempting to connect remotely:

```
ssh: connect to host 10.0.2.15 port 22: Connection refused
```

## 🔍 Possible Causes

* SSH service not running
* Firewall blocking port 22
* Incorrect IP address

## ✅ Resolution

### Step 1: Verify SSH service

```bash
sudo systemctl status sshd
```

### Step 2: Check firewall rules

```bash
sudo firewall-cmd --list-all
```

Ensure `ssh` is listed under services.

If not, allow it:

```bash
sudo firewall-cmd --add-service=ssh --permanent
sudo firewall-cmd --reload
```

### Step 3: Confirm IP address

```bash
ip a
```

---

# 🔹 Issue 4: Host Key Verification Failed

## ❗ Problem

```
WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!
```

## 🔍 Cause

* Server SSH key changed
* IP reused by another machine
* Potential security risk

## ✅ Resolution

Remove old key:

```bash
ssh-keygen -R 10.0.2.15
```

Reconnect:

```bash
ssh student@10.0.2.15
```

Verify fingerprint before accepting.

---

# 🔹 Issue 5: Cannot Ping Remote System

## ❗ Problem

```
0 packets received
```

## 🔍 Possible Causes

* Network connectivity issue
* Firewall blocking ICMP
* Wrong IP address
* Different subnet

## ✅ Resolution

1. Verify network interface:

```bash
ip a
```

2. Check routing table:

```bash
ip route
```

3. Confirm firewall ICMP settings:

```bash
sudo firewall-cmd --list-all
```

4. Verify both systems are on same network/subnet.

---

# 🔹 Issue 6: `man` Command Not Working

## ❗ Problem

```
man: command not found
```

## 🔍 Cause

Manual pages package not installed.

## ✅ Resolution

Install man-db:

```bash
sudo dnf install man-db -y
```

---

# 🔹 Issue 7: PS1 Changes Not Persistent

## ❗ Problem

After restarting terminal, custom prompt disappears.

## 🔍 Cause

PS1 was changed temporarily but not exported in `.bashrc`.

## ✅ Resolution

Edit `.bashrc`:

```bash
nano ~/.bashrc
```

Add:

```bash
export PS1="[\u@\h \W \t]\$ "
```

Reload configuration:

```bash
source ~/.bashrc
```

---

# 🔹 Issue 8: Permission Denied When Editing `.bashrc`

## ❗ Problem

```
Permission denied
```

## 🔍 Cause

Attempting to edit another user’s file without privileges.

## ✅ Resolution

Ensure editing your own file:

```bash
nano ~/.bashrc
```

If editing another user’s file:

```bash
sudo nano /home/username/.bashrc
```

---

# 🔹 Diagnostic Commands Used

```bash
systemctl status sshd
ip a
firewall-cmd --list-all
ping -c 3 <IP>
cat /etc/passwd
ssh-keygen -R <IP>
```

---

# 📌 Best Practices Learned

✔ Always verify SSH service status before remote login
✔ Confirm firewall rules when troubleshooting connectivity
✔ Validate correct IP address
✔ Persist shell changes in `.bashrc`
✔ Use `man` pages to understand command options

---

# 🏁 Summary

All common login, SSH, and shell customization issues were diagnosed and resolved using standard RHEL administrative procedures.

This lab strengthens:

* Remote administration troubleshooting
* Service management skills
* Network connectivity diagnostics
* Shell environment configuration
* RHCSA foundational competencies

---
