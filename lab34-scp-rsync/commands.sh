# ==========================================
# Lab 34 – File Transfer with scp and rsync
# Local:  toor@ip-172-31-10-412
# Remote: student@192.168.56.20
# ==========================================

# ------------------------------------------------
# PREREQUISITE VERIFICATION
# ------------------------------------------------

# Check SSH service
sudo systemctl status ssh

# Verify rsync installation
rsync --version


# ------------------------------------------------
# TASK 1: Secure File Transfer with scp
# ------------------------------------------------

# 1.1 Create Test File
echo "This is a test file" > local_file.txt
cat local_file.txt

# Transfer file to remote
scp local_file.txt student@192.168.56.20:/home/student/

# Verify on remote
ssh student@192.168.56.20 "cat /home/student/local_file.txt"


# ------------------------------------------------
# 1.2 Directory Transfer with scp
# ------------------------------------------------

mkdir local_dir
touch local_dir/file{1..3}.txt
ls local_dir

# Transfer directory recursively
scp -r local_dir student@192.168.56.20:/home/student/

# Verify on remote
ssh student@192.168.56.20 "ls -l /home/student/local_dir"


# ------------------------------------------------
# TASK 2: File Synchronization with rsync
# ------------------------------------------------

# Modify a file
echo "Updated content" >> local_dir/file1.txt

# Sync local to remote
rsync -avz local_dir/ student@192.168.56.20:/home/student/remote_dir/

# Verify on remote
ssh student@192.168.56.20 "ls -l /home/student/remote_dir"


# ------------------------------------------------
# 2.2 Incremental Backup (Local)
# ------------------------------------------------

mkdir backup

# First backup
rsync -av --delete local_dir/ backup/

# Modify file
echo "New line" >> local_dir/file2.txt

# Incremental update
rsync -av --delete local_dir/ backup/


# ------------------------------------------------
# TASK 3: Secure rsync Over SSH
# ------------------------------------------------

rsync -avz -e ssh local_dir/ student@192.168.56.20:/home/student/secure_backup/

# Verify on remote
ssh student@192.168.56.20 "ls -l /home/student/secure_backup"


# ------------------------------------------------
# Advanced rsync Options
# ------------------------------------------------

# Partial transfer with progress
rsync -avz --partial --progress -e ssh local_file.txt student@192.168.56.20:/home/student/

# Bandwidth limit (100 KB/s)
rsync -avz --bwlimit=100 -e ssh local_dir/ student@192.168.56.20:/home/student/bandwidth_test/


# ------------------------------------------------
# CLEANUP
# ------------------------------------------------

rm -rf local_file.txt local_dir backup

ssh student@192.168.56.20 \
"rm -rf /home/student/{local_dir,remote_dir,secure_backup,bandwidth_test,local_file.txt}"
