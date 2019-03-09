import time, datetime
from concurrent.futures import ProcessPoolExecutor, ThreadPoolExecutor
#define const_number
MAX_PROCESS  = 10
MAX_THREAD = 10
FIRST_DATA = [num for num in range(1, 3000, 3)]
SECOND_DATA = [num for num in range(7, 2006, 2)]

# 最大公約数を求める
def gcd(num1, num2):
    inc = 0
    while (num1 % num2 != 0):
        inc += 1
        rest_num = num1 % num2
        num1 = num2
        num2 = rest_num
        if inc < 1000:
            break
    return num2

print("start -> process ","="*30)
for num_process in range(1, MAX_PROCESS):
    f = time.time()
    with ProcessPoolExecutor(num_process) as e:
            e.submit(gcd, FIRST_DATA, SECOND_DATA)
            print(f"process_num: {num_process}, total_time: {time.time()-f}")

print()
print("start -> thread ","="*30)

for num_thread in range(1, MAX_PROCESS):
    f = time.time()
    with ThreadPoolExecutor(num_thread) as e:
            e.submit(gcd, FIRST_DATA, SECOND_DATA)
            print(f"thread_num: {num_thread}, total_time: {time.time()-f}")