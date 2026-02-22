# 🎤 Interview Q&A – Lab 34: File Transfer with scp and rsync

---

## 1) What is `scp` and when would you use it?
**Answer:** `scp` (secure copy) transfers files over SSH. I use it for **simple one-time secure transfers**, like copying a config file or artifact to a server quickly.

---

## 2) What is `rsync` and why is it preferred for backups?
**Answer:** `rsync` is a synchronization tool that transfers only **differences (delta changes)**. It’s preferred for backups because it’s **incremental, efficient, and supports resume**.

---

## 3) What is the main difference between `scp` and `rsync`?
**Answer:** `scp` copies everything each time, while `rsync` copies **only changed blocks/files**, making it much faster for repeated transfers.

---

## 4) How does `rsync` securely transfer data to a remote system?
**Answer:** By using SSH as the transport with:
```bash
rsync -e ssh ...
```
This encrypts the data in transit like any SSH session.

---

## 5) What does `rsync -avz` mean?
**Answer:**
- `-a` = archive mode (preserves permissions, timestamps, symlinks)
- `-v` = verbose output
- `-z` = compress during transfer

---

## 6) Why is trailing slash important in `rsync` paths?
**Answer:**  
`rsync source_dir/ dest/` syncs **contents** of the directory.  
`rsync source_dir dest/` syncs the **directory itself** into destination.

---

## 7) How do you copy a directory recursively using `scp`?
**Answer:**
```bash
scp -r local_dir user@host:/path/
```
`-r` enables recursive directory transfer.

---

## 8) How can you verify a transferred file without logging into the remote system interactively?
**Answer:** Use SSH remote commands:
```bash
ssh user@host "cat /path/file"
```
or
```bash
ssh user@host "ls -l /path/"
```

---

## 9) What does `--delete` do in `rsync`, and why can it be dangerous?
**Answer:** `--delete` removes destination files that no longer exist in source. It’s dangerous if you accidentally sync the wrong source path because it can delete valid data on destination.

---

## 10) How do you test rsync safely before actually syncing?
**Answer:** Use dry run:
```bash
rsync -av --dry-run source/ dest/
```
This shows what would change without modifying anything.

---

## 11) How can you resume an interrupted rsync transfer?
**Answer:** Use:
```bash
rsync --partial --progress ...
```
`--partial` keeps partially transferred files so the transfer can continue.

---

## 12) How do you limit transfer speed in rsync?
**Answer:**
```bash
rsync --bwlimit=100 ...
```
This limits bandwidth (KB/s) to avoid saturating network links.

---

## 13) What does `scp` use under the hood for security?
**Answer:** It uses SSH for encryption and authentication, including key-based auth if configured.

---

## 14) In production, when would you choose `rsync` over `scp`?
**Answer:** For:
- backups
- deployments where only updates should ship
- syncing logs or data directories repeatedly
- large datasets
Because rsync minimizes transfer size and time.

---

## 15) Give a real-world scenario where rsync is critical.
**Answer:**  
A server generates logs and artifacts daily. I’d use rsync with SSH to sync only new logs to a central backup server efficiently, and optionally with `--delete` + rotation logic to manage storage.

---

# ✅ Quick Command Cheat Sheet

## scp
```bash
scp file.txt user@host:/path/
scp -r dir/ user@host:/path/
```

## rsync
```bash
rsync -avz dir/ user@host:/path/
rsync -av --delete dir/ backup/
rsync -avz --partial --progress -e ssh file user@host:/path/
rsync -avz --bwlimit=100 -e ssh dir/ user@host:/path/
```
