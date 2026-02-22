# 🎤 Interview Q&A – Lab 24: Brace Expansion and Globbing

---

## 1️⃣ What is brace expansion in Bash?

Brace expansion is a mechanism that generates arbitrary strings before command execution.

Example:
```bash
echo file_{1..5}.txt
```

Output:
```
file_1.txt file_2.txt file_3.txt file_4.txt file_5.txt
```

It does NOT depend on existing files.

---

## 2️⃣ What is globbing?

Globbing is pattern matching performed by the shell to match existing filenames.

Example:
```bash
ls *.log
```

Matches all files ending with `.log`.

---

## 3️⃣ What is the difference between brace expansion and globbing?

| Brace Expansion | Globbing |
|----------------|----------|
| Generates strings | Matches existing files |
| Happens before command execution | Happens after brace expansion |
| Does not check file existence | Requires matching files |

---

## 4️⃣ What does `*` represent in globbing?

`*` matches zero or more characters.

Example:
```bash
ls report_*
```

---

## 5️⃣ What does `?` represent?

`?` matches exactly one character.

Example:
```bash
ls file_?.tmp
```

---

## 6️⃣ What does `[abc]` represent?

Matches any one character inside brackets.

Example:
```bash
ls file_[abc]1.tmp
```

Matches `a`, `b`, or `c`.

---

## 7️⃣ How do you match digits using globbing?

Using a range:

```bash
ls data_[0-9].txt
```

Matches any digit 0–9.

---

## 8️⃣ What is extended globbing?

Extended globbing provides advanced pattern matching.

Enable it with:
```bash
shopt -s extglob
```

Patterns include:
- `?(pattern)`
- `*(pattern)`
- `+(pattern)`
- `@(pattern)`
- `!(pattern)`

---

## 9️⃣ Provide a real-world use case of brace expansion.

Creating environment directory structures:

```bash
mkdir -p app/{dev,staging,prod}/{logs,config,tmp}
```

---

## 🔟 How can brace expansion and globbing be combined?

Example:
```bash
touch file_{a..d}{1..3}.tmp
mv file_[a-b]?.tmp backup/
```

Brace expansion creates files.  
Globbing selects specific ones.

---

## 1️⃣1️⃣ Why did `ls report_[0-9]*.log` return an error?

Because no files matched the pattern.

Globbing only matches existing files.

---

## 1️⃣2️⃣ What happens if globbing matches nothing?

By default, Bash returns:
```
No such file or directory
```

Optionally enable:
```bash
shopt -s nullglob
```

To avoid errors.

---

## 1️⃣3️⃣ Is brace expansion recursive?

No. It expands patterns directly and does not perform recursion.

---

## 1️⃣4️⃣ Why are these concepts important for DevOps and SysAdmin roles?

They allow:

- Efficient bulk operations
- Automated deployments
- Log management
- Dynamic scripting
- CI/CD automation
- Configuration management

These are foundational skills in Linux administration and automation engineering.

---

# ✅ Interview Summary

Brace expansion and globbing are:

- Core Bash concepts
- Essential for automation
- Frequently tested in RHCSA/RHEL interviews
- Critical for DevOps and scripting roles

Mastery significantly improves command-line productivity.

---
