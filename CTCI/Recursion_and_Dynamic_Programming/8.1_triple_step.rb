# A child is running up a staircase with n steps and can hop either 1 step,
# 2 steps, or 3 steps at a time. Implement a method to count how many
# possible ways the child can run up the stairs.

def possibilities(n, arr = [0,1,2,4])
    return 0 if n <= 0
    return arr[n] if arr[n]
    # return 1 if n == 1
    # return 2 if n == 2
    # return 4 if n == 3
    arr[n] = possibilities(n - 1, arr) + possibilities(n - 2, arr) + possibilities(n - 3, arr)
    return arr[n]

end


p possibilities(100)
