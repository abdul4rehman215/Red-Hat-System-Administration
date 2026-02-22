# 🎤 Interview Q&A -  Lab 12: Network Configuration in RHEL (nmcli & NetworkManager)

---

## 1️⃣ What is NetworkManager?

**Answer:**

NetworkManager is a service that manages network connections dynamically in Linux systems.

It:
- Controls network interfaces
- Manages connection profiles
- Handles DHCP and static IP configurations
- Manages DNS settings
- Integrates with `nmcli` and GUI tools

---

## 2️⃣ What is nmcli?

**Answer:**

`nmcli` (Network Manager Command Line Interface) is a CLI tool used to control NetworkManager.

It allows administrators to:
- View network devices
- Modify connection profiles
- Configure IP addresses
- Restart connections
- Manage DNS and routing

---

## 3️⃣ How do you list all network interfaces?

```bash
nmcli device status
````

Alternative:

```bash
ip addr show
```

---

## 4️⃣ How do you configure a static IP using nmcli?

```bash
sudo nmcli connection modify "System eth0" \
ipv4.addresses 192.168.1.100/24 \
ipv4.gateway 192.168.1.1 \
ipv4.dns "8.8.8.8,8.8.4.4" \
ipv4.method manual

sudo nmcli connection up "System eth0"
```

---

## 5️⃣ How do you switch back to DHCP?

```bash
sudo nmcli connection modify "System eth0" ipv4.method auto
sudo nmcli connection up "System eth0"
```

---

## 6️⃣ How do you change the system hostname?

```bash
sudo hostnamectl set-hostname mylabhost
```

---

## 7️⃣ How do you verify DNS configuration?

```bash
nmcli device show eth0 | grep DNS
```

Or:

```bash
cat /etc/resolv.conf
```

---

## 8️⃣ What happens if you restart NetworkManager?

```bash
sudo systemctl restart NetworkManager
```

* All connections are reloaded
* Active connections may briefly drop
* New configurations are applied

---

## 9️⃣ How do you disable IPv6 on an interface?

```bash
sudo nmcli connection modify "System eth0" ipv6.method disabled
```

---

## 🔟 What is MTU and why might you change it?

**MTU (Maximum Transmission Unit)** defines the maximum packet size that can be transmitted.

You might change MTU:

* For VPN configurations
* To avoid packet fragmentation
* For cloud provider requirements

---

# 🧠 Advanced Interview Questions

---

## 1️⃣1️⃣ How does NetworkManager store connection profiles?

Profiles are stored in:

```
/etc/NetworkManager/system-connections/
```

Each profile is a file with configuration parameters.

---

## 1️⃣2️⃣ How do you troubleshoot connectivity issues?

Steps:

1. Check interface state:

   ```bash
   nmcli device status
   ```

2. Verify IP:

   ```bash
   ip addr show
   ```

3. Check routing:

   ```bash
   ip route
   ```

4. Test gateway:

   ```bash
   ping <gateway>
   ```

5. Test DNS:

   ```bash
   nslookup google.com
   ```

---

# ✅ Interview Takeaway

This lab demonstrates:

* Strong understanding of Linux networking fundamentals
* Practical experience with static IP configuration
* Ability to manage production-level network settings
* Troubleshooting and verification skills

These are essential skills for:

* Linux System Administrators
* DevOps Engineers
* Cloud Engineers
* Kubernetes/OpenShift Operators
