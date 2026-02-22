# ==========================================
# Lab 33 – Archiving Files with tar
# Environment: Ubuntu 24.04
# User: toor
# ==========================================

# ------------------------------------------------
# TASK 1: Create Sample Files
# ------------------------------------------------

mkdir lab_files
cd lab_files

touch file1.txt file2.txt file3.txt

echo "This is file1" > file1.txt
echo "This is file2" > file2.txt
echo "This is file3" > file3.txt

ls -l


# ------------------------------------------------
# TASK 2: Create .tar Archive
# ------------------------------------------------

tar -cvf archive.tar file1.txt file2.txt file3.txt

ls -l

tar -tvf archive.tar


# ------------------------------------------------
# TASK 3: Compress Archive with gzip
# ------------------------------------------------

gzip archive.tar

ls -lh archive.tar.gz


# ------------------------------------------------
# TASK 4: Compress Archive with bzip2
# ------------------------------------------------

# Recreate tar archive
tar -cvf archive.tar file1.txt file2.txt file3.txt

bzip2 archive.tar

ls -lh archive.tar.*


# ------------------------------------------------
# TASK 5: Extract .tar Archive
# ------------------------------------------------

# Recreate archive
tar -cvf archive.tar file1.txt file2.txt file3.txt

rm file1.txt file2.txt file3.txt

tar -xvf archive.tar

ls


# ------------------------------------------------
# TASK 6: Extract .tar.gz Archive
# ------------------------------------------------

rm file1.txt file2.txt file3.txt

tar -xzvf archive.tar.gz

ls


# ------------------------------------------------
# TASK 7: Extract .tar.bz2 Archive
# ------------------------------------------------

rm file1.txt file2.txt file3.txt

tar -xjvf archive.tar.bz2

ls


# ------------------------------------------------
# OPTIONAL: Archive Nested Directory
# ------------------------------------------------

mkdir -p project/src

tar -czvf project_archive.tar.gz project/

ls -lh project_archive.tar.gz


# ------------------------------------------------
# OPTIONAL: Automation Script Example
# ------------------------------------------------

nano archive_logs.sh

# Add inside script:
# #!/bin/bash
# tar -czvf logs_archive.tar.gz /var/log/*.log
# echo "Logs archived and compressed!"

chmod +x archive_logs.sh

./archive_logs.sh


# ------------------------------------------------
# CLEANUP (Optional)
# ------------------------------------------------

cd ..
rm -rf lab_files
