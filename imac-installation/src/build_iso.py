import os
import subprocess
import platform
import sys

INSTALL_SCRIPT_PATH = "installation_script.py"
COMPATIBILITY_FILE_PATH = "compatibility.py"

def install_requirements():
    subprocess.check_call([sys.executable, "-m", "pip", "install", "--upgrade", "pip"])
    subprocess.check_call([sys.executable, "-m", "pip", "install", "-r", "requirements.txt"])

def build_iso(iso_type):
    if iso_type not in ["install", "live"]:
        print("Invalid ISO type. Choose 'install' or 'live'.")
        exit(1)

    iso_name = f"{iso_type}_boot.iso"
    boot_option = "-b isolinux.bin" if iso_type == "live" else ""

    if platform.system() == "Windows":
        genisoimage_cmd = f"genisoimage -o {iso_name} {boot_option} -c boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table {INSTALL_SCRIPT_PATH} {COMPATIBILITY_FILE_PATH}"
    else:
        genisoimage_cmd = f"mkisofs -o {iso_name} {boot_option} -c boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table {INSTALL_SCRIPT_PATH} {COMPATIBILITY_FILE_PATH}"

    subprocess.run(genisoimage_cmd, shell=True)
    print(f"{iso_type.capitalize()} ISO created successfully: {iso_name}")

def main():
    install_requirements()

    print("Choose the type of ISO to create:")
    print("1. Install ISO")
    print("2. Live Boot ISO")
    choice = input("Enter your choice (1 or 2): ")

    if choice == "1":
        build_iso("install")
    elif choice == "2":
        build_iso("live")
    else:
        print("Invalid choice. Exiting.")
        exit(1)

if __name__ == "__main__":
    main()