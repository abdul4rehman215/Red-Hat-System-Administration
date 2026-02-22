# 🛠 Troubleshooting Guide – Lab 19: Red Hat Customer Portal & Cockpit Diagnostics

---

# 🔎 1️⃣ Cannot Access Red Hat Customer Portal

## 🔹 Symptom
- Login fails
- Knowledgebase inaccessible
- “Subscription required” message appears

## 🔹 Checks

### Verify Subscription Status
```bash
sudo subscription-manager status
````

### Verify System Registration

```bash
sudo subscription-manager identity
```

If not registered:

```bash
sudo subscription-manager register --username=<RH_USERNAME> --password=<PASSWORD> --autoattach
```

---

# 🔎 2️⃣ Support Case Creation Fails

## 🔹 Common Causes

* Expired subscription
* Incorrect product selection
* Missing required fields
* Browser session timeout

## 🔹 Best Practice Before Opening Case

Collect:

```bash
sudo sosreport
```

Attach:

* sosreport archive
* journal logs
* Exact reproduction steps
* Screenshots (if GUI issue)

---

# 🔎 3️⃣ Cockpit Not Accessible via Browser

## 🔹 Step 1: Check Socket Status

```bash
systemctl status cockpit.socket
```

If inactive:

```bash
sudo systemctl enable --now cockpit.socket
```

---

## 🔹 Step 2: Check Listening Port

```bash
ss -tulnp | grep 9090
```

Expected:

```
LISTEN 0 4096 0.0.0.0:9090
```

---

## 🔹 Step 3: Check Firewall

```bash
firewall-cmd --list-services
```

If cockpit missing:

```bash
sudo firewall-cmd --add-service=cockpit --permanent
sudo firewall-cmd --reload
```

---

## 🔹 Step 4: Test Locally

```bash
curl -kI https://localhost:9090
```

Expected:

```
HTTP/1.1 200 OK
```

---

# 🔎 4️⃣ Cockpit Login Fails

## 🔹 Check User Account

```bash
id username
```

## 🔹 Check Account Lock

```bash
sudo faillog -u username
```

## 🔹 Inspect Cockpit Logs

```bash
journalctl -u cockpit --no-pager | tail -n 20
```

---

# 🔎 5️⃣ Cockpit Service Crashes

## 🔹 Restart Service

```bash
sudo systemctl restart cockpit.socket
```

## 🔹 View Detailed Logs

```bash
journalctl -xe -u cockpit
```

---

# 🔎 6️⃣ SELinux Blocking Cockpit

## 🔹 Check AVC Denials

```bash
sudo ausearch -m avc -ts recent
```

## 🔹 Temporary Test

```bash
sudo setenforce 0
```

If issue resolves → SELinux policy issue.

Re-enable:

```bash
sudo setenforce 1
```

---

# 🔎 7️⃣ Cloud Environment Access Issue

If hosted on cloud VM:

Check:

* Security Groups (AWS/Azure/GCP)
* Inbound rule allowing TCP 9090
* Correct public/private IP

---

# 🔎 8️⃣ TLS Certificate Warning in Browser

Cockpit uses self-signed certificate by default.

Production Fix:

* Install trusted TLS certificate
* Configure via:
  `/etc/cockpit/ws-certs.d/`

Restart:

```bash
sudo systemctl restart cockpit.socket
```

---

# 🔎 9️⃣ Performance Issues in Cockpit

Check system load:

```bash
uptime
top
```

Check memory:

```bash
free -h
```

Check disk:

```bash
df -h
```

Cockpit reflects actual system state — not separate metrics.

---

# 🧠 Enterprise Troubleshooting Flow

1️⃣ Verify service status
2️⃣ Check port listening
3️⃣ Validate firewall rules
4️⃣ Confirm SELinux policy
5️⃣ Inspect journal logs
6️⃣ Test local connectivity
7️⃣ Check cloud-level security rules

---

# ✅ Final Validation Checklist

✔ cockpit.socket enabled
✔ Port 9090 listening
✔ Firewall allows cockpit
✔ HTTPS returns 200 OK
✔ User authentication successful
✔ No recent AVC denials
✔ Subscription active

---

# 🚀 Why Proper Troubleshooting Matters

* Prevents unnecessary service reinstallation
* Avoids disabling SELinux or firewall incorrectly
* Ensures enterprise-grade security posture
* Reduces downtime in production environments

---
