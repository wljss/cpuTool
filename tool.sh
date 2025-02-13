#!/bin/bash

# 输出文件
OUTPUT_FILE="top_cpu_consumers.log"

# 清空/创建输出文件
: > "$OUTPUT_FILE"

# 无限循环，每隔10秒执行一次统计
while true; do
    # 获取最消耗CPU的5个进程信息
    ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head -n 6 | tail -n 5 >> "$OUTPUT_FILE"
    
    # 添加一个时间戳
    echo "--- $(date) ---" >> "$OUTPUT_FILE"
    
    # 等待10秒
    sleep 10
done
