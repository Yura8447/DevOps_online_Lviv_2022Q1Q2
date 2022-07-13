import platform
import psutil

print("OS:", platform.platform())
print("RAM amount:", psutil.virtual_memory()[2])
print("CPU usage (10 seconds):", psutil.cpu_percent(10))