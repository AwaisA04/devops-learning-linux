# Networking – Commands & Notes

## 1. System Information & Inspection

### Check Linux distribution and version
```bash
cat /etc/os-release
```
Displays information about the installed operating system, including its name, version and codename.

### Check memory usage
```bash
free -h
```
Displays RAM and swap usage in a human-readable format.

### Display current working directory
```bash
pwd
```
Prints the absolute path of the directory you're currently in.

### List files, including hidden files
```bash
ls -la
```
Displays all files and directories, including hidden files, permissions, ownership and file sizes.

---

## 2. Package Management

### Update package lists
```bash
sudo apt update
```
Refreshes package information from Ubuntu repositories.

### Install NGINX
```bash
sudo apt install nginx -y
```
Installs the NGINX web server. The `-y` flag automatically confirms installation prompts.

---

## 3. Linux Services – systemd

### Check NGINX status
```bash
sudo systemctl status nginx
```
Displays the status of the NGINX service and confirms whether it is running.

### Start NGINX
```bash
sudo systemctl start nginx
```
Starts NGINX if it is stopped.

### Stop NGINX
```bash
sudo systemctl stop nginx
```
Stops the running NGINX service.

### Restart NGINX
```bash
sudo systemctl restart nginx
```
Stops and starts NGINX again. Useful after configuration changes.

### Enable NGINX at boot
```bash
sudo systemctl enable nginx
```
Configures NGINX to start automatically when the server boots.

---

## 4. HTTP & Web Server Connectivity

### Test NGINX locally
```bash
curl http://localhost
```
Sends an HTTP request to the local machine. Used to confirm NGINX is responding locally.

### Retrieve HTTP response headers
```bash
curl -I http://awais04.co.uk
```
Displays HTTP response headers without downloading the full webpage.

Useful for checking:
- HTTP response status
- Content type
- Server response headers

### Test the website using its public IP
```bash
curl http://13.43.176.0
```
Tests whether the web server is reachable through the EC2 instance's public IP address.

---

## 5. DNS and Connectivity Checks

### Resolve domain using nslookup
```bash
nslookup awais04.co.uk
```
Queries DNS to retrieve the IP address associated with the domain.

### Resolve domain using dig
```bash
dig awais04.co.uk
```
Performs a DNS lookup and displays detailed information about the domain's resolution.

### Query the domain's IPv4 address
```bash
dig awais04.co.uk A
```
Queries specifically for the A record, which maps the domain to an IPv4 address.

### Inspect HTTP response headers
```bash
curl -I http://awais04.co.uk
```
Retrieves HTTP response headers without downloading the full webpage. Useful for checking the HTTP status code and server response.

### Ping a domain
```bash
ping awais04.co.uk
```
Sends ICMP echo requests to test network reachability and measure response times.

Note: Ping may fail even when a website works because ICMP traffic may be blocked.

---

## 6. Hosts File Exercise

### Edit the hosts file
```bash
sudo nano /etc/hosts
```
Opens the local hosts file for editing, allowing you to manually map IP addresses to hostnames.

### Example hosts entry
```text
13.43.176.0 awais04.co.uk
```
Maps the domain to the specified IP locally. This only affects the machine where the entry is added and does not change public DNS records.

### Nano keyboard shortcuts
- `Ctrl + O` – Save changes (Write Out)
- `Enter` – Confirm filename
- `Ctrl + X` – Exit Nano

---

## 7. SSH – Remote Server Access

### Connect to EC2 using SSH
```bash
ssh -i "Utility key.pem" ubuntu@13.43.176.0
```
Connects to the EC2 Ubuntu server using SSH authentication with the specified private key.

- `ssh` – Secure Shell client
- `-i` – Specifies the identity/private key file
- `ubuntu` – Default username for the Ubuntu EC2 image
- `13.43.176.0` – Public IPv4 address of the server

The private key must have appropriately restricted permissions and must never be uploaded to GitHub.

### Change directory
```bash
cd keys
```
Changes the current working directory to `keys`.

### Open current directory in Windows File Explorer (WSL)
```bash
explorer.exe .
```
Opens the current WSL directory in Windows File Explorer.

---

## 8. File and Directory Navigation

### Change directory
```bash
cd ~/keys
```
Navigates to the keys directory inside your home directory.

### List directory contents
```bash
ls -la
```
Displays files, including hidden files, along with permissions and other details.

### Print current location
```bash
pwd
```
Displays the full path of the current working directory.

---

## 9. Networking Project – Essential Commands

| Command | Purpose |
|---|---|
| `sudo apt update` | Refresh package lists |
| `sudo apt install nginx -y` | Install NGINX |
| `sudo systemctl status nginx` | Verify NGINX is running |
| `sudo systemctl start nginx` | Start NGINX |
| `sudo systemctl stop nginx` | Stop NGINX |
| `sudo systemctl restart nginx` | Restart NGINX |
| `sudo systemctl enable nginx` | Enable NGINX at boot |
| `curl http://localhost` | Test the web server locally |
| `curl -I http://awais04.co.uk` | Inspect HTTP response headers |
| `curl http://13.43.176.0` | Test the web server through the public IP |
| `dig awais04.co.uk A` | Verify DNS A record resolution |
| `ssh -i "Utility key.pem" ubuntu@13.43.176.0` | Connect remotely to EC2 |
| `cat /etc/os-release` | Identify OS version |
| `free -h` | Inspect memory usage |

---

## 10. Additional Networking Commands to Practise

```bash
nslookup awais04.co.uk
dig awais04.co.uk
dig awais04.co.uk A
curl -I http://awais04.co.uk
ping awais04.co.uk
sudo nano /etc/hosts
```

These commands are useful for DNS resolution, connectivity troubleshooting, inspecting HTTP responses and understanding local hostname resolution.