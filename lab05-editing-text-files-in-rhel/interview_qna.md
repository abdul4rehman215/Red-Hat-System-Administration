# 🎤 Interview Q&A – Lab 05: Editing Text Files in RHEL

---

## 1️⃣ What is the difference between `vim` and `nano`?

**Answer:**

- `vim` is a modal editor (Normal, Insert, Visual modes).
- `nano` is modeless and beginner-friendly.
- `vim` is powerful and widely used in enterprise environments.
- `nano` is simpler and better for quick edits.

---

## 2️⃣ How do you save and exit in vim?

**Answer:**

- `ESC` → Exit insert mode
- `:w` → Save
- `:q` → Quit
- `:wq` → Save and quit
- `:q!` → Quit without saving

---

## 3️⃣ What does `sed -i` do?

**Answer:**

The `-i` flag edits a file **in place** (modifies the original file directly).

Example:

```bash
sed -i 's/old/new/g' filename.txt
````

---

## 4️⃣ How can you create a backup before editing with sed?

**Answer:**

```bash
sed -i.bak 's/old/new/g' filename.txt
```

This creates:

```
filename.txt.bak
```

---

## 5️⃣ What does the `g` flag mean in sed substitution?

**Answer:**

`g` means **global replacement** (replace all occurrences in a line).

Without `g`, only the first match per line is replaced.

---

## 6️⃣ How do you delete lines matching a pattern using sed?

**Answer:**

```bash
sed -i '/pattern/d' filename.txt
```

This deletes lines containing the specified pattern.

---

## 7️⃣ What does `awk -F ','` mean?

**Answer:**

`-F ','` sets the **field separator** to comma.

This is commonly used for CSV files.

---

## 8️⃣ How do you print a specific column using awk?

**Answer:**

```bash
awk -F ',' '{print $2}' users.csv
```

`$2` refers to the second column.

---

## 9️⃣ How do you filter rows based on a condition using awk?

**Answer:**

```bash
awk -F ',' '$3 == "RHEL" {print $0}' users.csv
```

This prints rows where the third column equals `"RHEL"`.

---

## 🔟 Why are sed and awk important in DevOps?

**Answer:**

They are essential for:

* Log processing
* Configuration automation
* CI/CD pipelines
* Data transformation
* Bulk text manipulation
* Parsing structured files

---

## 1️⃣1️⃣ What is the difference between `$0`, `$1`, `$2` in awk?

**Answer:**

* `$0` → Entire line
* `$1` → First field
* `$2` → Second field
* `$n` → nth field

---

## 1️⃣2️⃣ When would you use vim over nano?

**Answer:**

Use `vim` when:

* Working on production servers
* Editing large configuration files
* Using advanced navigation and search
* Performing bulk edits

Most enterprise Linux systems default to vim.

---

## 1️⃣3️⃣ What happens if you forget `-i` in sed?

**Answer:**

Without `-i`, sed outputs changes to **stdout only**.

The file will not be modified unless redirected:

```bash
sed 's/old/new/g' file.txt > newfile.txt
```

---

# ✅ Interview Readiness Summary

This lab demonstrates:

* Practical Linux editing skills
* Text manipulation proficiency
* Structured data processing
* Automation-ready command knowledge

These skills are fundamental for:

* RHCSA certification
* Linux System Administration
* DevOps Engineering
* Cloud Infrastructure Roles
* Security Log Analysis
