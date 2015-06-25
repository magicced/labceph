#!/bin/bash

for i in $(virsh vol-list default | grep ceph | awk '{print $1}'); do virsh vol-delete --vol $i --pool default; done

virsh detach-disk --domain cephosd1 vdb
virsh detach-disk --domain cephosd2 vdb
virsh detach-disk --domain cephosd3 vdb

virsh detach-disk --domain cephosd1 vdc
virsh detach-disk --domain cephosd2 vdc
virsh detach-disk --domain cephosd3 vdc
