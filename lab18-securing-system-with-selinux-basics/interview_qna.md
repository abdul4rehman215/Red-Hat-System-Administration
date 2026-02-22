# 🎤 Interview Q&A – Lab 18: Securing the System with SELinux Basics

# 🔹 Section 1: HR / Behavioral Questions

---

### 1️⃣ Why is SELinux important in enterprise Linux environments?

SELinux provides:

- Mandatory Access Control (MAC)
- Fine-grained security enforcement
- Service isolation
- Protection against privilege escalation

It adds an additional security layer beyond traditional Linux permissions.

---

### 2️⃣ Have you ever troubleshooted a 403 error caused by SELinux?

Yes.

Steps followed:

1. Verified file permissions (they were correct)
2. Checked SELinux context using `ls -Z`
3. Observed incorrect type (`user_home_t`)
4. Checked audit logs using `ausearch`
5. Fixed labeling using `restorecon`
6. Applied persistent fix using `semanage`

---

### 3️⃣ How do you approach a security issue methodically?

1. Confirm service functionality
2. Check Linux permissions
3. Check SELinux enforcement mode
4. Inspect audit logs
5. Apply minimal corrective change
6. Re-validate system behavior

---

# 🔹 Section 2: Technical Questions

---

### 4️⃣ What are the components of an SELinux context?

Format:

```

user:role:type:level

```

Example:

```

unconfined_u:object_r:user_tmp_t:s0

````

| Component | Meaning |
|------------|----------|
| User | SELinux user |
| Role | SELinux role |
| Type | Most important for access decisions |
| Level | MLS/MCS security level |

---

### 5️⃣ Which context field is most critical?

✔ **Type**

Type enforcement controls access decisions.

Example:

- httpd runs in `httpd_t`
- Web files must be labeled `httpd_sys_content_t`

---

### 6️⃣ Difference between DAC and MAC?

| DAC | MAC |
|------|------|
| Discretionary | Mandatory |
| Based on file permissions | Based on policy rules |
| User-controlled | Policy-enforced |

SELinux implements MAC.

---

### 7️⃣ What does enforcing mode mean?

SELinux actively blocks policy violations.

Modes:

- Enforcing → Blocks violations
- Permissive → Logs but does not block
- Disabled → SELinux off

---

### 8️⃣ How do you check SELinux status?

```bash
sestatus
````

---

### 9️⃣ What is an AVC denial?

AVC = Access Vector Cache

It logs:

* Source context
* Target context
* Operation denied
* Object class

Example:

```
avc: denied { read } for pid=2531 comm="httpd"
```

---

### 🔟 How do you analyze AVC denials?

```bash
ausearch -m avc -ts recent
```

For readable format:

```bash
sealert -a /var/log/audit/audit.log
```

---

# 🔹 Section 3: Scenario-Based Questions

---

### 1️⃣1️⃣ Scenario: Web server returns 403 but file permissions are correct.

Steps:

1. Check SELinux context:

   ```bash
   ls -Z filename
   ```
2. Verify correct type (`httpd_sys_content_t`)
3. Check audit logs:

   ```bash
   ausearch -m avc -ts recent
   ```
4. Apply fix:

   ```bash
   restorecon -v filename
   ```

---

### 1️⃣2️⃣ Scenario: After reboot, SELinux context resets.

Cause:

`chcon` is temporary.

Correct solution:

```bash
semanage fcontext -a -t httpd_sys_content_t "/web(/.*)?"
restorecon -Rv /web
```

---

### 1️⃣3️⃣ Scenario: How to test if SELinux is causing issue?

Temporarily switch to permissive:

```bash
sudo setenforce 0
```

If issue disappears → SELinux policy likely cause.

Re-enable:

```bash
sudo setenforce 1
```

---

### 1️⃣4️⃣ Scenario: How to permanently disable SELinux?

Edit:

```
/etc/selinux/config
```

Change:

```
SELINUX=disabled
```

Reboot required.

⚠ Not recommended in production.

---

# 🔹 Section 4: Advanced Questions

---

### 1️⃣5️⃣ What is Type Enforcement?

Type Enforcement is the core SELinux mechanism.

Rules define:

* Which type can access which type
* What operations are allowed

Example:

`httpd_t` → can read `httpd_sys_content_t`

---

### 1️⃣6️⃣ What is targeted policy?

Targeted policy confines only specific services (like httpd, sshd).

Other processes run unconfined.

Default in RHEL.

---

### 1️⃣7️⃣ What are SELinux booleans?

Booleans toggle specific behaviors without modifying policy.

Example:

```bash
getsebool -a
setsebool httpd_can_network_connect on
```

---

# ✅ Interview Readiness Checklist

✔ Understand SELinux modes
✔ Interpret contexts
✔ Analyze AVC denials
✔ Use ausearch and sealert
✔ Apply persistent labeling
✔ Troubleshoot 403 SELinux issues
✔ Explain DAC vs MAC

---
