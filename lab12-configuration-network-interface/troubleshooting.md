# 🛠 Troubleshooting Guide - Lab 12: Configuring Network Interfaces (RHEL 9)

---

# 🔎 Common Issues and Fixes

---

## 1️⃣ NetworkManager Not Running

### Problem

```bash
nmcli device status
Error: NetworkManager is not running.
````

### Solution

Start and enable the service:

```bash
sudo systemctl start NetworkManager
sudo systemctl enable NetworkManager
```

Verify:

```bash
sudo systemctl status NetworkManager
```

---

## 2️⃣ Interface Shows Disconnected

### Check Status

```bash
nmcli device status
```

### Reconnect Interface

```bash
sudo nmcli device connect eth0
```

Or restart the connection:

```bash
sudo nmcli connection up "System eth0"
```

---

## 3️⃣ Static IP Not Applied

### Verify Method

```bash
nmcli connection show "System eth0" | grep ipv4.method
```

If not manual:

```bash
sudo nmcli connection modify "System eth0" ipv4.method manual
sudo nmcli connection up "System eth0"
```

---

## 4️⃣ No Internet Connectivity

### Step 1: Check IP

```bash
ip addr show eth0
```

### Step 2: Check Gateway

```bash
ip route
```

Look for:

```
default via 192.168.1.1 dev eth0
```

### Step 3: Ping Gateway

```bash
ping -c 4 192.168.1.1
```

### Step 4: Ping External IP

```bash
ping -c 4 8.8.8.8
```

If gateway works but external fails → ISP/Firewall issue.

---

## 5️⃣ DNS Not Resolving

### Test DNS

```bash
nslookup google.com
```

### Check DNS Settings

```bash
nmcli device show eth0 | grep DNS
```

### Fix DNS

```bash
sudo nmcli connection modify "System eth0" ipv4.dns "8.8.8.8"
sudo nmcli connection modify "System eth0" ipv4.ignore-auto-dns yes
sudo nmcli connection up "System eth0"
```

---

## 6️⃣ Hostname Not Updating

### Check Current Hostname

```bash
hostnamectl
```

If change not reflected:

```bash
sudo systemctl restart systemd-hostnamed
```

---

## 7️⃣ MTU Misconfiguration Causes Connectivity Issues

Check MTU:

```bash
ip link show eth0
```

Reset MTU:

```bash
sudo nmcli connection modify "System eth0" 802-3-ethernet.mtu 1500
sudo nmcli connection up "System eth0"
```

---

## 8️⃣ IPv6 Still Active After Disabling

Verify:

```bash
nmcli connection show "System eth0" | grep ipv6
```

If required, restart service:

```bash
sudo systemctl restart NetworkManager
```

---

# 🔐 Security Best Practices

* Avoid using default DHCP in production servers
* Restrict unused interfaces
* Disable IPv6 if not required
* Use static DNS for servers
* Document IP assignments
* Limit SSH exposure via firewall rules

---

# 🧹 Cleanup (Optional – Revert to DHCP)

```bash
sudo nmcli connection modify "System eth0" ipv4.method auto
sudo nmcli connection modify "System eth0" ipv4.ignore-auto-dns no
sudo nmcli connection up "System eth0"
```

---

# ✅ Final Verification Checklist

✔ Interface shows connected
✔ Static IP correctly assigned
✔ Default gateway configured
✔ DNS resolving properly
✔ Hostname updated
✔ NetworkManager running

---

🎯 Lab 12 Troubleshooting Complete
