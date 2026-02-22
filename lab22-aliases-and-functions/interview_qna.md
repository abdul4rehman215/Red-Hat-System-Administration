# 🎤 Interview Q&A – Lab 22: Aliases and Functions

---

## 1️⃣ What is an alias in Bash?

An alias is a shortcut or alternative name for a longer command. It allows users to reduce typing and standardize frequently used command options.

Example:
```bash
alias ll='ls -alF'
```

---

## 2️⃣ What is the difference between a temporary and persistent alias?

- **Temporary alias**: Exists only in the current shell session.
- **Persistent alias**: Stored in `~/.bashrc` or `~/.bash_profile`, available across sessions after reloading or logging in again.

---

## 3️⃣ Where are aliases typically stored for persistence?

Aliases are typically added to:

```
~/.bashrc
```

After editing, changes must be applied using:

```bash
source ~/.bashrc
```

---

## 4️⃣ How can you view all currently defined aliases?

Use the command:

```bash
alias
```

To view a specific alias:

```bash
alias ll
```

---

## 5️⃣ What is a shell function?

A shell function is a reusable block of commands grouped together under a name. Functions can accept parameters and contain logic like conditionals and loops.

Example:
```bash
function pcount() {
  podman ps -a
  echo "Total containers: $(podman ps -a -q | wc -l)"
}
```

---

## 6️⃣ How do functions differ from aliases?

| Alias | Function |
|--------|-----------|
| Simple command substitution | Can contain multiple commands |
| No parameters | Can accept parameters |
| Limited logic | Supports conditionals and loops |

Functions are more powerful and flexible.

---

## 7️⃣ How can you pass arguments to a shell function?

Arguments are accessed using positional parameters:

- `$1` → First argument
- `$2` → Second argument

Example:
```bash
function cstate() {
 if [ "$1" = "start" ]; then
  podman start $2
 fi
}
```

---

## 8️⃣ Why must `expand_aliases` be enabled in scripts?

By default, aliases are not expanded in non-interactive shells. To use aliases inside scripts:

```bash
shopt -s expand_aliases
```

This ensures aliases work inside `.sh` files.

---

## 9️⃣ How can you remove an alias?

Use:

```bash
unalias alias_name
```

Example:
```bash
unalias ll
```

---

## 🔟 What is the benefit of using functions for container management?

Functions allow:

- Grouped command execution
- Reusable automation logic
- Parameter-based container control
- Cleaner administrative workflows

This improves operational efficiency in containerized environments.

---

## 1️⃣1️⃣ Why is sourcing `.bashrc` necessary after modification?

When `.bashrc` is modified, changes do not apply automatically to the current session. Running:

```bash
source ~/.bashrc
```

Reloads the configuration without restarting the terminal.

---

## 1️⃣2️⃣ What security considerations exist when creating aliases?

- Avoid embedding passwords inside aliases.
- Be cautious when overriding critical system commands.
- Avoid masking important commands like `rm`, `cp`, `mv` unintentionally.

---

## 1️⃣3️⃣ Can aliases override system commands?

Yes.

Example:
```bash
alias rm='rm -i'
```

This forces interactive deletion. However, misuse can cause confusion or unexpected behavior.

---

## 1️⃣4️⃣ What is the purpose of the `pclean` function?

The `pclean` function:

- Removes unused containers
- Removes unused images
- Frees disk space
- Maintains container environment hygiene

---

## 1️⃣5️⃣ How do aliases and functions improve DevOps workflows?

They:

- Reduce repetitive typing
- Standardize command execution
- Simplify complex tasks
- Enable reusable automation
- Improve operational speed

---

# 🎯 Summary

This lab demonstrates practical use of aliases and functions to automate container management tasks and improve Linux administrative efficiency in production-like environments.
