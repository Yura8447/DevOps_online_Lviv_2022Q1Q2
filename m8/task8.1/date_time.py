import datetime
import time

now = datetime.datetime.now()

print("Current date:")
print(now.strftime("%Y-%m-%d"))

print("Current time:")
print(time.strftime("%H:%M:%S"))
