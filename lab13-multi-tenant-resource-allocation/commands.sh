#!/bin/bash
# ==========================================
# Lab 13 - Multi-Tenant Resource Allocation
# OpenStack CLI Commands Executed
# ==========================================


# ------------------------------
# Lab Setup Verification
# ------------------------------

openstack --version

source admin-openrc.sh

openstack token issue


# ------------------------------
# Task 1: Create Projects (Tenants)
# ------------------------------

openstack project create --description "Tenant A" tenant_a
openstack project create --description "Tenant B" tenant_b


# ------------------------------
# Create Users for Each Tenant
# ------------------------------

openstack user create --project tenant_a --password nafi123 user_a
openstack user create --project tenant_b --password nafi123 user_b

openstack user list


# ------------------------------
# Task 2: Configure Compute Quotas
# ------------------------------

openstack quota set --cores 4 --ram 8192 tenant_a
openstack quota set --cores 2 --ram 4096 tenant_b


# ------------------------------
# Configure Network Quotas
# ------------------------------

openstack quota set --networks 2 --ports 5 tenant_a


# ------------------------------
# Configure Storage Quotas
# ------------------------------

openstack quota set --gigabytes 50 tenant_b


# ------------------------------
# Verify Quotas
# ------------------------------

openstack quota show tenant_a
openstack quota show tenant_b


# ------------------------------
# Task 3: Monitor Usage
# ------------------------------

openstack usage list


# ------------------------------
# Adjust Quotas Dynamically
# ------------------------------

openstack quota set --ram 12288 tenant_a

openstack quota show tenant_a | grep ram


# ------------------------------
# Final Verification
# ------------------------------

openstack project list
openstack quota show tenant_a
openstack usage list
