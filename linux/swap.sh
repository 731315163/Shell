#!/bin/bash

# 检查是否提供了参数
if [ $# -ne 1 ]; then
    echo "用法: $0 <虚拟内存大小(MB)>"
    exit 1
fi

# 获取用户输入的虚拟内存大小
swap_size_mb=$1

# 检查输入是否为有效的正整数
if ! [[ $swap_size_mb =~ ^[0-9]+$ ]]; then
    echo "错误: 输入的虚拟内存大小必须是正整数。"
    exit 1
fi

# 定义 swap 文件路径
base_swap_file="/swapfile"
swap_file="$base_swap_file"
file_number=1

# 检查文件是否存在,如存在,生成新的文件名
while [ -f "$swap_file" ]; do
    swap_file="${base_swap_file}${file_number}"
    ((file_number++))
done

# 创建指定大小的 swap 文件
echo "正在创建 $swap_size_mb MB 的 swap 文件..."
sudo fallocate -l "${swap_size_mb}M" "$swap_file"

# 设置文件权限
sudo chmod 600 "$swap_file"

# 格式化文件为 swap 格式
echo "正在格式化 swap 文件..."
sudo mkswap "$swap_file"

# 启用 swap 文件
echo "正在启用 swap 文件..."
sudo swapon "$swap_file"

# 备份 fstab 文件
sudo cp /etc/fstab /etc/fstab.bak

# 将 swap 文件信息添加到 fstab 以实现开机自动挂载
echo "$swap_file none swap defaults 0 0" | sudo tee -a /etc/fstab

# 验证 swap 是否启用
echo "验证 swap 是否成功启用..."
swapon --show

echo "虚拟内存创建并启用成功！以下命令可以查看当前信息"
echo "swapon --show"
