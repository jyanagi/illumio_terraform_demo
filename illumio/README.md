This repository uses Terraform provision security objects and policies to protect a Kubernetes container cluster with Illumio's Breach Containment Platform.

# Objects Created...
The Terraform files use [Illumio's Terraform Provider](https://registry.terraform.io/providers/illumio/illumio-core/latest/docs), and configures the following resources:

| Labels               | Services       | IP Lists                     |
| ---------------------|----------------|------------------------------|
| L: TF-Demo           | TF-Alt-HTTP(S) | TF-IPL-Illumio               |
| E: TF-Production     | TF-CLAS        | TF-IPL-illumio-kubelink      |
| A: TF-Guestbook      | TF-CVEN        | TF-IPL-illumio-storage       |
| A: TF-k3s            | TF-DNS         | TF-IPL-K8s Pod Networks      |
| R: TF-Frontend       | TF-ETCD        | TF-IPL-K8s Registry          |
| R: TF-k8s Node       | TF-HTTP(S)     | TF-IPL-K8s Services Networks |
| R: TF-Redis Follower | TF-Kube API    | TF-IPL-VPN Users             |
| R: TF-Redis Leader   | TF-Kube etcd   |                              | 
|                      | TF-Redis       |                              | 

# Security Policies 

The following **Security Rules** and **Security Rulesets** are created:

**TF-RS &#124; K8s - Essential Services**

Intra-Scope Rules

| Source | Destination | Destination Service |
|--------|-------------|---------------------|
| TF-IPL-VPN Users | TF-k8s Node | TF-HTTP(S) |
| TF-IPL-K8s Pod Networks | TF-k8s Node | TF-Kube API |
| All Workloads | TF-IPL-illumio-storage | TF-ETCD |
| TF-IPL-illumio-kubelink | All Workloads | TF-ETCD |
| Any (0.0.0.0/0 or ::/0) | TF-k8s Node | TF-Kube etcd |
| TF-IPL-K8s Pod Networks | All Workloads | TF-DNS |
| All Workloads | TF-IPL-K8s POd Networks | All Services |
| TF-IPL-illumio-kubelink | TF-k8s Node | TF-HTTP(S) |
| TF-k8s Node | TF-IPL-K8s Services Networks | TF-CLAS |
| TF-k8s Node | TF-IPL-illumio-kubelink | TF-CVEN |
| TF-k8s Node | TF-IPL-Illumio | TF-Alt-HTTP(S) |
| All Workloads | TF-IPL-K8s Registry | All Services |
| All Worklads <br> Uses Virtual Services only | All Workloads | All Services |

Extra-Scope Rule
| Source | Destination | Destination Service |
|--------|-------------|---------------------|
| TF-Redis Follower | TF-k8s Node | TF-Redis |

**TF-RS &#124; K8s - Guestbook**

Intra-Scope Rules

| Source | Destination | Destination Service |
|--------|-------------|---------------------|
| TF-Frontend | TF-Redis Leader <br> Uses Virtual Services only | |
| TF-Frontend | TF-Redis Follower <br> Uses Virtual Services only | |
| TF-Frontend | TF-Redis Leader | TF-Redis |
| TF-Frontend | TF-Redis Follower | TF-Redis |
| TF-Redis Follower | TF-Redis Leader | TF-Redis |
| TF-IPL-VPN Users | TF-Frontend | TF-HTTP(S) |
| TF-Redis Follower | TF-Redis Leader <br> Uses Virtual Services only | |


Extra-Scope Rule

| Source | Destination | Destination Service |
|--------|-------------|---------------------|
| TF-k8s Node | TF-Frontend | TF-HTTP(S) |

# Other Resources Created...

A **Pairing Profile** is created titled 'TF-K8s Pairing Profile' with a **Container Cluster** titled 'TF-K3s Container Cluster'




