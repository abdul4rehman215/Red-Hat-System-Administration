#!/bin/bash
# ==========================================
# Lab 03 - Managing Files and Directories via CLI
# Commands Executed During Lab
# ==========================================

# ------------------------------
# Task 1: Creating Files and Directories
# ------------------------------

pwd

mkdir lab3_files

ls

cd lab3_files

pwd

touch notes.txt

ls


# ------------------------------
# Task 2: Copying and Moving Files
# ------------------------------

cp notes.txt notes_backup.txt

ls

mkdir backup

mv notes_backup.txt backup/

ls backup/


# ------------------------------
# Task 3: Exploring File Metadata
# ------------------------------

ls -l

stat notes.txt


# ------------------------------
# Task 4: Redirecting Output
# ------------------------------

ls -l > file_list.txt

cat file_list.txt

stat notes.txt >> file_list.txt

cat file_list.txt


# ------------------------------
# Task 5: Deleting Files and Directories
# ------------------------------

rm notes.txt

ls

rm -r backup

ls
