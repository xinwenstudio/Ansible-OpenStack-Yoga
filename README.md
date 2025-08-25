# Ansible-OpenStack-Yoga 自动化部署仓库

## 📖 项目简介

本项目是一个基于 **Ansible** （社区版）自动化工具构建的 OpenStack 部署与管理解决方案。它旨在通过 Infrastructure as Code (IaC) 的理念，实现 OpenStack 云平台在CentOS-Stream 9上的**一键式部署**、**标准化配置**和**可重复运维**。

仓库提供了一套能够能够使得OpenStack完成最基本功能的 Ansible Roles 和打包好的 Collections，极大地简化了 OpenStack 复杂环境的安装和生命周期管理流程，使部署工作变得高效、可靠且易于维护。

## 🧩 仓库内容概览

### 1. 🧱 基础角色 (Roles)

本项目由一系列模块化的Ansible角色构成，每个角色负责部署一个独立的服务或完成一项特定的初始化任务。

| 角色名称 | 功能简介 |
| :--- | :--- |
| **`configure_local_repo`** | **基础配置**: 为目标主机配置本地Yum/DNF软件源，用于加速部署和离线环境安装。 |
| **`init_env`** | **基础配置**: 初始化服务器环境，包括安装基础依赖包、关闭防火墙、SELinux、和写入hosts文件等。 |
| **`db_server`** | **基础服务**: 安装并配置数据库服务（本仓库中使用MariaDB），为OpenStack各组件提供数据存储。 |
| **`rabbitmq`** | **基础服务**: 安装并配置RabbitMQ消息队列服务，为OpenStack各组件提供异步通信能力。 |
| **`memcache`** | **基础服务**: 安装并配置Memcached缓存服务，主要用于Keystone的令牌缓存。 |
| **`keystone`** | **核心服务**: 安装并配置OpenStack身份认证服务（Keystone），提供认证和授权功能。 |
| **`placement`** | **核心服务**: 安装并配置资源放置API服务（Placement），用于跟踪和选择资源提供商。 |
| **`glance`** | **核心服务**: 安装并配置镜像服务（Glance），用于管理虚拟机镜像。 |
| **`cinder`** | **核心服务**: 安装并配置块存储服务（Cinder），为实例提供持久的块存储设备。 |
| **`nova`** | **核心服务**: 安装并配置计算服务（Nova），用于管理和调度虚拟机实例。 |
| **`neutron`** | **核心服务**: 安装并配置网络服务（Neutron），为实例提供网络连接即服务（Networking-as-a-Service）。 |
| **`dashboard`** | **核心服务**: 安装并配置Web控制台（Horizon），为OpenStack提供图形化管理界面。 |
| **`skyline`** | **监控服务**: （可选）安装并配置Skyline或其他监控组件，用于监控OpenStack集群状态。 |
| **`Ceph`** | **存储后端**: 该部分为OpenStack提供可靠稳定的存储后端。 |

---

### 📖 角色内容详解
角色内容详解请参考每个角色内部的README.md文件

### 2. 📦 集合 (Collections)
为了关照一些网络环境不好或者是需要离线部署的情况，此仓库中会在release中上上传打包好的collection集合包，你也可以通过仓库中的requirements.yaml来进行下载。


### 3. 🚀 剧本示例 (Sample Playbooks)
提供 `site.yml`, `setup-hosts.yml` 等顶层剧本示例，清晰地展示了如何组合不同的 Roles 来完成从基础环境准备到全套 OpenStack 服务部署的完整流程。

## ⚡ 核心特性

- **即插即用**：通过修改清单文件 `inventory` 和变量文件 `group_vars/` 即可快速适配新环境。
- **灵活性强**：支持 All-in-One 及多节点高可用等多种部署架构。
- **最佳实践**：遵循 Ansible 官方指南，代码结构清晰，注释完整。
- **幂等性**：剧本支持多次安全运行，自动处理已部署状态，确保系统一致性。
- **文档齐全**：提供详细的部署指南、变量说明和常见问题解答。

## 🎯 目标用户

- **运维工程师**：需要快速搭建或标准化 OpenStack 环境的团队。
- **开发者和测试人员**：需要快速构建和销毁 OpenStack 测试平台。
- **云技术爱好者**：希望学习和理解 OpenStack 组件及其自动化部署方式。

## 🚦 快速开始

1.  **克隆本仓库**
    ```bash
    git clone <您的仓库地址>
    cd openstack-ansible-deploy
    ```

2.  **配置清单和变量**
    - 编辑 `inventory/hosts` 文件，定义您的目标主机。
    - 修改 `group_vars/all.yml` 等文件，设置网络参数、密码等自定义变量。

3.  **执行部署**
    ```bash
    # 安装依赖的 Collections
    ansible-galaxy collection install -r requirements.yml

    # 部署基础环境
    ansible-playbook -i inventory/hosts setup-hosts.yml

    # 部署 OpenStack 核心服务
    ansible-playbook -i inventory/hosts site.yml
    ```

**详细部署文档，请参阅 [docs/部署指南.md](docs/部署指南.md)。**

## 💡 贡献

我们欢迎任何形式的贡献！包括但不限于：
- 提交 Issue 报告 Bug 或提出新功能建议。
- 发起 Pull Request 来改进代码或文档。
- 分享您的使用经验和最佳实践。

---

**如果这个项目对您有帮助，请别忘了点一个 ⭐ Star！**
<p align="center">
  <img src="https://img.shields.io/badge/CentOS-262577?style=for-the-badge&logo=CentOS&logoColor=white" alt="CentOS">
  <img src="https://img.shields.io/badge/Ansible-EE0000?style=for-the-badge&logo=ansible&logoColor=white" alt="Ansible">
  <img src="https://img.shields.io/badge/OpenStack-ED1944?style=for-the-badge&logo=openstack&logoColor=white" alt="OpenStack">
</p>
