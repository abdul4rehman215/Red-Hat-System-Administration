# 🛠 Troubleshooting Guide – Lab 35: Kernel Tuning with sysctl

> Kernel tuning directly impacts system stability. Misconfiguration can cause performance degradation or service disruption.  
> This guide covers common issues and safe recovery strategies.

---

# 1️⃣ Parameter Not Found

## ❌ Error:
```
sysctl: cannot stat /proc/sys/net/ipv4/tcp_xyz: No such file or directory
```

## 🔎 Cause:
The running kernel does not support the parameter.

## ✅ Fix:
Verify available parameters:
```bash
sysctl -a | grep tcp
```

Check kernel version:
```bash
uname -r
```

Some parameters are version-specific.

---

# 2️⃣ Changes Not Persisting After Reboot

## ❌ Problem:
Parameter resets to default after reboot.

## 🔎 Cause:
Only used:
```bash
sysctl -w parameter=value
```

## ✅ Fix:
Add to:
```
/etc/sysctl.conf
```
or (recommended):
```
/etc/sysctl.d/99-custom.conf
```

Then apply:
```bash
sudo sysctl --system
```

---

# 3️⃣ Syntax Error in Config File

## ❌ Error:
```
sysctl: error: invalid argument
```

## 🔎 Cause:
Incorrect syntax (missing space or invalid format).

## ✅ Correct Format:
```
parameter = value
```

Example:
```
vm.swappiness = 10
```

Reload after correction:
```bash
sudo sysctl -p
```

---

# 4️⃣ System Instability After Tuning

## ❌ Symptoms:
- Services crashing
- Network drops
- Memory spikes
- Slow response times

## 🚨 Immediate Recovery:

Temporarily reset parameter:
```bash
sudo sysctl -w parameter=default_value
```

Or reload defaults:
```bash
sudo sysctl --system
```

If system is unstable:
1. Boot into recovery mode
2. Remove custom config file:
   ```bash
   sudo rm /etc/sysctl.d/99-custom.conf
   ```
3. Reboot

---

# 5️⃣ Excessive Swapping

## 🔎 Detect:
```bash
vmstat 2
```

Look for:
- High `si` (swap in)
- High `so` (swap out)

## ✅ Fix:
Lower swappiness:
```bash
sudo sysctl -w vm.swappiness=10
```

But also verify:
- Available RAM
- Memory leaks
- Overcommit settings

Kernel tuning should not mask poor capacity planning.

---

# 6️⃣ File Descriptor Exhaustion

## ❌ Error:
```
Too many open files
```

## 🔎 Check:
```bash
cat /proc/sys/fs/file-max
```

Current usage:
```bash
cat /proc/sys/fs/file-nr
```

## ✅ Fix:
Increase limit:
```bash
sudo sysctl -w fs.file-max=2097152
```

Also update user limits:
```
/etc/security/limits.conf
```

---

# 7️⃣ Network Connection Drops Under Load

## 🔎 Diagnose:
```bash
netstat -s | grep -i drop
ss -s
```

## Possible Causes:
- Low backlog (somaxconn)
- Low SYN backlog
- Firewall rate limiting
- TCP timeout misconfiguration

## ✅ Fix:
Increase backlog:
```bash
sudo sysctl -w net.core.somaxconn=1024
```

Monitor before persisting.

---

# 8️⃣ Permission Denied Errors

## ❌ Error:
```
permission denied on key 'vm.swappiness'
```

## ✅ Fix:
Use sudo:
```bash
sudo sysctl -w vm.swappiness=10
```

Kernel parameters require root privileges.

---

# 9️⃣ Conflicting Configurations

Sometimes multiple config files override values.

## 🔎 Check Load Order:
```bash
sudo sysctl --system
```

It shows which files are applied.

Order:
1. `/usr/lib/sysctl.d/`
2. `/etc/sysctl.d/`
3. `/etc/sysctl.conf`

Later files override earlier ones.

---

# 🔟 Want to Restore Defaults

## Option 1 – Remove Custom File:
```bash
sudo rm /etc/sysctl.d/99-custom.conf
sudo sysctl --system
```

## Option 2 – Reset Specific Parameter:
```bash
sudo sysctl -w vm.swappiness=60
```

---

# 🧠 Production Best Practices

✔ Never tune blindly  
✔ Always test runtime before persisting  
✔ Monitor system metrics  
✔ Document changes  
✔ Keep rollback plan ready  
✔ Avoid copying internet configs blindly  

---

# 📊 Recommended Monitoring Commands

```bash
vmstat 2
dstat
htop
ss -s
netstat -s
free -h
```

---

# 🚀 Real Infrastructure Insight

Kernel tuning should be:

- Evidence-driven
- Load-tested
- Capacity-aware
- Documented

Bad tuning can cause more damage than no tuning.

In enterprise systems:
- Use staging environments
- Validate under load
- Apply via configuration management tools (Ansible, Puppet)

---
