# Security Policy

**The Kryonux Project** takes the security of the `kpkg` recipes seriously, including source URLs, checksums and build steps. We appreciate responsible disclosure of any vulnerabilities.

## 1. Supported Versions

Because Kryonux is under active development, fixes are only applied to the `master` branch:

| Version / Branch | Supported |
| :--- | :--- |
| `master` (Latest) | :white_check_mark: Yes |
| Older snapshots / tags | :x: No |

## 2. Reporting a Vulnerability

**Please do NOT report security vulnerabilities through public GitHub Issues, discussions, or pull requests.** Publicly disclosing an unpatched flaw in a recipe puts users at immediate risk.

Instead, please report vulnerabilities privately using one of the following methods:
1. **GitHub Private Vulnerability Reporting (Preferred):** Go to the **Security** tab of this repository and click **"Report a vulnerability"**.
2. **Email:** Send an encrypted or plain-text report to `wh1laye@gmail.com`.

### What to Include in Your Report
To help us triage and fix the issue quickly, please include:
* A clear description of the vulnerability and its potential impact (for example a swapped source URL, a wrong checksum or malicious build steps).
* Affected component (the recipe path) and commit hash.
* Step-by-step instructions or a Proof-of-Concept (PoC) to reproduce the issue.

## 3. Disclosure Process

* **Acknowledgment:** We will confirm receipt of your report within **48–72 hours**.
* **Investigation & Fix:** We will work to verify the vulnerability and prepare a patch for the `master` branch.
* **Public Disclosure:** Once a fix is released, we will publish a security advisory and credit you for the discovery (unless you prefer to remain anonymous).

---
*Copyright © 2026 The Kryonux Project. Licensed under GNU GPLv3.*
