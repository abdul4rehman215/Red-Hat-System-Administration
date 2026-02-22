# 🛠 Troubleshooting Guide – Lab 32: rsyslog Centralized Logging

---

# 1️⃣ Client Logs Not Appearing on Server

## 🔎 Problem
Client sends logs but no directory is created on server.

## ✅ Checklist

### 1. Verify Server is Listening

```bash
sudo ss -tulnp | grep 514
```

Expected:
```
udp   UNCONN 0 0 *:514
tcp   LISTEN 0 100 *:514
```

If not listening:
```bash
sudo systemctl restart rsyslog
```

---

### 2. Check Firewall Rules (Server)

```bash
sudo firewall-cmd --list-ports
```

Ensure:
```
514/tcp
514/udp
```

If missing:
```bash
sudo firewall-cmd --add-port=514/tcp --permanent
sudo firewall-cmd --add-port=514/udp --permanent
sudo firewall-cmd --reload
```

---

### 3. Confirm Client Forwarding Rule

```bash
sudo tail -n 10 /etc/rsyslog.conf
```

Should contain:

```
*.* @@192.168.1.100:514
```

Restart:

```bash
sudo systemctl restart rsyslog
```

---

# 2️⃣ SELinux Blocking Logs

## 🔎 Problem
Everything configured correctly but logs still not arriving.

## 🔍 Test

Temporarily disable SELinux:

```bash
sudo setenforce 0
```

If it works afterward, SELinux policy adjustment is required.

Check status:

```bash
getenforce
```

---

# 3️⃣ Connection Refused Error

## 🔎 Problem
Client cannot connect to server port 514.

## 🔍 Test Connectivity

```bash
telnet 192.168.1.100 514
```

If connection fails:

- Firewall issue
- Network routing problem
- rsyslog not listening

---

# 4️⃣ Logs Duplicated on Server

## 🔎 Problem
Logs appear both in default location and custom template directory.

## 🔍 Cause
Missing discard rule.

Ensure server config includes:

```
& ~
```

This stops further processing.

---

# 5️⃣ High Log Volume Causing Disk Growth

## 🔎 Problem
/var/log/remotehost grows too quickly.

## ✅ Solutions

1️⃣ Enable log rotation  
2️⃣ Reduce forwarded log types  
3️⃣ Enable compression  
4️⃣ Use rate limiting  

Example:

```
$SystemLogRateLimitInterval 5
$SystemLogRateLimitBurst 200
```

---

# 6️⃣ Logs Lost During Network Outage

## 🔎 Problem
Client logs disappear when network is unstable.

## ✅ Enable Queueing on Client

Add:

```
$ActionQueueType LinkedList
$ActionQueueFileName rsyslog_forward_queue
$ActionResumeRetryCount -1
$ActionQueueSaveOnShutdown on
```

Prevents log loss.

---

# 7️⃣ Server Directory Not Created

## 🔎 Problem
No `/var/log/remotehost/<hostname>` directory created.

## 🔍 Check Template Syntax

```bash
sudo grep template /etc/rsyslog.conf
```

Correct format:

```
$template RemoteLogs,"/var/log/remotehost/%HOSTNAME%/%PROGRAMNAME%.log"
```

Ensure directory exists:

```bash
sudo mkdir -p /var/log/remotehost
```

---

# 8️⃣ rsyslog Service Fails to Start

## 🔎 Diagnose

```bash
sudo systemctl status rsyslog
sudo journalctl -xe
```

Look for:
- Syntax errors
- Missing modules
- Incorrect quotation marks

---

# 9️⃣ Performance Optimization Tips

For large environments:

✔ Use TCP instead of UDP  
✔ Enable disk-assisted queues  
✔ Separate logs by facility  
✔ Integrate with ELK  
✔ Monitor disk usage regularly  

---

# 🔟 Production Hardening Checklist

✔ Restrict firewall to known client IPs  
✔ Use TLS encryption (rsyslog-gnutls)  
✔ Configure logrotate for /var/log/remotehost  
✔ Enable rate limiting  
✔ Monitor log ingestion metrics  

---

# 🛡 Security Perspective

Centralized logging improves:

- Incident response speed
- Attack visibility
- Brute-force detection
- Privilege escalation monitoring
- Compliance readiness

But misconfiguration can:

- Expose logs to network attackers
- Allow log injection
- Cause disk exhaustion

Always secure log channels.

---
