# Networking: Domain + EC2 + DNS

## Overview
This project involved deploying a web server on AWS EC2 and connecting it to a custom domain using Route 53. It helped me understand how DNS, IP addresses, security groups and web servers work together to make a website accessible over the internet.

## What I Built
- Domain: `awais04.co.uk` (Route 53)
- EC2 instance: Ubuntu running NGINX
- Elastic IP: Static public IPv4 associated with my EC2 instance
- DNS: A record `awais04.co.uk` pointing to the EC2 Elastic IP
- Security group: HTTP (port 80) and HTTPS (port 443) allowed, SSH (port 22) restricted to my IP

## Architecture
Browser -> DNS lookup (A record) -> EC2 public IP -> NGINX (port 80)

## Steps
1. Bought the domain through Route 53
2. Reused my existing EC2 instance and configured the security group
3. Installed and started NGINX
4. Associated an Elastic IP with the EC2 instance
5. Created the A record in Route 53 pointing my domain to the Elastic IP
6. Verified DNS resolution using `dig`
7. Tested the domain in the browser and confirmed the NGINX welcome page loaded

## Screenshots
| What | File |
|---|---|
| EC2 instance running | `screenshots/ec2-instance.png` |
| Security group rules | `screenshots/security-group.png` |
| DNS A record | `screenshots/dns-record.png` |
| NGINX page on my domain | `screenshots/nginx-page.png` |

## What I Learnt
- How DNS translates domain names into IP addresses
- The difference between public and private IP addresses
- How A records map domains to IPv4 addresses
- The purpose of Elastic IPs
- How security groups control inbound traffic to EC2
- How ports allow services to communicate
- How to connect to a remote server using SSH
- How to install and manage services using `systemctl`
- How NGINX serves web pages over HTTP
- How to verify DNS resolution using `dig` and test connectivity using `curl`

## Challenges and Solutions
| Challenge | How I solved it |
|---|---|
| SSH connection initially failed | Used the correct Ubuntu username (`ubuntu`) instead of `ec2-user` |
| Understanding how my domain connects to EC2 | Created an A record pointing to my Elastic IP and verified it using `dig` |
| Understanding the role of different AWS networking components | Worked through how EC2, Elastic IP, security groups, Route 53 and DNS work together |

