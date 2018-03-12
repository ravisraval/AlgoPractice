var singleNumber = function(nums) {
    let currentNum = nums[0]
    for(let i = 1; i < nums.length; i++) {
        currentNum ^= nums[i];
    }
    return currentNum;
};
