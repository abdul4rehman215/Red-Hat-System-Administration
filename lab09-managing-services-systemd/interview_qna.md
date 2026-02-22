# 🎤  Lab 09 – Interview Q&A: Managing Services with systemd

---

## 1️⃣ What is systemd?

systemd is the default init system and service manager in modern Linux distributions such as RHEL, CentOS, Fedora, and Ubuntu.  

It is responsible for:
- Boot process management
- Service lifecycle management
- Logging (via journald)
- Dependency handling
- System targets

---

## 2️⃣ What is a unit in systemd?

A **unit** is a configuration object that systemd manages.

Common unit types:
- `.service` → Services
- `.socket` → Sockets
- `.target` → Runlevels (grouping units)
- `.mount` → Mount points
- `.timer` → Scheduled tasks

Example:
```

sshd.service

````

---

## 3️⃣ What does `systemctl status` show?

It displays:
- Load state
- Active state
- Sub-state
- Main PID
- Resource usage
- Recent log entries

Example:
```bash
systemctl status sshd
````

---

## 4️⃣ Difference between `start`, `restart`, and `reload`?

| Command | Behavior                                           |
| ------- | -------------------------------------------------- |
| start   | Starts a stopped service                           |
| stop    | Stops a running service                            |
| restart | Stops and starts again                             |
| reload  | Reloads config without full restart (if supported) |

---

## 5️⃣ What is the difference between enable and start?

| Command  | Purpose                             |
| -------- | ----------------------------------- |
| `start`  | Runs service immediately            |
| `enable` | Configures service to start at boot |

A service can be running but not enabled at boot.

---

## 6️⃣ What happens when you run `systemctl enable`?

It creates a symbolic link from:

```
/etc/systemd/system/multi-user.target.wants/
```

to the unit file in:

```
/usr/lib/systemd/system/
```

This ensures the service starts during boot.

---

## 7️⃣ What is masking a service?

Masking prevents a service from being started — even manually.

Command:

```bash
sudo systemctl mask sshd
```

It creates a symlink to `/dev/null`.

---

## 8️⃣ How do you check service dependencies?

```bash
systemctl list-dependencies sshd
```

This shows:

* Required services
* Target associations
* Dependency hierarchy

---

## 9️⃣ What is journalctl used for?

`journalctl` reads logs from the systemd journal.

Examples:

View logs for a service:

```bash
sudo journalctl -u sshd
```

Follow logs live:

```bash
sudo journalctl -u sshd -f
```

Filter by time:

```bash
sudo journalctl --since "1 hour ago"
```

---

## 🔟 What are LOAD, ACTIVE, and SUB states?

| Field  | Meaning                                    |
| ------ | ------------------------------------------ |
| LOAD   | Unit file loaded properly                  |
| ACTIVE | High-level state (active/inactive/failed)  |
| SUB    | Low-level operational state (running/dead) |

---

## 1️⃣1️⃣ How do you check failed services?

```bash
systemctl --failed
```

---

## 1️⃣2️⃣ Where are unit files stored?

| Location                   | Purpose               |
| -------------------------- | --------------------- |
| `/usr/lib/systemd/system/` | Default unit files    |
| `/etc/systemd/system/`     | Custom/override units |
| `/run/systemd/system/`     | Runtime units         |

---

## 1️⃣3️⃣ What is a target in systemd?

A target is a grouping mechanism (similar to runlevels).

Common targets:

* multi-user.target
* graphical.target
* rescue.target

Check default target:

```bash
systemctl get-default
```

---

## 1️⃣4️⃣ How can you analyze boot performance?

```bash
systemd-analyze blame
```

This shows which services take the longest to start.

---

## 1️⃣5️⃣ Why is service management important in production?

Because administrators must:

* Ensure critical services are running
* Restart failed services
* Investigate service crashes
* Monitor logs for security events
* Control boot-time behavior

Service management is foundational in enterprise Linux environments.
