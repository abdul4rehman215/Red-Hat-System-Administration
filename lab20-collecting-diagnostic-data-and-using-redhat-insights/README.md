# 🧪 Lab 20: Collecting Diagnostic Data and Using Red Hat Insights

---

## 🎯 Objectives

By completing this lab, I was able to:

* Install and generate system diagnostics using **sosreport**
* Install and register the **insights-client**
* Upload system metadata to Red Hat Insights
* Analyze advisory and compliance data
* Configure automated Insights reporting

---

## 🧰 Lab Environment

* Red Hat Enterprise Linux 9.3 (Plow)
* Hostname: `mylabhost`
* Active Red Hat subscription
* Internet connectivity enabled
* Registered with Red Hat Customer Portal

---

## Repository Structure

lab20-collecting-diagnostic-data-and-using-redhat-insights/
│
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md
│
└── artifacts/
    └── sosreport-mylabhost-YYYY-MM-DD-xxxxx.tar.xz (generated example)

---

## 🗂 Lab Overview

This lab focuses on **enterprise diagnostics and proactive monitoring** using Red Hat tools.

---

### 1️⃣ Installing and Running sosreport

* Installed the `sos` package
* Generated a full system diagnostic archive using:

```id="s4h29k"
sudo sosreport --batch --name=$(hostname)
```

* Verified archive creation in:

```
/var/tmp/
```

Example output file:

```
/var/tmp/sosreport-mylabhost-2026-02-22-xxxxx.tar.xz
```

✔ Diagnostic archive successfully generated and ready for support submission.

---

### 2️⃣ Installing and Registering insights-client

* Installed `insights-client`
* Registered system to Red Hat Insights:

```id="m9tk31"
sudo insights-client --register
```

✔ System successfully registered with Red Hat Insights.

---

### 3️⃣ Uploading System Data

Performed initial upload:

```id="xq8n74"
sudo insights-client
```

✔ Upload completed successfully
✔ System visible in Insights dashboard

Verified connectivity:

```id="f82kd1"
sudo insights-client --test-connection
```

---

### 4️⃣ Reviewing Red Hat Insights Portal

Accessed:

```
https://cloud.redhat.com/insights
```

Under **Systems → Inventory**, verified:

* ✔ System listed and reporting
* ✔ Valid subscription attached
* ✔ Advisory information displayed
* ✔ Compliance status visible
* ✔ Performance metrics available

---

### 5️⃣ Automating Insights Reporting

Configured daily upload using cron:

```id="c71ks9"
0 0 * * * root /usr/bin/insights-client
```

✔ Automated reporting enabled
✔ Continuous proactive monitoring configured

---

## 🔐 Key Concepts Learned

* Reactive diagnostics using sosreport
* Proactive risk detection using Insights
* Subscription validation and connectivity checks
* Cloud-based system analytics
* Automated reporting through cron scheduling
* Enterprise vulnerability and compliance monitoring

---

## 🎉 Conclusion

In this lab, I successfully:

✔ Generated a full system diagnostic archive
✔ Installed and registered insights-client
✔ Uploaded system metadata to Red Hat cloud
✔ Verified subscription and network connectivity
✔ Reviewed advisories and compliance data
✔ Configured automated daily Insights uploads

The system is now:

* Registered
* Reporting
* Continuously analyzed
* Proactively protected

---

## 🚀 Why This Lab Matters

Red Hat Insights enables:

* Proactive vulnerability detection
* Configuration drift monitoring
* Security advisory tracking
* Compliance auditing
* Predictive maintenance
* Fleet-wide risk visibility

This is critical for:

* Enterprise RHEL environments
* Cloud-native infrastructure
* OpenShift clusters
* Production-grade deployments
* Large-scale server fleets

---

This lab completes the enterprise lifecycle:

🔍 Diagnose → 📤 Report → ☁ Analyze → 🛡 Protect

---
