# 🎓 Interview Q&A – Lab 02: Logging into RHEL and Using the Shell

---

## 1️⃣ What is the difference between local login and remote login?

- **Local login** is performed directly at the system console (physical or virtual machine).
- **Remote login** is performed over the network using protocols such as SSH.

Remote login allows administrators to manage servers without physical access.

---

## 2️⃣ What service enables remote login in RHEL?

The OpenSSH service (`sshd`) enables secure remote login in RHEL.

It can be managed using:

```bash
systemctl status sshd
````

---

## 3️⃣ How do you check if the SSH service is running?

```bash
sudo systemctl status sshd
```

If the output shows `Active: active (running)`, the SSH service is operational.

---

## 4️⃣ What command is used to find a system's IP address?

```bash
ip a
```

This displays all network interfaces and their assigned IP addresses.

---

## 5️⃣ What happens the first time you connect to a server via SSH?

* The system displays the host fingerprint.
* You must verify and accept it.
* The host key is stored in `~/.ssh/known_hosts`.

This prevents man-in-the-middle attacks.

---

## 6️⃣ What does the `ping` command help verify?

`ping` checks network connectivity between systems.

Example:

```bash
ping -c 3 10.0.2.15
```

It verifies reachability and latency.

---

## 7️⃣ What command displays firewall rules in RHEL?

```bash
sudo firewall-cmd --list-all
```

This shows active zones, services, and open ports.

---

## 8️⃣ What does the `pwd` command do?

`pwd` (Print Working Directory) displays the absolute path of the current directory.

Example:

```bash
pwd
```

Output:

```
/home/student
```

---

## 9️⃣ What is the difference between `ls`, `ls -l`, and `ls -a`?

* `ls` → Lists visible files.
* `ls -l` → Shows detailed listing (permissions, owner, size).
* `ls -a` → Shows hidden files (starting with `.`).
* `ls -lh` → Human-readable file sizes.

---

## 🔟 What is the purpose of the `man` command?

The `man` command opens manual pages for commands.

Example:

```bash
man ls
```

Press `q` to exit the manual page.

---

## 1️⃣1️⃣ What does the `exit` command do?

* In a local session → Logs out of the current user.
* In an SSH session → Terminates the remote connection.

---

## 1️⃣2️⃣ What is the PS1 variable?

`PS1` defines the primary Bash shell prompt appearance.

It controls what information is displayed before each command.

---

## 1️⃣3️⃣ What are common PS1 symbols?

| Symbol | Meaning                                    |
| ------ | ------------------------------------------ |
| `\u`   | Username                                   |
| `\h`   | Hostname                                   |
| `\W`   | Current directory                          |
| `\t`   | Current time                               |
| `\$`   | Displays `$` for normal user, `#` for root |

---

## 1️⃣4️⃣ How do you make a PS1 change permanent?

Edit the `~/.bashrc` file:

```bash
nano ~/.bashrc
```

Add:

```bash
export PS1="[\u@\h \W \t]\$ "
```

Then reload:

```bash
source ~/.bashrc
```

---

## 1️⃣5️⃣ Why is SSH considered secure?

SSH encrypts:

* Authentication credentials
* Command traffic
* File transfers

It uses public-key cryptography to prevent eavesdropping and unauthorized access.

---

📌 This lab reinforces login mechanisms, shell interaction, SSH troubleshooting, and user environment customization — essential skills for Linux system administration and RHCSA certification.

```
