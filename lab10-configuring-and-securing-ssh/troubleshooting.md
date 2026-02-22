# 🛠 Troubleshooting Guide - Lab 19: Configuring and Securing SSH

---

# 🔍 Issue 1: SSH Service Fails to Restart After Config Changes

### ❌ Error
```
Job for sshd.service failed because the control process exited with error code.
```

### ✅ Diagnosis
Check detailed logs:
```bash
sudo journalctl -xe
```

Or:
```bash
sudo journalctl -u sshd
``` 

### 🔎 Common Causes
- Syntax error in `/etc/ssh/sshd_config`
- Invalid directive
- Port already in use

### ✅ Validate Config Before Restart
```bash id="q3zv1k"
sudo sshd -t
````

If no output → configuration is valid.

---

# 🔍 Issue 2: Locked Out After Changing Port

### ❌ Problem

SSH inaccessible after changing from port 22 to 2222.

### 🔎 Cause

Firewall not updated.

### ✅ Fix

From local console:

```bash id="c8n2fj"
sudo firewall-cmd --permanent --add-port=2222/tcp
sudo firewall-cmd --reload
```

---

# 🔍 Issue 3: Permission Denied (Publickey)

### ❌ Error

`
Permission denied (publickey).
`

### 🔎 Causes
- Incorrect permissions on `.ssh` directory
- Wrong ownership
- Public key not copied correctly

### ✅ Fix Permissions
```bash 
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
chown -R student:student ~/.ssh
````

---

# 🔍 Issue 4: Root Login Still Allowed

### 🔎 Check

```bash 
grep PermitRootLogin /etc/ssh/sshd_config
```

### ✅ Ensure Correct Setting

```bash
PermitRootLogin no
```

Restart service:

```bash
sudo systemctl restart sshd
```

---

# 🔍 Issue 5: SSH Listening on Wrong Port

### 🔎 Verify

```bash
ss -tulnp | grep ssh
```

### 🔎 If Still on Port 22

* Ensure `Port 2222` is not commented
* Check for duplicate `Port` entries
* Restart sshd

---

# 🔍 Issue 6: SSH Connection Timeout

### 🔎 Test Network

```bash
ping server-ip
```

### 🔎 Check Port Connectivity

```bash
nc -zv server-ip 2222
```

Or:

```bash
telnet server-ip 2222
```

---

# 🔍 Issue 7: Firewall Blocking SSH

### 🔎 Check Active Ports

```bash 
sudo firewall-cmd --list-ports
```

### 🔎 Check SSH Service Rule

```bash 
sudo firewall-cmd --list-services
```

---

# 🔍 Issue 8: SSH Service Masked

### ❌ Error

````
Unit sshd.service is masked.
``` 

### ✅ Unmask Service
```bash id="y5c7rm"
sudo systemctl unmask sshd
sudo systemctl start sshd
````

---

# 🔍 Issue 9: Unable to Login After Disabling Password Authentication

### 🔎 Cause

Key not configured before disabling passwords.

### ✅ Emergency Fix (Console Access Required)

Edit:

```bash 
sudo nano /etc/ssh/sshd_config
```

Temporarily set:

```bash 
PasswordAuthentication yes
```

Restart:

```bash 
sudo systemctl restart sshd
```

---

# 🔍 Issue 10: SELinux Blocking SSH Port Change

### ❌ Error

Port changed but connection refused.

### 🔎 Check SELinux Policy

```bash 
sudo semanage port -l | grep ssh
```

### ✅ Add New SSH Port to SELinux

```bash 
sudo semanage port -a -t ssh_port_t -p tcp 2222
```

---

# 🔍 Issue 11: Duplicate Port Entries in sshd_config

If both exist:

```
Port 22
Port 2222
```

SSH will listen on both.

### ✅ Remove unwanted entry and restart.

---

# 🔐 Security Best Practices

- Always test new SSH config in separate session
- Never close current session until verified
- Validate config with `sshd -t`
- Keep console access available during testing
- Use strong passphrases for private keys
- Restrict SSH via firewall and AllowUsers

---

# ✅ Lab 10 Completed Successfully

✔ Installed and verified SSH server  
✔ Hardened SSH configuration  
✔ Implemented key-based authentication  
✔ Restricted root and password login  
✔ Configured firewall rules  
✔ Verified secure remote access  
✔ Troubleshot common SSH issues  

SSH is now securely configured.
