# 🛠 Troubleshooting – Lab 38: Using setenforce and semanage for SELinux

---

## 1️⃣ setenforce Not Working

Ensure SELinux is enabled:

```bash
sestatus
```

If disabled in config, reboot required.

---

## 2️⃣ Port Already Defined Error

Error:
```
ValueError: Port already defined
```

Check existing port assignment:

```bash
sudo semanage port -l | grep <port>
```

---

## 3️⃣ Custom Module Not Applying

Verify:

```bash
sudo semodule -l
```

Check for syntax errors in .te file.

---

## 4️⃣ No audit logs Found

Ensure auditd is running:

```bash
sudo systemctl status auditd
```

---

## 5️⃣ Application Still Blocked

Temporarily switch to permissive for debugging:

```bash
sudo setenforce 0
```

Then analyze logs and revert.

---

## 6️⃣ File Context Issues

Check file context:

```bash
ls -Z filename
```

Fix with:

```bash
restorecon -Rv /path
```

---

## 🔐 Production Best Practices

✔ Never disable SELinux permanently  
✔ Use permissive only for debugging  
✔ Modify policies properly  
✔ Monitor audit logs regularly  
✔ Document custom modules  

---

## 🧠 Enterprise Insight

In production:

- Web servers → custom ports must be labeled  
- Containers → heavily rely on SELinux separation  
- OpenShift → SELinux mandatory  

Proper SELinux management = professional Linux administration.
