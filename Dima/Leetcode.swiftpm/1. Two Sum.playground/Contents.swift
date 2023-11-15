import UIKit

//https://leetcode.com/problems/two-sum/description/

class Solution {
    var solve: [Int] = []
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        let n = nums.count
        var solve:[Int] = []
        for i in 0...(n-2) {
            for j in (i+1)...(n-1) {
                if nums[i] + nums[j] == target {
                    solve = [i, j]
                    break
                }
            }
        }
        return solve
    }
}

let good = Solution()
print(good.twoSum([2,7,11,15], 9))
print(good.twoSum([3,2,4], 6))
print(good.twoSum([3,3], 6))

//Очень неэффективное и гадкое решение, вернусь после изучение Перечислений/enum
