#!/bin/bash
# ==========================================
# Lab 05 - Editing Text Files in RHEL
# Commands Executed During Lab
# ==========================================

# ------------------------------
# Task 1: Editing Files with vim
# ------------------------------

pwd

vim lab5_vim.txt

cat lab5_vim.txt


# ------------------------------
# Task 1: Editing Files with nano
# ------------------------------

nano lab5_nano.txt

cat lab5_nano.txt


# ------------------------------
# Task 2: Inline Text Replacement with sed
# ------------------------------

echo -e "RHEL 8\nRHEL 9\nFedora 38" > versions.txt

cat versions.txt

sed -i 's/RHEL/Red Hat/g' versions.txt

cat versions.txt

sed -i.bak 's/Red Hat/RHEL/g' versions.txt

ls

sed -i '/Fedora/d' versions.txt

cat versions.txt


# ------------------------------
# Task 3: Text Processing with awk
# ------------------------------

echo -e "ID,Name,OS\n1,Alice,RHEL\n2,Bob,Fedora" > users.csv

cat users.csv

awk -F ',' '{print $2}' users.csv

awk -F ',' '$3 == "RHEL" {print $0}' users.csv


# ------------------------------
# Final Verification
# ------------------------------

ls -l lab5_*.txt versions.txt users.csv
