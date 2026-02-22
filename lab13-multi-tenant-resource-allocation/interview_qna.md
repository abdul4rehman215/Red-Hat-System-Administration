# 🎤 Interview Q&A - Lab 13: Multi-Tenant Resource Allocation in OpenStack

---

## 1️⃣ What is Multi-Tenancy in Cloud Computing?

**Answer:**

Multi-tenancy allows multiple customers (tenants/projects) to share the same cloud infrastructure while remaining logically isolated.

Each tenant has:
- Separate users
- Separate resources
- Independent quotas
- Isolated networking

---

## 2️⃣ What is an OpenStack Project?

In OpenStack, a **project (tenant)** is a container for:

- Users
- Instances
- Networks
- Volumes
- Security groups
- Quotas

Projects provide isolation between different workloads.

---

## 3️⃣ How do you create a new project?

```bash
openstack project create --description "Tenant A" tenant_a
````

---

## 4️⃣ How do quotas work in OpenStack?

Quotas limit the maximum resources a tenant can consume.

Examples:

* VCPUs
* RAM
* Instances
* Networks
* Storage (GB)

They prevent one tenant from exhausting shared infrastructure.

---

## 5️⃣ How do you set compute quotas?

```bash
openstack quota set --cores 4 --ram 8192 tenant_a
```

This limits:

* 4 VCPUs
* 8GB RAM

---

## 6️⃣ How do you verify quotas?

```bash
openstack quota show tenant_a
```

---

## 7️⃣ How do you monitor tenant usage?

```bash
openstack usage list
```

This shows:

* Instances
* RAM usage
* VCPUs
* Hours consumed

---

## 8️⃣ Why are quotas important in enterprise clouds?

They ensure:

* Fair resource distribution
* Cost governance
* Prevention of resource starvation
* Infrastructure stability
* Compliance enforcement

---

## 9️⃣ How do you dynamically adjust quotas?

```bash
openstack quota set --ram 12288 tenant_a
```

Quota updates take effect immediately.

---

## 🔟 What happens if quotas are exceeded?

The tenant will receive an error when attempting to:

* Launch new instances
* Create volumes
* Create networks

Example error:

```
Quota exceeded for resources: cores
```

---

# 🧠 Advanced Interview Questions

---

## 1️⃣1️⃣ How does OpenStack enforce isolation between tenants?

Through:

* Keystone (Identity & authentication)
* Neutron (network isolation)
* Nova (compute resource separation)
* Cinder (volume separation)
* Role-Based Access Control (RBAC)

---

## 1️⃣2️⃣ How would you design quota policies in a production cloud?

Best practices:

* Default conservative quotas
* Monitor usage trends
* Increase quotas based on business justification
* Use automation for quota governance
* Align quotas with billing/cost models

---

## 1️⃣3️⃣ How do quotas relate to cost control?

Higher quotas allow:

* More compute
* More storage
* More networking resources

Cloud providers map resource usage to billing models.

Quotas prevent unexpected cost spikes.

---

# ✅ Interview Takeaway

This lab demonstrates:

* Real-world cloud governance skills
* OpenStack CLI proficiency
* Resource allocation strategy
* Multi-tenant infrastructure management
* Cost control awareness

These are essential skills for:

* Cloud Engineers
* Infrastructure Architects
* DevOps Engineers
* Platform Engineers
* OpenStack Administrators
