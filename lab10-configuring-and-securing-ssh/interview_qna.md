# 🎤 Interview Q&A - Lab 10: Configuring and Securing SSH

---

## 1️⃣ What is SSH?

SSH (Secure Shell) is a cryptographic network protocol used to securely access and manage remote systems over an unsecured network.

It provides:
- Encrypted communication
- Secure authentication
- Data integrity protection

---

## 2️⃣ Why should you change the default SSH port?

Changing the default port (22):

- Reduces automated scanning attempts
- Minimizes noise from bots
- Adds an additional layer of obscurity

⚠ Note: This is not full security by itself, but reduces attack surface.

---

## 3️⃣ Why disable root login over SSH?

Reasons:
- Prevents brute-force attacks targeting root
- Enforces least privilege principle
- Requires attackers to compromise a normal user first

Configuration:
```bash
PermitRootLogin no
````

---

## 4️⃣ Why disable password authentication?

Password authentication is vulnerable to:

* Brute-force attacks
* Credential stuffing
* Password leaks

Instead, use key-based authentication:

```bash
PasswordAuthentication no
PubkeyAuthentication yes
```

---

## 5️⃣ What is key-based authentication?

It uses a cryptographic key pair:

* Private key (kept secure on client)
* Public key (stored in server's authorized_keys)

Authentication happens using asymmetric cryptography.

More secure than passwords.

---

## 6️⃣ Where are SSH keys stored?

Client side:

```
~/.ssh/id_ed25519
~/.ssh/id_ed25519.pub
```

Server side:

```
~/.ssh/authorized_keys
```

---

## 7️⃣ What permissions must be set for SSH key authentication?

```bash
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
```

Incorrect permissions cause authentication failure.

---

## 8️⃣ What is the purpose of AllowUsers directive?

It restricts which users can log in via SSH.

Example:

```bash
AllowUsers student
```

Only the specified user can connect.

---

## 9️⃣ How do you verify which port SSH is listening on?

```bash
ss -tulnp | grep ssh
```

Or:

```bash
sudo netstat -tulnp | grep ssh
```

---

## 🔟 What firewall command allows a custom SSH port?

```bash
sudo firewall-cmd --permanent --add-port=2222/tcp
sudo firewall-cmd --reload
```

---

## 1️⃣1️⃣ What happens if firewall is not updated after port change?

SSH becomes inaccessible remotely because:

* Port 22 closed
* New port not allowed

Always update firewall rules before closing current session.

---

## 1️⃣2️⃣ How do you troubleshoot SSH restart failures?

```bash
sudo journalctl -xe
```

Or:

```bash
sudo journalctl -u sshd
```

---

## 1️⃣3️⃣ What is ssh-copy-id used for?

It automatically copies a public key to the remote server’s `authorized_keys` file.

Example:

```bash
ssh-copy-id -p 2222 student@server-ip
```

---

## 1️⃣4️⃣ What are additional SSH hardening best practices?

* Use Fail2Ban
* Configure MaxAuthTries
* Set LoginGraceTime
* Disable unused authentication methods
* Implement IP allow-listing
* Use strong key algorithms (ed25519)

---

## 1️⃣5️⃣ Why is SSH hardening critical in enterprise environments?

Because:

* SSH is the primary remote access vector
* Misconfigured SSH is frequently exploited
* Credential theft can lead to full system compromise
* SSH security directly impacts server security posture

Strong SSH configuration significantly reduces risk exposure.
