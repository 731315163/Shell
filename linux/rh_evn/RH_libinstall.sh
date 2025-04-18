# lib install
dnf install gcc
dnf install make
dnf install git
dnf install openssl openssl-devel
dnf install libffi libffi-devel 
dnf install bzip2 bzip2-devel 
dnf install ncurses ncurses-devel
dnf install readline readline-devel
dnf install sqlite sqlite-devel
dnf install python3-devel


# 对于 CentOS 8 及更新版本或 RHEL
dnf install -y xz-devel
#uv
curl -LsSf https://astral.sh/uv/install.sh | sh