# 🛠 Troubleshooting Guide – Lab 20: Collecting Diagnostic Data & Using Red Hat Insights

---

# 🔎 1️⃣ sosreport Fails to Run

## 🔹 Symptom
- Command exits with error
- Archive not created in /var/tmp
- Permission denied message

## 🔹 Checks

### Ensure package is installed
```bash
rpm -q sos
````

If missing:

```bash
sudo dnf install sos -y
```

---

### Ensure running as root

```bash
whoami
```

Must be `root` or use `sudo`.

---

### Check disk space

```bash
df -h /var/tmp
```

Low disk space can prevent archive creation.

---

# 🔎 2️⃣ sosreport Archive Too Large

## 🔹 Cause

Large logs or container data.

## 🔹 Solution

Limit plugins:

```bash
sudo sosreport --skip-plugins=podman
```

Or clean old logs before running.

---

# 🔎 3️⃣ insights-client Registration Fails

## 🔹 Symptom

* Registration error
* “System not subscribed” message

## 🔹 Step 1: Check Subscription

```bash
subscription-manager status
```

If not registered:

```bash
sudo subscription-manager register --username=<RH_USER> --password=<PASSWORD> --autoattach
```

---

## 🔹 Step 2: Verify Identity

```bash
subscription-manager identity
```

---

# 🔎 4️⃣ insights-client Upload Fails

## 🔹 Check Network Connectivity

```bash
curl -I https://cloud.redhat.com
```

Expected:

```
HTTP/2 200
```

---

## 🔹 Test Insights Connectivity

```bash
sudo insights-client --test-connection
```

---

## 🔹 Inspect Logs

```bash
journalctl -u insights-client --no-pager | tail -n 20
```

---

# 🔎 5️⃣ System Not Appearing in Insights Portal

## 🔹 Causes

* Registration incomplete
* Upload not performed
* Wrong Red Hat account
* Firewall blocking outbound traffic

## 🔹 Fix

```bash
sudo insights-client --register
sudo insights-client
```

Wait 2–5 minutes and refresh dashboard.

---

# 🔎 6️⃣ Compliance or Advisory Not Updating

## 🔹 Solution

Force new upload:

```bash
sudo insights-client
```

Verify cron job:

```bash
cat /etc/cron.d/insights
```

---

# 🔎 7️⃣ Cron Job Not Running

## 🔹 Check Cron Service

```bash
systemctl status crond
```

## 🔹 Inspect Logs

```bash
journalctl -u crond
```

---

# 🔎 8️⃣ Subscription Expired

## 🔹 Check Status

```bash
subscription-manager status
```

If expired:

* Renew subscription in Red Hat Portal
* Re-attach subscription

```bash
subscription-manager attach --auto
```

---

# 🧠 Enterprise Troubleshooting Workflow

1️⃣ Verify subscription
2️⃣ Confirm network connectivity
3️⃣ Check insights-client registration
4️⃣ Run manual upload
5️⃣ Review journal logs
6️⃣ Validate dashboard update

---

# ✅ Final Validation Checklist

✔ sosreport archive created successfully
✔ insights-client installed
✔ System registered
✔ Connectivity to cloud.redhat.com confirmed
✔ insights-client upload successful
✔ System visible in Insights dashboard
✔ Daily cron job configured

---

# 🚀 Why Proper Diagnostics Matter

* Reduces MTTR (Mean Time to Resolution)
* Enables proactive vulnerability detection
* Improves compliance posture
* Supports enterprise-scale fleet management
* Ensures production stability

---

# 🏁 Lab 20 Complete

The system is now:

* Diagnostics-ready
* Cloud-analyzed
* Proactively monitored
* Enterprise-supported

```
