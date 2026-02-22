#!/bin/bash

# View current scheduler
cat /sys/block/sda/queue/scheduler

# Change scheduler temporarily
echo bfq | sudo tee /sys/block/sda/queue/scheduler

# Verify
cat /sys/block/sda/queue/scheduler

# Install monitoring tools
sudo yum install sysstat -y
sudo yum install fio -y

# Monitor I/O
iostat -x 2

# Create test file
dd if=/dev/zero of=testfile bs=1M count=1024 conv=fdatasync

# Clear cache
echo 3 | sudo tee /proc/sys/vm/drop_caches

# Read benchmark
time dd if=testfile of=/dev/null bs=1M

# Random write test
fio --name=random-write --ioengine=posixaio --rw=randwrite --bs=4k \
--size=1g --numjobs=1 --iodepth=1 --runtime=30 --time_based --end_fsync=1

# Sequential read test
fio --name=seq-read --ioengine=posixaio --rw=read --bs=1M \
--size=1g --numjobs=1 --iodepth=32 --runtime=30 --time_based

# Cleanup
rm -f testfile
