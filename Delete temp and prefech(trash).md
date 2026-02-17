
Overview
This batch file deletes temporary files and Windows Prefetch cache files.

It is intended for:
Cleaning temporary files
Removing cached Prefetch data
Basic system maintenance testing

This script is provided for educational and maintenance purposes only.


File Name
Delete temp and prefech(trash).bat

Important Instructions (Before Running)

Before executing the script, you must manually open the Prefetch folder once.

1. Open the following path in File Explorer:
   C:/Windows/Prefech
2. Wait until the folder fully loads.
3. Close the File Explorer window.
4. Run the batch file.

If You See This Error

File not found - Prefech

Repeat the same process:

1. Open:
   
C:/Windows/Prefech

2. Close File Explorer.
3. Run the script again.


What the Script Does

The script:
Deletes files inside temporary directories
Deletes files inside the Prefetch folder

The script does "not":
Modify Windows registry
Install software
Download external files
Execute hidden background processes
Change system configuration


Security & Risk Notice

Batch files (.bat) are executable scripts and may be flagged by antivirus software or Windows SmartScreen.

To ensure transparency:

The source code is fully visible and readable.
No obfuscated or encoded commands are used.
No external network communication occurs.
No privilege escalation techniques are included.

Users are strongly encouraged to:

Open the .bat file in a text editor before running it.
Review all commands to understand what will be deleted.
Avoid running modified versions from untrusted sources.

Deleting Prefetch files may:

Slightly increase application load time temporarily
Reset Windows application launch history

Windows will automatically regenerate Prefetch data as programs are used again.


Administrator Permission

Administrator privileges are typically required to delete files inside system directories such as Prefetch.

Right-click → "Run as administrator" if necessary.


Disclaimer

This script is provided "as is" without warranty of any kind.

The author is not responsible for any misuse, system instability, data loss, or unintended consequences resulting from execution.

Use at your own risk and only on systems you control.
