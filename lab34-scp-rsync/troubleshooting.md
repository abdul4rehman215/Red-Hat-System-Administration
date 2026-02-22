# 🛠 Troubleshooting Guide – Lab 34: scp & rsync

This guide covers common real-world issues encountered when transferring files using **scp** and **rsync**, along with practical fixes.

---

# 1️⃣ SSH Connection Issues

## ❌ Error:
```
ssh: connect to host 192.168.56.20 port 22: Connection refused
```

## ✅ Fix:
- Verify SSH service:
```bash
sudo systemctl status ssh
```
- Start service if stopped:
```bash
sudo systemctl start ssh
```
- Check firewall:
```bash
sudo ufw status
```

---

# 2️⃣ Permission Denied (Publickey)

## ❌ Error:
```
Permission denied (publickey).
```

## ✅ Fix:
- Verify SSH key exists:
```bash
ls ~/.ssh/id_rsa.pub
```
- Copy key to remote:
```bash
ssh-copy-id student@192.168.56.20
```
- Ensure correct file permissions:
```bash
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
```

---

# 3️⃣ Permission Denied (File Write)

## ❌ Error:
```
scp: /home/student/: Permission denied
```

## ✅ Fix:
- Ensure correct target directory
- Verify ownership:
```bash
ls -ld /home/student
```
- Avoid copying into restricted paths like `/root` without sudo

---

# 4️⃣ rsync Not Installed on Remote

## ❌ Error:
```
rsync: command not found
```

## ✅ Fix:
Install rsync on remote:
```bash
sudo apt install rsync -y
```

---

# 5️⃣ Wrong rsync Path Behavior (Trailing Slash Issue)

## ❌ Problem:
Unexpected nested directory created.

## Cause:
Missing trailing slash.

## Example:
```
rsync local_dir remote:/backup
```
Creates:
```
/backup/local_dir/
```

## Correct:
```
rsync local_dir/ remote:/backup/
```
Copies contents only.

---

# 6️⃣ Data Deleted Unexpectedly with --delete

## ❌ Problem:
Files removed on destination unexpectedly.

## Cause:
Used:
```bash
rsync -av --delete source/ dest/
```

## ✅ Prevention:
- Always test with:
```bash
rsync -av --delete --dry-run source/ dest/
```
- Confirm source path before running.

---

# 7️⃣ Slow Transfer Speed

## Possible Causes:
- No compression
- Network latency
- Large files
- Disk I/O bottleneck

## ✅ Fix:
Enable compression:
```bash
rsync -avz ...
```

Check bandwidth usage:
```bash
iftop
```

---

# 8️⃣ Interrupted Transfers

## ❌ Issue:
Network drops mid-transfer.

## ✅ Solution:
Use:
```bash
rsync --partial --progress ...
```
This resumes instead of restarting.

---

# 9️⃣ Host Key Verification Failed

## ❌ Error:
```
WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!
```

## ✅ Fix:
Remove old key:
```bash
ssh-keygen -R 192.168.56.20
```

Then reconnect.

---

# 🔟 File Ownership & Permission Not Preserved

## ❌ Problem:
Files copied but permissions incorrect.

## ✅ Fix:
Use archive mode:
```bash
rsync -a ...
```

Archive mode preserves:
- permissions
- timestamps
- symlinks
- ownership (if run as root)

---

# 1️⃣1️⃣ Large Dataset Best Practices

For production-grade backups:

```bash
rsync -avz --delete --numeric-ids --progress \
--exclude="/proc" --exclude="/sys" \
-e ssh /data/ backup@server:/backup/data/
```

---

# 🧠 Production Safety Checklist

Before running rsync in production:

☐ Confirm source path  
☐ Confirm destination path  
☐ Use `--dry-run` first  
☐ Ensure adequate disk space  
☐ Verify SSH connectivity  
☐ Confirm no trailing slash mistakes  
☐ Test on small dataset first  

---

# 🔒 Security Best Practices

- Use SSH key authentication
- Disable password login in production
- Restrict SSH by IP (firewall rules)
- Use non-root user accounts
- Enable logging:
```bash
rsync -avz ... | tee transfer.log
```

---

# 📌 Quick Diagnostic Commands

```bash
ssh -v user@host
rsync -avz --dry-run source/ dest/
df -h
du -sh *
ss -tulnp
journalctl -u ssh
```

---

# ✅ Summary

Common problems fall into 4 categories:
- SSH connectivity
- Permissions
- Path errors
- Misuse of rsync options

Understanding these avoids **data loss**, **downtime**, and **backup corruption** in production environments.

---

# 🚀 Professional Insight

In real infrastructure:
- `scp` = quick manual transfer
- `rsync` = backup + deployment tool
- Automation = cron + rsync + logging

This knowledge is critical for:
- DevOps roles
- Site Reliability Engineering
- Cloud Infrastructure
- Security Operations
