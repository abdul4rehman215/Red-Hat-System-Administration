# 🎤 Interview Q&A – Lab 19: Managing Logical Volumes with LVM

---

## 1️⃣ What is LVM?

Logical Volume Manager is a storage abstraction layer that allows flexible disk management.

---

## 2️⃣ What are LVM components?

- PV → Physical Volume
- VG → Volume Group
- LV → Logical Volume

---

## 3️⃣ How do you create a physical volume?

```bash
pvcreate /dev/sdb
```

---

## 4️⃣ How do you extend a logical volume?

```bash
lvextend -L +2G /dev/my_vg/my_lv
resize2fs /dev/my_vg/my_lv
```

---

## 5️⃣ Why is resize2fs required?

Because resizing the LV does not automatically resize the filesystem.

---

## 6️⃣ What is an LVM snapshot?

A point-in-time copy of a logical volume used for backup or rollback.

---

## 7️⃣ How do you restore from snapshot?

```bash
lvconvert --merge snapshot_name
```

---

## 8️⃣ Can LVM be resized online?

Yes — extending volumes can be done online (filesystem dependent).

---

## 9️⃣ Why use LVM in production?

- Dynamic resizing
- Snapshot support
- Disk aggregation
- High availability support

---

## 🔟 What happens if snapshot space fills?

Snapshot becomes invalid and may corrupt rollback capability.
