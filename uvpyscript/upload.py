# /// script
# requires-python = ">=3.10"
# dependencies = [
#     "pysftp",
# ]
# ///
import os
from pathlib import Path, PurePosixPath, PureWindowsPath
import re
from typing import Literal
import pysftp


def isdir(p: Path) -> bool:
    p = Path(p)
    if p.exists():
        return p.is_dir()
    else:
        # 路径不存在，判断是否是文件路径 如果路径包含后缀，则假设它是文件
        if p.suffix:
            return False
        else:  # 假设没有后缀的路径是文件夹路径
            return True


def upload_file_or_folder(
    host: str,
    username: str,
    local_path: Path | str,
    remote_path: Path | str,
    password=None,
    private_key=None,
    overwrite=False,
):
    """
    Upload a file or folder to a remote server using SFTP.

    :param host: SFTP server hostname or IP address
    :param username: SFTP username
    :param password: SFTP password (optional if using private key)
    :param private_key: Path to the private key file (optional if using password)
    :param local_path: Path to the local file or folder to upload
    :param remote_path: Path on the remote server where the file or folder will be uploaded
    :param overwrite: If True, overwrite existing files; if False, skip existing files
    """
    # Configure pysftp options (disable host key checking for simplicity)
    cnopts = pysftp.CnOpts()
    cnopts.hostkeys = None  # Use this only for testing; not secure for production

    with pysftp.Connection(
        host=host,
        username=username,
        password=password,
        private_key=private_key,
        cnopts=cnopts,
    ) as sftp:
        print(f"Connected to {host}")

        def upload_file(local_file: Path, remote_file: Path):
            """Upload a single file."""
            if isdir(local_file) or not local_file.exists():
                print(f"{local_file} is not a file or does not exist.")

            if isdir(remote_file):
                remote_file = remote_file / local_file.name
            remote_file_str = remote_file.as_posix()

            if overwrite or not sftp.exists(remote_file_str):

                sfta = sftp.put(
                    localpath=str(local_file), remotepath=remote_file_str, confirm=False
                )
                print(sfta)
            else:
                print(f"File exists, skipping: {remote_file}")

        def upload_dir(local_dir: Path, remote_dir: Path):
            """Recursively upload a directory."""
            remote_dir_str = remote_dir.as_posix()
            if not sftp.exists(remote_dir_str):
                sftp.mkdir(remote_dir_str)
            for item in os.listdir(local_dir):
                local_item = local_dir / item
                remote_item = remote_dir / item
                if isdir(local_item):
                    upload_dir(local_item, remote_item)
                else:
                    upload_file(local_item, remote_item)

        local_path = Path(local_path)
        remote_path = Path(remote_path)
        if isdir(local_path):
            upload_dir(local_path, remote_path)
        else:
            upload_file(local_path, remote_path)

        print("Upload complete.")


"""
# please command 'uv run ./this_script.py'
"""

if __name__ == "__main__":
    # Input your SFTP credentials and paths
    HOST = "123.58.198.95"
    USERNAME = "root"
    PASSWORD = "q8510912"  # Leave as None if using private key
    PRIVATE_KEY = r"C:\Users\q7313\.ssh\id_ed25519"  # Provide the path to your private key file if applicable

    # Local file or folder to upload
    LOCAL_PATH = r"C:\project\Forecast\platform.script\win"

    # Remote path where the file or folder will be uploaded
    REMOTE_PATH = r"/home/trade/win"

    # Set to True to overwrite existing files on the server
    OVERWRITE = False

    upload_file_or_folder(
        host=HOST,
        username=USERNAME,
        password=PASSWORD,
        # private_key=PRIVATE_KEY,
        local_path=LOCAL_PATH,
        remote_path=REMOTE_PATH,
        overwrite=OVERWRITE,
    )
