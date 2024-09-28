import os
import shutil

desktop_files_dir = ".local/share/applications/"
bin_dir = "/usr/bin/"

def create_shell_file(desktop_file):
    exec_command = None
    app_name = None
    with open(desktop_file, "r") as file:
        for line in file:
            if line.startswith("Name="):
                app_name = line.split("=", 1)[1].strip().replace(" ", "-").lower()
            if line.startswith("Exec="):
                exec_command = line.split("=", 1)[1].strip()

    shell_file_path = os.path.join(bin_dir, app_name)
            
    if exec_command:
        with open(shell_file_path, "w") as shell_file:
            shell_file.write(f"#!/bin/bash\n{exec_command}\n")
        os.chmod(shell_file_path, 0o755)
        print(f"info: created and made executable: {shell_file_path}")
    else:
        print(f"error: no exec command found in {desktop_file}")

if __name__ == "__main__":
    if not os.access(bin_dir, os.W_OK):
        print(f"error: permission denied: cannot write to {bin_dir}")
        print("info: please run the script with sudo")
        exit(1)
    
    for filename in os.listdir(desktop_files_dir):
        if filename.endswith(".desktop"):
            desktop_file_path = os.path.join(desktop_files_dir, filename)            
            create_shell_file(desktop_file_path)
