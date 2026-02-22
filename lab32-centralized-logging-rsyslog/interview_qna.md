# 🎤 Interview Q&A – Lab 32: Centralized Logging with rsyslog

---

## 1️⃣ What is rsyslog?

`rsyslog` is a high-performance log processing system that collects, stores, filters, and forwards logs locally or to remote servers using syslog protocols (UDP/TCP/TLS).

---

## 2️⃣ Why do organizations use centralized logging?

Centralized logging helps with:

- Unified monitoring across systems
- Faster incident response
- Easier auditing and compliance
- Long-term retention and investigation
- SIEM integration

---

## 3️⃣ What ports are used for syslog?

- UDP 514 (default syslog)
- TCP 514 (reliable delivery)
- TLS syslog often uses TCP 6514 (common, depends on config)

---

## 4️⃣ What is the difference between `@` and `@@` in rsyslog forwarding?

- `@server:514` → UDP forwarding
- `@@server:514` → TCP forwarding (recommended)

---

## 5️⃣ How do you enable rsyslog to receive remote logs on a server?

Enable input modules in `/etc/rsyslog.conf`:

```conf
module(load="imudp")
input(type="imudp" port="514")

module(load="imtcp")
input(type="imtcp" port="514")
```

---

## 6️⃣ How do you test whether forwarding works?

On client:

```bash
logger "test message"
```

On server:

```bash
tail -f /var/log/remotehost/<client-hostname>/logger.log
```

---

## 7️⃣ What is a rsyslog template and why is it useful?

A template defines how logs are stored (naming + path format).  
It helps organize logs by hostname, application, severity, etc.

Example:

```conf
$template RemoteLogs,"/var/log/remotehost/%HOSTNAME%/%PROGRAMNAME%.log"
```

---

## 8️⃣ What does `*.*` mean in rsyslog rules?

It means:

- `*` facility (all facilities)
- `*` severity (all severities)

So `*.*` matches **all logs**.

---

## 9️⃣ What does this line do on the server?

```conf
*.* ?RemoteLogs
& ~
```

- `*.* ?RemoteLogs` → writes all logs using the template path
- `& ~` → stops further processing (drops after writing), preventing duplication into local files

---

## 🔟 How would you forward only authentication logs?

On the client:

```conf
authpriv.* @@192.168.1.100:514
```

---

## 1️⃣1️⃣ How can you check if rsyslog is listening on port 514?

```bash
sudo ss -tulnp | grep 514
```

---

## 1️⃣2️⃣ If logs are not arriving, what is your first troubleshooting step?

1) Network connectivity and firewall:

```bash
ping 192.168.1.100
sudo firewall-cmd --list-ports
```

2) Confirm service running:

```bash
sudo systemctl status rsyslog
```

---

## 1️⃣3️⃣ How do you integrate rsyslog with SIEM / ELK?

Common flow:

- rsyslog → Logstash/Beats → Elasticsearch → Kibana

Or:

- rsyslog → files → Filebeat → Elasticsearch

---

## 1️⃣4️⃣ Why is TCP preferred over UDP for centralized logging?

TCP provides:

- Reliable delivery
- Connection-based transport
- Less chance of log loss during high load or network instability

---

## 1️⃣5️⃣ How would you secure log forwarding?

Options:

- TLS encryption (rsyslog-gnutls)
- Mutual certificate authentication
- Restrict firewall rules (allow only known clients)
- Use segmentation/VPN for log network
- Apply rate limiting and disk controls

---

# 🧠 Scenario Question

**Q:** A client is generating logs but the server directory is not being created. What would you check?

✅ Answer checklist:

1) Server listening:
```bash
sudo ss -tulnp | grep 514
```

2) Firewall open:
```bash
sudo firewall-cmd --list-ports
```

3) Client forwarding rule:
```bash
sudo tail -n 20 /etc/rsyslog.conf
```

4) Restart both:
```bash
sudo systemctl restart rsyslog
```

5) Confirm logs written:
```bash
sudo ls -R /var/log/remotehost
```

---
