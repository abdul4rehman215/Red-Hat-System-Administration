# 🛠 Troubleshooting Guide - Lab 13: Multi-Tenant Resource Allocation in OpenStack

---

# 🔎 Common Issues and Solutions

---

## 1️⃣ OpenStack CLI Not Working

### Problem
```bash
openstack project list
ERROR: Missing value auth-url required for auth plugin password
````

### Cause

OpenStack environment variables not loaded.

### Solution

Source the admin credentials file:

```bash
source admin-openrc.sh
```

Verify token:

```bash
openstack token issue
```

---

## 2️⃣ Permission Denied When Creating Projects

### Problem

```bash
You are not authorized to perform the requested action: identity:create_project
```

### Cause

User does not have admin role.

### Solution

Ensure you are using admin credentials:

```bash
source admin-openrc.sh
openstack role assignment list --user admin
```

---

## 3️⃣ Quota Change Not Applied

### Problem

Quota updated but still seeing old limits.

### Solution

Verify quota:

```bash
openstack quota show tenant_a
```

Ensure correct project name or ID is used.

---

## 4️⃣ Quota Exceeded Error

### Example Error

```
Quota exceeded for resources: cores
```

### Solution

Increase quota:

```bash
openstack quota set --cores 8 tenant_a
```

Or delete unused resources:

```bash
openstack server list
openstack server delete <instance_id>
```

---

## 5️⃣ Usage List Not Showing Projects

### Problem

```bash
openstack usage list
```

Shows empty output.

### Cause

No instances running.

### Solution

Launch test instance:

```bash
openstack server create \
--flavor m1.small \
--image cirros \
--network private \
test-instance
```

Then re-run:

```bash
openstack usage list
```

---

## 6️⃣ Network Quota Issues

### Problem

Cannot create network:

```
Quota exceeded for networks
```

### Solution

Check current limit:

```bash
openstack quota show tenant_a
```

Increase quota:

```bash
openstack quota set --networks 5 tenant_a
```

---

## 7️⃣ Storage Quota Errors

### Problem

Volume creation fails:

```
Quota exceeded for resources: gigabytes
```

### Solution

Increase storage quota:

```bash
openstack quota set --gigabytes 100 tenant_b
```

Or delete unused volumes:

```bash
openstack volume list
openstack volume delete <volume_id>
```

---

# 🔐 Best Practices for Multi-Tenant Clouds

* Use least privilege access control
* Assign roles carefully
* Monitor usage regularly
* Enforce strict quotas in production
* Audit tenant activity
* Automate quota governance
* Align quotas with billing and SLA policies

---

# 🧹 Cleanup (Optional)

Delete created users:

```bash
openstack user delete user_a
openstack user delete user_b
```

Delete projects:

```bash
openstack project delete tenant_a
openstack project delete tenant_b
```

---

# ✅ Final Verification Checklist

✔ Admin credentials sourced
✔ Projects created successfully
✔ Users assigned to correct tenants
✔ Compute quotas configured
✔ Network quotas enforced
✔ Storage quotas applied
✔ Usage monitoring operational
✔ Quotas dynamically adjustable

---

🎯 Lab 13 Troubleshooting Complete

