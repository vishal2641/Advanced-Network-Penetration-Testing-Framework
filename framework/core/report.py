from jinja2 import Template

def generate_report(scan_results, exploit_results):
    template = Template("""
    # Penetration Test Report

    ## Scan Results
    {{ scan_results }}

    ## Exploitation Results
    {{ exploit_results }}
    """)
    
    report = template.render(scan_results=scan_results, exploit_results=exploit_results)
    with open('report.md', 'w') as report_file:
        report_file.write(report)
    print("[INFO] Report generated as report.md")

if __name__ == "__main__":
    scan_results = "Sample Scan Results"
    exploit_results = "Sample Exploit Results"
    generate_report(scan_results, exploit_results)
