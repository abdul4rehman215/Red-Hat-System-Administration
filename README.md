# 🐧 Red Hat System Administration – Enterprise Linux Engineering Portfolio

> **Enterprise Linux Operations • Infrastructure Hardening • Automation Engineering**

### 40 Hands-On Enterprise Linux Labs  
### Real-world RHEL administration, automation, logging, hardening, performance tuning, and infrastructure operations.

---

<div align="center">

<!-- ====================== PLATFORM & STACK ====================== -->

![RHEL](https://img.shields.io/badge/OS%20%7C%20Red%20Hat-Enterprise%20Linux%208%20%7C%209-EE0000?style=for-the-badge&logo=redhat&logoColor=EE0000)
![Linux](https://img.shields.io/badge/Linux-System%20Administration-black?style=for-the-badge&logo=linux)
![Bash](https://img.shields.io/badge/Bash-Scripting-4EAA25?style=for-the-badge&logo=gnubash)
![Systemd](https://img.shields.io/badge/systemd-Service%20Management-2C3E50?style=for-the-badge)
![SELinux](https://img.shields.io/badge/SELinux-MAC%20Security-5C2D91?style=for-the-badge)

<!-- ====================== SPECIALIZATION ====================== -->

![Focus](https://img.shields.io/badge/Focus-Enterprise%20Linux%20Operations-darkred?style=for-the-badge)
![Hardening](https://img.shields.io/badge/System-Hardening-critical?style=for-the-badge)
![Logging](https://img.shields.io/badge/Logging-%20Observability-blue?style=for-the-badge)
![Automation](https://img.shields.io/badge/Automation-Scheduling%20%26%20Timers-success?style=for-the-badge)
![Storage](https://img.shields.io/badge/Storage-LVM%20%26%20NFS-orange?style=for-the-badge)

<!-- ====================== SCOPE ====================== -->

![Labs](https://img.shields.io/badge/Labs-40%20Hands--On-brightgreen?style=for-the-badge)
![Level](https://img.shields.io/badge/Level-Intermediate%20→%20Advanced-blueviolet?style=for-the-badge)
![Execution](https://img.shields.io/badge/Execution-Command%20Verified-success?style=for-the-badge)

<!-- ================= REPO METADATA ================= -->

![Repo Size](https://img.shields.io/github/repo-size/abdul4rehman215/Red-Hat-System-Administration?style=for-the-badge)
![Stars](https://img.shields.io/github/stars/abdul4rehman215/Red-Hat-System-Administration?style=for-the-badge)
![Forks](https://img.shields.io/github/forks/abdul4rehman215/Red-Hat-System-Administration?style=for-the-badge)
![Last Commit](https://img.shields.io/github/last-commit/abdul4rehman215/Red-Hat-System-Administration?style=for-the-badge)

</div>

---

# 🎯 Executive Summary

This repository showcases a **40-lab, execution-driven Red Hat Enterprise Linux engineering portfolio** designed to simulate real enterprise system administration and infrastructure operations.

It demonstrates hands-on capability across:

- ✅ Enterprise RHEL 9.x administration  
- ✅ Identity & access lifecycle management  
- ✅ Service control & dependency management (systemd)  
- ✅ Centralized logging & operational observability  
- ✅ Network configuration & validation (nmcli, firewall)  
- ✅ Storage engineering (LVM lifecycle + persistent mounts)  
- ✅ Network file services (NFS/CIFS with secure configurations)  
- ✅ SELinux enforcement, AVC analysis & policy remediation  
- ✅ Automation & scheduling (cron, at, systemd timers)  
- ✅ Kernel & performance tuning (CPU, I/O, sysctl)  
- ✅ Enterprise diagnostics (sosreport) & proactive support (Red Hat Insights)  

This is **not theoretical coursework**.

Each lab contains:

- Executed command transcripts  
- Verified system outputs  
- Real configuration changes (`/etc/fstab`, systemd units, SELinux contexts, firewall rules)  
- Troubleshooting documentation  
- Interview-ready technical explanations  

The portfolio reflects **production-style Linux administration workflows** aligned with enterprise operations and infrastructure engineering roles.

---

# 📌 About This Repository

This repository is a structured **enterprise Linux administration program** simulating real-world RHEL operational environments.

The progression moves from:

> Linux Foundations → Access Control → Service Operations → Logging & Observability → Storage Engineering → Automation & Scheduling → Performance Tuning → Enterprise Hardening

All labs are executed in controlled lab environments (RHEL 9.x, Ubuntu, CentOS) using real enterprise tooling.

## 🏗 What This Program Simulates

- Enterprise server provisioning & configuration
- Secure SSH deployment & firewall validation
- Service lifecycle management via systemd
- Log investigation & retention policy engineering
- Centralized log forwarding (rsyslog)
- Storage provisioning & LVM expansion
- NFS infrastructure deployment
- SELinux denial investigation & policy fixes
- Kernel parameter tuning & runtime validation
- Scheduled automation workflows
- Enterprise diagnostic data collection

## 🔬 Execution Model

Every lab is:

- Command-driven (CLI-first)
- Output-verified
- Troubleshooting-documented
- Structured for reproducibility
- Designed with operational realism

This portfolio reflects **practical Linux engineering capability**, not isolated commands — covering configuration, security, monitoring, automation, and recovery workflows across a full enterprise lifecycle.

---

# 📚 Labs Index (1–40)

> Click any lab title to navigate directly to its folder.

---

## 🗂 Lab Categories Overview

# 🧱 SECTION 1: RHEL Administration & Enterprise Operations (Labs 1–20)

<div align="left">

![Category](https://img.shields.io/badge/Category-RHEL%20Administration-EE0000?style=for-the-badge&logo=redhat)
![Track](https://img.shields.io/badge/Track-Enterprise%20Linux%20Operations-111111?style=for-the-badge&logo=linux)
![Outcome](https://img.shields.io/badge/Outcome-Admin%20Ready-success?style=for-the-badge)
![Focus](https://img.shields.io/badge/Focus-SELinux%20Fundamentals-5C2D91?style=for-the-badge)
![Scope](https://img.shields.io/badge/Scope-Services%20%7C%20Logs%20%7C%20Storage-0B3D91?style=for-the-badge)
![Focus](https://img.shields.io/badge/Focus-Enterprise%20Diagnostics-708090?style=for-the-badge)

</div>

## 🔹 Foundations (Labs 1–5)

<div align="left">

![Subsection](https://img.shields.io/badge/Subsection-Linux%20Foundations-333333?style=for-the-badge)
![Theme](https://img.shields.io/badge/Theme-CLI%20%26%20Documentation-111111?style=for-the-badge&logo=gnubash)
![Focus](https://img.shields.io/badge/Focus-Help%20Systems-444444?style=for-the-badge)
![Focus](https://img.shields.io/badge/Focus-Text%20Editing%20%26%20Processing-4EAA25?style=for-the-badge&logo=gnubash)

</div>

| Lab | Title | Focus Area |
|-----|-------|------------|
| 01 | [Introduction to RHEL](lab01-introduction-to-red-hat-enterprise-linux) | Linux fundamentals + subscription model |
| 02 | [Logging into RHEL & Shell Basics](lab02-logging-into-rhel-and-using-the-shell) | Local/SSH login + PS1 customization |
| 03 | [File & Directory Management](lab03-managing-files-and-directories-via-cli) | Metadata, redirection, lifecycle |
| 04 | [Accessing Local Help](lab04-accessing-local-help) | man, info, apropos mastery |
| 05 | [Editing Text Files](lab05-editing-text-files-in-rhel) | vim, nano, sed, awk |

## 🔹 Identity & Access Control (Labs 6–7)

<div align="left">

![Subsection](https://img.shields.io/badge/Subsection-Identity%20&%20Access%20Control-333333?style=for-the-badge)
![Theme](https://img.shields.io/badge/Theme-IAM%20Lifecycle-6A5ACD?style=for-the-badge)
![Theme](https://img.shields.io/badge/Theme-Permissions%20Governance-6A5ACD?style=for-the-badge)

</div>

| Lab | Title | Focus Area |
|-----|-------|------------|
| 06 | [Managing Users & Groups](lab06-managing-users-groups) | user lifecycle + password aging |
| 07 | [Permissions & Ownership](lab07-file-permissions-ownership) | chmod, special bits, SELinux intro |

## 🔹 Processes, Services & Logs (Labs 8–11)

<div align="left">

![Subsection](https://img.shields.io/badge/Subsection-Processes%20%7C%20Services%20%7C%20Logs-333333?style=for-the-badge)
![Theme](https://img.shields.io/badge/Theme-systemd%20Operations-0B3D91?style=for-the-badge)
![Focus](https://img.shields.io/badge/Focus-Process%20Control-0B3D91?style=for-the-badge)
![Theme](https://img.shields.io/badge/Theme-Log%20Troubleshooting-0B3D91?style=for-the-badge)
![Theme](https://img.shields.io/badge/Theme-Remote%20Access%20Hardening-DC143C?style=for-the-badge)

</div>

| Lab | Title | Focus Area |
|-----|-------|------------|
| 08 | [Process Monitoring](lab08-monitoring-managing-processes) | ps, top, htop, signals |
| 09 | [systemd Management](lab09-managing-services-systemd) | service lifecycle + journald |
| 10 | [SSH Hardening](lab10-configuring-and-securing-ssh) | Key auth + firewall validation |
| 11 | [Log Analysis](lab11-analyzing-and-storing-logs) | journalctl, grep parsing, logrotate |

## 🔹 Networking & Cloud Concepts (Labs 12–13)

<div align="left">

![Subsection](https://img.shields.io/badge/Subsection-Networking%20%26%20Cloud-333333?style=for-the-badge)
![Theme](https://img.shields.io/badge/Theme-Network%20Validation-1E90FF?style=for-the-badge)
![Theme](https://img.shields.io/badge/Theme-Cloud%20Resource%20Governance-8A2BE2?style=for-the-badge)

</div>

| Lab | Title | Focus Area |
|-----|-------|------------|
| 12 | [Network Configuration](lab12-configuration-network-interface) | nmcli static IP/DNS |
| 13 | [Multi-Tenant Resource Allocation](lab13-multi-tenant-resource-allocation) | OpenStack projects + quotas |

## 🔹 Packages & Storage (Labs 14–16)

<div align="left">

![Subsection](https://img.shields.io/badge/Subsection-Packages%20%26%20Storage-333333?style=for-the-badge)
![Theme](https://img.shields.io/badge/Theme-Repo%20%26%20Patch%20Ops-2E8B57?style=for-the-badge)
![Theme](https://img.shields.io/badge/Theme-Storage%20Engineering-FF8C00?style=for-the-badge)
![Theme](https://img.shields.io/badge/Theme-Network%20Storage-FF8C00?style=for-the-badge)

</div>

| Lab | Title | Focus Area |
|-----|-------|------------|
| 14 | [Package Management](lab14-package-management) | RHSM + dnf repo control |
| 15 | [Filesystem & LVM](lab15-filesystem-management) | Mounts, fstab, resize |
| 16 | [Network Filesystems](lab16-network-filesystems) | NFS + CIFS persistent mounts |

## 🔹 Performance, Security & Enterprise Tooling (Labs 17–20)

<div align="left">

![Subsection](https://img.shields.io/badge/Subsection-Enterprise%20Readiness-333333?style=for-the-badge)
![Theme](https://img.shields.io/badge/Theme-Performance%20Ops-228B22?style=for-the-badge)
![Theme](https://img.shields.io/badge/Theme-SELinux%20Hardening-5C2D91?style=for-the-badge)
![Theme](https://img.shields.io/badge/Theme-Support%20%26%20Diagnostics-708090?style=for-the-badge)

</div>

| Lab | Title | Focus Area |
|-----|-------|------------|
| 17 | [Performance Monitoring](lab17-monitoring-system-performance) | CPU/mem/disk + stress testing |
| 18 | [SELinux Fundamentals](lab18-securing-system-with-selinux-basics) | AVC denials + context fixes |
| 19 | [Red Hat Portal & Cockpit](lab19-redhat-customer-portal-cockpit) | Web-based admin workflows |
| 20 | [Diagnostics & Insights](lab20-collecting-diagnostic-data-and-using-redhat-tools) | sosreport + insights-client |
---

## ✅ Skills Demonstrated (Labs 1–20)

- RHEL 9.x enterprise administration
- User/group lifecycle management
- SSH hardening & firewall validation
- systemd service operations
- journalctl filtering & log analysis
- Disk provisioning & persistent mounts
- LVM creation, extension & resizing
- NFS/CIFS secure configuration
- Performance monitoring & stress testing
- SELinux enforcement & remediation
- sosreport diagnostics & Insights integration

---

# 🧱 SECTION 2: Linux Automation, Logging & Infrastructure Hardening (Labs 21–40)

<!-- SECTION 2: Linux Automation, Logging & Infrastructure Hardening (Labs 21–40) -->
<div align="left">

![Category](https://img.shields.io/badge/Category-Linux%20Operations%20Mastery-111111?style=for-the-badge&logo=linux)
![Track](https://img.shields.io/badge/Track-Automation%20%26%20Observability-2C3E50?style=for-the-badge)
![Outcome](https://img.shields.io/badge/Outcome-Production%20Ops%20Ready-success?style=for-the-badge)
![Scope](https://img.shields.io/badge/Scope-Logging%20%7C%20Scheduling%20%7C%20Tuning-0B3D91?style=for-the-badge)

</div>

## 🔹 Shell Productivity & Automation (Labs 21–26)

<!-- SUBSECTION: Shell Productivity & Automation (Labs 21–26) -->
<div align="left">

![Subsection](https://img.shields.io/badge/Subsection-Shell%20Engineering-333333?style=for-the-badge)
![Theme](https://img.shields.io/badge/Theme-Productivity%20Tooling-4EAA25?style=for-the-badge&logo=gnubash)
![Theme](https://img.shields.io/badge/Theme-Scripting%20Patterns-4EAA25?style=for-the-badge&logo=gnubash)

</div>

| Lab | Title | Focus Area |
|-----|-------|------------|
| 21 | [Advanced Bash History](lab21-advanced-bash-history-search) | Reverse search + tuning |
| 22 | [Aliases & Functions](lab22-aliases-and-functions) | Reusable automation |
| 23 | [Command Substitution](lab23-command-substitution) | Dynamic command pipelines |
| 24 | [Brace Expansion & Globbing](lab24-brace-expansion-and-globbing) | Bulk operations |
| 25 | [Job Control](lab25-job-control) | Background/foreground mgmt |
| 26 | [Environment Variables](lab26-environment-and-shell-variables) | Scope + persistence |

## 🔹 Scheduling & Time-Based Operations (Labs 27–29)

<!-- SUBSECTION: Scheduling & Time-Based Operations (Labs 27–29) -->
<div align="left">

![Subsection](https://img.shields.io/badge/Subsection-Scheduling%20Engineering-333333?style=for-the-badge)
![Theme](https://img.shields.io/badge/Theme-cron%20%7C%20at%20%7C%20Timers-2C3E50?style=for-the-badge)
![Theme](https://img.shields.io/badge/Theme-Operational%20Automation-2C3E50?style=for-the-badge)

</div>

| Lab | Title | Focus Area |
|-----|-------|------------|
| 27 | [Cron Jobs](lab27-setting-up-cron-jobs) | Scheduled automation |
| 28 | [at Command](lab28-using-at-command) | One-time job scheduling |
| 29 | [systemd Timers](lab29-systemd-timers-for-task-scheduling) | Enterprise scheduling |

## 🔹 Logging & Observability (Labs 30–32)

<!-- SUBSECTION: Logging & Observability (Labs 30–32) -->
<div align="left">

![Subsection](https://img.shields.io/badge/Subsection-Observability%20Ops-333333?style=for-the-badge)
![Theme](https://img.shields.io/badge/Theme-journald%20%7C%20Rotation%20%7C%20Forwarding-0B3D91?style=for-the-badge)
![Theme](https://img.shields.io/badge/Theme-Centralized%20Logging-0B3D91?style=for-the-badge)

</div>

| Lab | Title | Focus Area |
|-----|-------|------------|
| 30 | [journalctl Analysis](lab30-journalctl-analysis) | Query, export, retention |
| 31 | [logrotate Configuration](lab31-logrotate) | Rotation policies |
| 32 | [Centralized Logging (rsyslog)](lab32-centralized-logging-rsyslog) | Client/server forwarding |

## 🔹 Packaging & Secure Transfers (Labs 33–34)

<!-- SUBSECTION: Packaging & Secure Transfers (Labs 33–34) -->
<div align="left">

![Subsection](https://img.shields.io/badge/Subsection-Operational%20Transfers-333333?style=for-the-badge)
![Theme](https://img.shields.io/badge/Theme-Archive%20%26%20Sync-FF8C00?style=for-the-badge)
![Theme](https://img.shields.io/badge/Theme-Secure%20Transport-FF8C00?style=for-the-badge)

</div>

| Lab | Title | Focus Area |
|-----|-------|------------|
| 33 | [tar Archiving](lab33-tar-archiving) | gzip vs bzip2 |
| 34 | [scp & rsync](lab34-scp-rsync) | Secure & delta transfers |

## 🔹 Kernel & Resource Tuning (Labs 35–37)

<!-- SUBSECTION: Kernel & Resource Tuning (Labs 35–37) -->
<div align="left">

![Subsection](https://img.shields.io/badge/Subsection-Performance%20Tuning-333333?style=for-the-badge)
![Theme](https://img.shields.io/badge/Theme-Kernel%20Parameters-228B22?style=for-the-badge)
![Theme](https://img.shields.io/badge/Theme-CPU%20%26%20I/O%20Optimization-228B22?style=for-the-badge)

</div>

| Lab | Title | Focus Area |
|-----|-------|------------|
| 35 | [sysctl Tuning](lab35-kernel-tuning) | Kernel parameter persistence |
| 36 | [nice & renice](lab36-cpu-scheduling) | CPU priority control |
| 37 | [I/O Scheduler](lab37-io-scheduler) | Benchmark & tuning |

## 🔹 Enterprise Hardening & Infrastructure (Labs 38–40)

<!-- SUBSECTION: Enterprise Hardening & Infrastructure (Labs 38–40) -->
<div align="left">

![Subsection](https://img.shields.io/badge/Subsection-Infrastructure%20Hardening-333333?style=for-the-badge)
![Theme](https://img.shields.io/badge/Theme-SELinux%20Policy%20Ops-5C2D91?style=for-the-badge)
![Theme](https://img.shields.io/badge/Theme-Storage%20%26%20File%20Services-FF8C00?style=for-the-badge)

</div>

| Lab | Title | Focus Area |
|-----|-------|------------|
| 38 | [Advanced SELinux](lab38-selinux-management) | semanage + audit2allow |
| 39 | [LVM Lifecycle + Snapshots](lab39-lvm-management) | Expansion & rollback |
| 40 | [NFS Server/Client](lab40-nfs-configuration-for-file-sharing) | Secure file sharing |
---

## ✅ Skills Demonstrated (Labs 21–40)

- Shell efficiency engineering
- Cron / at / systemd timers automation
- journalctl deep querying
- logrotate policy implementation
- Centralized logging with rsyslog
- Secure archiving & file transfer
- Kernel tuning via sysctl
- CPU & I/O scheduler benchmarking
- SELinux policy module creation
- LVM snapshot lifecycle
- NFS server/client provisioning

# 🧠 Core Skills Demonstrated Across 40 Labs

This portfolio reflects structured, execution-first enterprise Linux engineering — covering system configuration, security enforcement, observability, performance tuning, automation, and infrastructure lifecycle management in production-style environments.

---

# 🧪 Artifacts Produced

This portfolio includes verifiable operational evidence:

- Command transcripts (`commands.sh`)
- Captured outputs (`output.txt`)
- `/etc/fstab` persistent mounts
- repo enable/disable evidence
- Firewall rule validation
- SELinux context remediation
- sosreport archive creation
- insights-client registration output
- LVM snapshot & rollback evidence
- rsyslog forwarding verification
- systemd timer execution logs

---

# 🛠 Tools & Technologies Used

<details>
<summary><b> Click to expand </b></summary>

## 🖥 Operating Systems
- Red Hat Enterprise Linux 9.x
- Ubuntu 24.04 LTS
- CentOS 7 (Core)

## 💻 Core CLI & Shell
- bash, coreutils, man, info

## 📊 Service & Logging
- systemctl, journalctl
- logrotate
- rsyslog
- logger

## ⏱ Scheduling & Automation
- cron, crontab
- at, atq, atrm
- systemd timers

## 💾 Storage & Filesystems
- lsblk, fdisk, blkid
- LVM (pvcreate, vgcreate, lvcreate, lvextend)
- mount, /etc/fstab

## ⚙ Performance & Resource Tuning
- sysctl
- nice, renice
- iostat, fio, dd
- htop

## 🔐 Security & Access Control
- SELinux (sestatus, chcon, semanage, audit2allow)
- ausearch, sealert
- firewall-cmd

## 🏢 Enterprise Operations Tooling
- Cockpit
- sosreport
- insights-client
- OpenStack CLI

</details>

---

# 🗂 Repository Structure

```
Product-Security-Supply-Chain-Assurance/
├── 🔹 RHEL Administration & Enterprise Operations (Labs 1–20)
├── 🔹 Linux Automation, Logging & Infrastructure Hardening (Labs 21–40)
└── README.md
```

### 🧱 Standard Lab Folder Structure

Each lab follows a consistent professional structure:

```
labXX-<lab-name>/
├── README.md
├── commands.sh
├── output.txt
├── troubleshooting.md
└── interview_qna.md
```

Each lab includes:

- ✅ Executed commands
- ✅ Captured outputs
- ✅ Configuration evidence
- ✅ Troubleshooting notes
- ✅ Interview-focused explanations

---

# 🎓 Learning Outcomes Across 40 Labs

After completing these 40 labs, this portfolio demonstrates the ability to:

- Administer enterprise RHEL systems confidently
- Configure secure authentication & SSH hardening
- Manage service lifecycle via systemd
- Perform deep log analysis & centralized ingestion
- Implement secure scheduling automation
- Tune kernel & performance parameters
- Handle SELinux enforcement & policy troubleshooting
- Manage LVM lifecycle & snapshots
- Configure NFS infrastructure
- Produce enterprise-grade diagnostics & support artifacts

---

# 🌍 Real-World Alignment

These labs simulate real enterprise Linux operations including:

- Enterprise server provisioning & post-deployment configuration  
- Secure SSH hardening & firewall validation workflows  
- Identity & access lifecycle management (users, groups, password policies)  
- Service lifecycle management using systemd  
- Log analysis & operational troubleshooting via journalctl and logrotate  
- Centralized log forwarding using rsyslog (client/server model)  
- Storage provisioning (disks, persistent mounts, LVM lifecycle management)  
- Network file services deployment (NFS server/client configuration)  
- SELinux enforcement, AVC denial analysis & policy remediation  
- Scheduled automation using cron, at, and systemd timers  
- Kernel parameter tuning & performance validation  
- Enterprise diagnostics & proactive support workflows (sosreport, Red Hat Insights)

These reflect practical enterprise Linux administration — not classroom exercises.

---

# 📊 Professional Relevance

This portfolio reflects:

- Enterprise Linux system administration capability  
- Infrastructure hardening & security-focused configuration  
- Automation-first operational mindset  
- Log-driven troubleshooting discipline  
- Performance tuning & resource optimization expertise  
- Storage & filesystem lifecycle management  
- Enterprise observability & logging operations  
- Structured documentation & reproducible execution  
- Production-style troubleshooting methodology  

It aligns with roles such as:

- Linux System Administrator  
- RHEL / Enterprise Linux Engineer  
- Infrastructure Engineer  
- Platform Operations Engineer  
- DevOps Engineer (Linux-focused)  
- Security-Focused Systems Engineer  

---

# 🌐 Real-World Simulation Model

All labs were executed in controlled lab environments designed to simulate realistic enterprise Linux infrastructure workflows:

- Multi-service system environments  
- Persistent storage & mount validation scenarios  
- Live service restart & dependency testing  
- Log investigation under operational conditions  
- SELinux enforcement troubleshooting scenarios  
- Performance benchmarking under stress conditions  
- Scheduled automation validation via system logs  
- Enterprise diagnostics generation & support reporting  

This is practical implementation — demonstrating full lifecycle system administration capability:

> Configure → Secure → Monitor → Automate → Tune → Troubleshoot → Document

---

# 📊 Linux Engineering Skills Heatmap

This heatmap reflects **hands-on execution across 40 enterprise Linux labs** in:

**RHEL Administration • Infrastructure Engineering • Automation • Logging • Hardening • Performance Tuning**

> Exposure bars use text-block style to reflect implementation depth across labs.

| Skill Area | Exposure Level | Practical Depth | Tools / Frameworks Used |
|------------|----------------|----------------|--------------------------|
| 🐧 RHEL System Administration | ██████████ 100% | Full lifecycle server configuration & validation | RHEL 9.x, bash, coreutils |
| 👤 Identity & Access Management | ██████████ 100% | User/group lifecycle, password aging, permissions | useradd, chage, chmod, chown |
| ⚙️ Service Lifecycle Management | ██████████ 100% | systemd services, dependencies, restart policies | systemctl, journald |
| 📜 Log Analysis & Observability | █████████░ 90% | Log filtering, retention, centralized forwarding | journalctl, rsyslog, logrotate |
| 🌐 Network Configuration | █████████░ 90% | Static IP, DNS, hostname validation | nmcli, firewall-cmd |
| 💾 Storage & Filesystems | ██████████ 100% | Persistent mounts, fstab engineering | lsblk, mount, /etc/fstab |
| 📦 LVM Lifecycle Management | ██████████ 100% | PV/VG/LV creation, expansion, snapshots | pvcreate, vgcreate, lvextend |
| 📂 Network File Services | █████████░ 90% | NFS server/client configuration & persistence | nfs-utils, exportfs |
| 🔐 SELinux Enforcement & Policy | █████████░ 90% | Context management, AVC analysis, custom policies | sestatus, semanage, audit2allow |
| ⏱ Automation & Scheduling | ██████████ 100% | Cron, at, systemd timers with validation | crontab, at, systemd timers |
| ⚡ Performance & Kernel Tuning | █████████░ 90% | sysctl tuning, CPU priority, I/O scheduler benchmarking | sysctl, nice, fio, iostat |
| 🏢 Enterprise Diagnostics & Support | █████████░ 90% | Diagnostic collection & proactive advisory workflows | sosreport, insights-client |
| 📡 Centralized Logging Architecture | █████████░ 90% | Client/server log forwarding validation | rsyslog, logger |
| 📊 Resource Monitoring & Benchmarking | █████████░ 90% | Stress testing & runtime validation | stress-ng, htop, dd |

---

## 🧠 Proficiency Scale

- ██████████ = Implemented end-to-end with configuration, validation & troubleshooting  
- █████████░ = Strong practical implementation with runtime verification  
- ████████░░ = Applied engineering exposure with documented execution  

This heatmap reflects **enterprise Linux engineering capability**, not isolated commands — covering:

> Provision → Configure → Secure → Monitor → Automate → Tune → Troubleshoot → Document

---

# 🚀 How To Use

```bash
git clone https://github.com/abdul4rehman215/Red-Hat-System-Administration.git
cd Red-Hat-System-Administration
cd labXX-name
```

Each lab contains its own `README.md` with setup, execution steps and troubleshooting guidance.

---

# 🔒 Execution Environment

All 40 labs were executed in controlled Linux lab environments designed to simulate realistic enterprise RHEL administration workflows.

**Environment characteristics:**

- Red Hat Enterprise Linux 9.x (primary lab environment)  
- Ubuntu 24.04 LTS & CentOS 7 (cross-validation environments)  
- Dedicated virtual machines for isolation  
- Real service lifecycle testing (systemd, journald, firewall)  
- Persistent storage validation (/etc/fstab, LVM, NFS mounts)  
- Live performance benchmarking (CPU, I/O, memory stress tests)  
- SELinux enforcement & policy troubleshooting scenarios  
- Centralized logging simulations (rsyslog client/server)

Outputs were validated using executed commands, system logs, configuration files, and observable runtime behavior — reflecting production-style system administration quality.

---

# 🎯 Intended Use

This repository is designed to support:

- Enterprise Linux system administration training  
- RHEL operational readiness (RHCSA/RHCE-aligned skills)  
- Infrastructure hardening & configuration validation  
- Logging & observability operations  
- Storage & filesystem lifecycle management  
- Automation & scheduling implementation  
- Performance tuning & kernel parameter optimization  

All workflows are intended for authorized lab environments and professional Linux engineering development.

---

# ⚖ Ethical & Legal Notice

All labs were executed in controlled lab environments using:

- Dedicated virtual machines  
- Isolated enterprise-style configurations  
- Authorized systems only  

No unauthorized systems were tested.

This repository is strictly for defensive, administrative, and professional Linux engineering development.

---

# ⭐ Final Note

This repository reflects **hands-on enterprise Linux engineering**, not theoretical notes.

It demonstrates operational capability across:

> Configure → Secure → Monitor → Tune → Automate → Troubleshoot

If this portfolio adds value, consider starring the repository ⭐

This portfolio demonstrates applied Linux engineering capability — not isolated commands — but full operational workflows including configuration, hardening, monitoring, automation, tuning, and recovery across enterprise environments.

---

# 👨‍💻 Author

**Abdul Rehman**  
Linux System Administration • Enterprise Operations • Security-Focused Infrastructure

### 📧 Reach Out

  <a href="https://github.com/abdul4rehman215">
    <img src="https://img.shields.io/badge/Follow-181717?style=for-the-badge&logo=github&logoColor=white" alt="Follow" />
  </a>  
  <a href="https://linkedin.com/in/abdul4rehman215">
     <img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white&v=1" />
  </a>
  <a href="mailto:abdul4rehman215@gmail.com">
    <img src="https://img.shields.io/badge/Email-EE0000?style=for-the-badge&logo=gmail&logoColor=white" />
  </a>

---
