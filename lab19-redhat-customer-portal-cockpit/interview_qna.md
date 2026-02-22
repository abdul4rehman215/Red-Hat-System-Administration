# 🎤 Interview Q&A – Lab 19: Red Hat Customer Portal & Cockpit Administration

---

# 🔹 Section 1: HR / Enterprise Workflow Questions

---

### 1️⃣ Why is the Red Hat Customer Portal important for enterprise environments?

The Red Hat Customer Portal provides:

- Access to official documentation
- Knowledgebase solutions
- Security advisories
- Subscription management
- Support case management

It ensures enterprise systems receive vendor-backed support and certified fixes.

---

### 2️⃣ What information should be included when opening a Red Hat support case?

A strong support case includes:

- Product name and version (e.g., RHEL 9.3)
- Clear problem summary
- Exact reproduction steps
- Relevant log snippets
- sosreport attachment
- Business impact severity

This reduces back-and-forth communication and speeds resolution.

---

### 3️⃣ What is sosreport and why is it important?

`sosreport` collects:

- System logs
- Hardware details
- Configuration files
- Kernel and package information

It provides Red Hat engineers with diagnostic data to troubleshoot effectively.

Command:

```bash
sudo sosreport
````

---

# 🔹 Section 2: Cockpit Technical Questions

---

### 4️⃣ What is Cockpit?

Cockpit is:

* A web-based server management interface
* Included in RHEL
* Socket-activated on port 9090
* Backed by systemd and journal

It allows administrators to manage:

* Services
* Storage
* Networking
* Logs
* Containers (via cockpit-podman)

---

### 5️⃣ How does Cockpit start?

Cockpit uses **socket activation**:

```bash
systemctl enable --now cockpit.socket
```

The socket listens on port 9090 and starts the service when accessed.

---

### 6️⃣ How do you verify Cockpit is running?

```bash
systemctl status cockpit.socket
ss -tulnp | grep 9090
```

Or:

```bash
curl -kI https://localhost:9090
```

---

### 7️⃣ How do you allow Cockpit through the firewall?

```bash
firewall-cmd --add-service=cockpit --permanent
firewall-cmd --reload
```

---

### 8️⃣ What port does Cockpit use?

Default: **TCP 9090**

Secure HTTPS connection.

---

### 9️⃣ How does Cockpit display logs?

Cockpit reads directly from:

```
systemd journal
```

Equivalent CLI command:

```bash
journalctl
```

---

# 🔹 Section 3: Scenario-Based Questions

---

### 🔟 Scenario: Cockpit not accessible via browser.

Checklist:

1. Verify socket:

   ```bash
   systemctl status cockpit.socket
   ```
2. Check port:

   ```bash
   ss -tulnp | grep 9090
   ```
3. Check firewall:

   ```bash
   firewall-cmd --list-services
   ```
4. Inspect logs:

   ```bash
   journalctl -u cockpit
   ```

---

### 1️⃣1️⃣ Scenario: Port 9090 is listening but browser cannot connect.

Possible causes:

* Firewall blocking
* Cloud security group restriction
* SELinux policy issue
* Wrong IP address used

---

### 1️⃣2️⃣ Scenario: Cockpit login fails.

Check:

* User exists locally
* User not locked
* PAM configuration correct
* Journal logs:

```bash
journalctl -u cockpit
```

---

# 🔹 Section 4: Security & Architecture Questions

---

### 1️⃣3️⃣ Is Cockpit secure?

Yes, because:

* Uses HTTPS (TLS)
* Authenticates with system users
* Integrates with PAM
* Respects SELinux policies
* Uses socket activation

However, it should:

* Be firewalled properly
* Not exposed publicly without protection
* Use strong authentication

---

### 1️⃣4️⃣ Difference between Cockpit and SSH?

| Cockpit              | SSH                              |
| -------------------- | -------------------------------- |
| Web-based            | CLI-based                        |
| Visual dashboards    | Text-based                       |
| Graphical metrics    | Manual commands                  |
| Easier for beginners | More flexible for advanced users |

Enterprise admins often use both.

---

### 1️⃣5️⃣ Why use Cockpit in enterprise?

* Quick diagnostics
* Log filtering
* Service management
* Storage overview
* Container monitoring
* Reduced human error

---

# 🔹 Section 5: Advanced Questions

---

### 1️⃣6️⃣ What is socket activation?

Systemd listens on a port and only starts the service when traffic arrives.

Benefits:

* Lower resource usage
* Faster boot
* On-demand service startup

---

### 1️⃣7️⃣ How would you secure Cockpit in production?

* Restrict firewall to admin subnet
* Use valid TLS certificate
* Integrate with centralized authentication (LDAP/AD)
* Enable SELinux enforcing
* Use strong passwords or key-based access

---

# ✅ Interview Readiness Checklist

✔ Understand Red Hat support workflow
✔ Know how to open proper support cases
✔ Explain sosreport purpose
✔ Install and verify Cockpit
✔ Configure firewall properly
✔ Troubleshoot Cockpit connectivity
✔ Explain socket activation
✔ Compare Cockpit vs SSH

---
