# 🧪 Lab 13: Resource Allocation in Multi-Tenant Cloud

---

## 📌 Lab Overview

This lab focuses on resource allocation and quota management in a multi-tenant OpenStack cloud environment.

You will create multiple projects (tenants), assign users, configure compute/network/storage quotas, monitor usage, and dynamically adjust allocations.

This lab simulates real-world cloud infrastructure management in enterprise and public cloud environments.

---

## 🎯 Objectives

By the end of this lab, I was able to:

- ✔ Create and manage OpenStack projects (tenants)
- ✔ Create tenant-specific users
- ✔ Allocate compute resources (VCPUs, RAM)
- ✔ Configure network quotas
- ✔ Set storage limits
- ✔ Monitor per-project usage
- ✔ Dynamically adjust quotas

---

## 📋 Prerequisites

- OpenStack DevStack environment
- Admin privileges
- OpenStack CLI configured
- `admin-openrc.sh` sourced

---

## 🗂 Repository Structure

```

lab13-multi-tenant-resource-allocation/
│
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
└── troubleshooting.md

```

---

# ✅ Task Overview

---

## 🔹 Task 1: Create Projects & Users
- Create two tenants
- Create tenant-specific users
- Verify user creation

---

## 🔹 Task 2: Configure Resource Quotas
- Allocate compute quotas (cores, RAM)
- Configure network quotas
- Configure storage quotas
- Verify configuration

---

## 🔹 Task 3: Monitor & Adjust Resources
- View tenant usage
- Modify quotas dynamically
- Verify updated quotas

---

# 🌐 Why This Lab Matters

Multi-tenant resource management is critical for:

- Public cloud providers
- Private enterprise clouds
- SaaS platforms
- Container platforms
- Cost governance

Proper quota management ensures:

- Fair usage
- Resource isolation
- Cost control
- Prevention of resource exhaustion

---

# 🏁 Lab Conclusion

In this lab, you configured multi-tenant cloud resource allocation using OpenStack CLI.

You now understand:

- Tenant isolation
- Resource quotas
- Cloud governance
- Usage monitoring
- Dynamic quota management

These are essential cloud engineering skills.

---
