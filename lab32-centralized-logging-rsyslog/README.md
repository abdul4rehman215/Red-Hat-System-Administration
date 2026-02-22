# 🧪 Lab 32: Centralized Logging with rsyslog

---

## 📌 Overview

This lab demonstrates how to configure **centralized logging using rsyslog** in a client-server architecture.

You will configure:

- 🖥️ A **log server** (192.168.1.100)
- 💻 A **client system** (192.168.1.101)

The client forwards logs to the central server over TCP/UDP port 514.

---

## 🎯 Learning Objectives

By completing this lab, I will be able to:

- Install and configure rsyslog
- Enable remote log reception (server)
- Configure client log forwarding
- Structure logs per host and program
- Analyze centralized logs
- Implement secure and filtered logging

---

## 🏗 Architecture

```
Client (192.168.1.101)
        |
        |  TCP/UDP 514
        v
Server (192.168.1.100)
        |
        v
/var/log/remotehost/<hostname>/<program>.log
```

---

## 📁 Repository Structure

```
lab32-rsyslog/
│
├── README.md
├── configs/
│   ├── server_rsyslog.conf
│   └── client_rsyslog.conf
│
├── commands.sh
├── output.txt
├── interview_qna.md
└── troubleshooting.md
```

---

## 🖥 Server Configuration Summary

- Enabled TCP/UDP input modules
- Configured template-based log storage
- Opened firewall ports 514
- Restarted and enabled rsyslog

Logs stored at:

```
/var/log/remotehost/<hostname>/<program>.log
```

---

## 💻 Client Configuration Summary

Forwarding rule added:

```
*.* @@192.168.1.100:514
```

- `@` → UDP
- `@@` → TCP (reliable)

---

## 🔎 Verification

Test message:

```bash
logger "Test message"
```

Server validation:

```bash
tail -f /var/log/remotehost/client.example.com/logger.log
```

---

## 🔐 Security Enhancements

- Forward specific log types only
- Enable TLS encryption
- Restrict firewall rules
- Configure log rotation for remote logs

---

## 🛡 Security Engineering Relevance

Centralized logging enables:

✔ Incident response  
✔ Forensic investigations  
✔ Security auditing  
✔ Compliance validation  
✔ SIEM integration  

---

## 🚀 Production Extensions

- Integrate with ELK Stack
- Enable TLS mutual authentication
- Configure log rotation
- Implement alerting pipeline

---
