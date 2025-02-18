#!/bin/bash

# 输出文件
OUTPUT_FILE="top_cpu_consumers.log"

# 清空/创建输出文件
: > "$OUTPUT_FILE"

# 无限循环，每隔10秒执行一次统计
while true; do
    # 获取最消耗CPU的5个进程信息,显示进程的PID、父PID、命令和CPU使用率,然后按CPU使用率降序排序，head -n 6 取前6行（包括表头），tail -n 5：去掉表头，取实际的5个进程,这里tail -n 6就包括表头
    ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head -n 6 | tail -n 6 >> "$OUTPUT_FILE"
    
    # 添加一个时间戳
    echo "--- $(date) ---" >> "$OUTPUT_FILE"
    
    # 等待10秒
    sleep 10
done
