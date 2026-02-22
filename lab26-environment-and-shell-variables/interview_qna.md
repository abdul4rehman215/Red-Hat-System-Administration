# 🎤 Interview Q&A – Lab 26: Environment and Shell Variables

---

## 1️⃣ What is the difference between a shell variable and an environment variable?

- **Shell Variable**: Exists only in the current shell session.
- **Environment Variable**: Exported variable that is inherited by child processes.

Example:
```bash
VAR="test"        # Shell variable
export VAR="test" # Environment variable
```

---

## 2️⃣ How do you list all environment variables?

```bash
printenv
```

Or:
```bash
env
```

---

## 3️⃣ How do you view the value of a specific variable?

```bash
echo $HOME
echo $PATH
```

---

## 4️⃣ What does the `export` command do?

It makes a variable available to child processes.

Without `export`, the variable is local to the current shell.

---

## 5️⃣ How do you make an environment variable persistent?

Add it to:

```bash
~/.bashrc
```

Then reload:

```bash
source ~/.bashrc
```

---

## 6️⃣ What is the PATH variable?

`PATH` defines directories the shell searches for executable commands.

Example:
```bash
echo $PATH
```

---

## 7️⃣ What is variable scope in Bash?

Scope determines where a variable is accessible.

- Global variable → Available throughout script
- Local variable → Declared using `local` inside function

Example:
```bash
local var="value"
```

---

## 8️⃣ What is command substitution?

It allows storing command output inside a variable.

Example:
```bash
user=$(whoami)
```

---

## 9️⃣ What happens if you don’t use double quotes around variables?

Word splitting and globbing may occur.

Correct usage:
```bash
echo "$var"
```

Safer practice:
```bash
echo "${var}"
```

---

## 🔟 How do you load variables from a configuration file?

Using:

```bash
source config.cfg
```

This imports variables defined in the file into the script.

---

## 1️⃣1️⃣ What are some special Bash variables?

| Variable | Meaning |
|----------|----------|
| `$?` | Exit status of last command |
| `$$` | Current process ID |
| `$0` | Script name |
| `$#` | Number of arguments |
| `$@` | All arguments |

---

## 1️⃣2️⃣ What is the difference between `env` and `set`?

- `env` → Shows environment variables only
- `set` → Shows both shell and environment variables

---

## 1️⃣3️⃣ Why are environment variables important in DevOps?

They are used for:

- Application configuration
- Secret management
- Container configuration
- CI/CD pipelines
- Infrastructure automation

---

## 1️⃣4️⃣ How are variables used in automation?

Variables allow:

- Dynamic script behavior
- Reusable configuration
- Reduced hardcoding
- Environment-specific deployments

---

## 1️⃣5️⃣ Where are system-wide environment variables stored?

Common locations:

- `/etc/environment`
- `/etc/profile`
- `/etc/bash.bashrc`

---

# ✅ Interview Summary

Understanding environment and shell variables is critical for:

- Bash scripting
- DevOps automation
- Configuration management
- Container environments
- Cloud-native systems

These concepts are foundational for advanced Linux and RHCSA-level skills.

---
