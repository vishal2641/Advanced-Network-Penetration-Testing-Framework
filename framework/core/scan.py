import subprocess

def nmap_scan(target):
    print(f"[INFO] Scanning target: {target}")
    result = subprocess.run(['nmap', '-sV', target], capture_output=True, text=True)
    print(result.stdout)
    return result.stdout

if __name__ == "__main__":
    target_ip = "192.168.1.1"
    nmap_scan(target_ip)
