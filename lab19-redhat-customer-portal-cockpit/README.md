# 🧪 Lab 19: Using Red Hat Customer Portal and Cockpit

---

## 🎯 Objectives

By completing this lab, I was able to:

* Navigate the **Red Hat Customer Portal**
* Access Knowledgebase articles and documentation
* Open and manage Red Hat support cases
* Install and configure **Cockpit**
* Secure Cockpit using firewall rules
* Explore Cockpit dashboard and log management

---

## 🧰 Lab Environment

* Red Hat Enterprise Linux 9.3 (Plow)
* Hostname: `mylabhost`
* IP Address: `10.0.2.15`
* Active subscription attached
* Internet connectivity available

---

## Repository Structure

lab-19-customer-portal-cockpit/
│
├── README.md              
├── commands.sh            
├── output.txt           
├── interview_qna.md       
└── troubleshooting.md    

--

## 🗂 Lab Overview

This lab is divided into four major sections:

### 1️⃣ Red Hat Customer Portal Access

* Logged into [https://access.redhat.com](https://access.redhat.com)
* Verified active subscription
* Accessed Knowledgebase articles
* Confirmed documentation and product visibility

### 2️⃣ Opening a Support Case

* Navigated to **Support → Open a Case**
* Selected:

  * Product: RHEL 9.3
  * Problem Type: Technical
* Submitted case regarding Cockpit issue
* Case number generated (example: `03281456`)
* Confirmation email received

### 3️⃣ Installing and Configuring Cockpit

* Installed:

  * `cockpit`
  * `cockpit-podman`
* Enabled and started `cockpit.socket`
* Verified service listening on port **9090**
* Configured firewall to allow Cockpit service
* Confirmed socket activation and HTTPS response

### 4️⃣ Exploring Cockpit Dashboard

Accessed via:

```
https://10.0.2.15:9090
```

Explored:

* ✅ System Overview (CPU, memory, uptime)
* ✅ Logs (journal-backed filtering by service/severity)
* ✅ Networking (interface, routes, DNS)
* ✅ Podman containers (via cockpit-podman)

Verified logs via CLI:

```
journalctl -u cockpit
```

---

## 🔐 Key Concepts Learned

* Enterprise support workflow with Red Hat
* Proper support case creation methodology
* Cockpit socket activation model
* Web-based Linux administration
* Firewall and port validation
* Journal integration with Cockpit

---

## 🎉 Conclusion

In this lab, I successfully:

✔ Accessed Red Hat Customer Portal
✔ Verified subscription status
✔ Opened and documented a support case
✔ Installed and configured Cockpit
✔ Enabled firewall access for port 9090
✔ Accessed Cockpit dashboard securely
✔ Reviewed logs through both GUI and CLI
✔ Verified Cockpit functionality using curl

This lab connects **enterprise vendor support processes** with **modern Linux system administration via Cockpit**.

---

## 🚀 Why This Lab Matters

Enterprise Linux administrators must:

* Interact with vendor support effectively
* Collect and provide accurate diagnostic data
* Securely expose administrative services
* Use both CLI and web-based tools
* Validate service availability and logs

Cockpit simplifies system management while maintaining enterprise-grade control and security.
