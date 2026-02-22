# 🎤 Interview Q&A – Lab 20: Collecting Diagnostics & Using Red Hat Insights

---

# 🔹 Section 1: Enterprise Diagnostics Questions

---

### 1️⃣ What is sosreport?

`sosreport` is a diagnostic tool used in RHEL to:

- Collect system logs
- Capture hardware details
- Gather configuration files
- Extract kernel and package information
- Provide support-ready archives

It is commonly required when opening a Red Hat support case.

---

### 2️⃣ Where is sosreport stored?

By default:

```

/var/tmp/

```

Example:

```

/var/tmp/sosreport-mylabhost-2026-02-22-hfskd93.tar.xz

````

---

### 3️⃣ Why should sosreport be generated before opening a support case?

Because it:

- Reduces troubleshooting time
- Provides full system context
- Prevents back-and-forth support emails
- Helps engineers reproduce the issue

---

### 4️⃣ Is sosreport safe to share?

Yes, but:

- It may contain sensitive configuration data
- Should only be shared with trusted support channels
- Can be reviewed before submission

---

# 🔹 Section 2: Red Hat Insights Questions

---

### 5️⃣ What is Red Hat Insights?

Red Hat Insights is:

- A cloud-based analytics platform
- Proactively analyzes RHEL systems
- Identifies security, configuration, and performance risks
- Provides remediation recommendations

---

### 6️⃣ How does insights-client work?

Steps:

1. Register system
2. Collect system metadata
3. Upload to Red Hat cloud
4. Cloud engine analyzes data
5. Dashboard displays recommendations

---

### 7️⃣ How do you register a system with Insights?

```bash
sudo insights-client --register
````

---

### 8️⃣ How do you verify connectivity?

```bash
sudo insights-client --test-connection
```

---

### 9️⃣ What kind of issues does Insights detect?

* Security advisories
* CVEs
* Misconfigurations
* Kernel vulnerabilities
* Compliance violations
* Configuration drift
* Performance anomalies

---

# 🔹 Section 3: Scenario-Based Questions

---

### 🔟 Scenario: insights-client upload fails.

Checklist:

1. Verify subscription:

   ```bash
   subscription-manager status
   ```
2. Check connectivity:

   ```bash
   curl -I https://cloud.redhat.com
   ```
3. Test connection:

   ```bash
   insights-client --test-connection
   ```
4. Inspect logs:

   ```bash
   journalctl -u insights-client
   ```

---

### 1️⃣1️⃣ Scenario: System not appearing in Insights dashboard.

Possible causes:

* Registration not completed
* Upload not executed
* Firewall blocking outbound traffic
* Wrong Red Hat account used

Fix:

```bash
sudo insights-client --register
sudo insights-client
```

---

### 1️⃣2️⃣ Scenario: Compliance shows non-compliant.

Steps:

1. Review recommendation details
2. Apply remediation steps
3. Run:

   ```bash
   insights-client
   ```
4. Verify updated compliance status

---

# 🔹 Section 4: Automation & Enterprise Operations

---

### 1️⃣3️⃣ Why schedule automatic uploads?

To ensure:

* Continuous monitoring
* Updated advisory detection
* Compliance reporting
* Zero manual intervention

Cron example:

```bash
0 0 * * * root /usr/bin/insights-client
```

---

### 1️⃣4️⃣ How is Insights different from sosreport?

| sosreport             | Insights                       |
| --------------------- | ------------------------------ |
| Reactive              | Proactive                      |
| Manual collection     | Automated                      |
| Used for support case | Used for continuous monitoring |
| Snapshot of system    | Ongoing analysis               |

---

### 1️⃣5️⃣ Why is proactive monitoring important?

Because it:

* Detects vulnerabilities before exploitation
* Reduces downtime
* Improves patch planning
* Strengthens security posture

---

# 🔹 Section 5: Advanced Enterprise Questions

---

### 1️⃣6️⃣ How would you deploy Insights across 1000 servers?

* Automate via Ansible
* Use subscription-manager for bulk registration
* Enable insights-client via automation
* Schedule centralized reporting
* Integrate with compliance dashboards

---

### 1️⃣7️⃣ What security concerns exist with Insights?

* Data transmitted externally
* Must ensure TLS connectivity
* Only metadata uploaded (not full file systems)
* Requires valid subscription

---

# ✅ Interview Readiness Checklist

✔ Explain sosreport purpose
✔ Know archive location
✔ Register insights-client
✔ Verify subscription & connectivity
✔ Explain proactive monitoring
✔ Compare reactive vs proactive support
✔ Discuss automation strategy
✔ Understand enterprise security implications

---
