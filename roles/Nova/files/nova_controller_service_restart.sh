#!/bin/bash
# 处理api服务
systemctl restart openstack-nova-api
# 处理资源调度服务
systemctl restart openstack-nova-scheduler
# 处理数据库服务
systemctl restart openstack-nova-conductor
# 处理vnc远程窗口服务
systemctl restart openstack-nova-novncproxy
