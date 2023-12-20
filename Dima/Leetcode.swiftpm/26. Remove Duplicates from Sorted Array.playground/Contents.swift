import UIKit
//https://leetcode.com/problems/remove-duplicates-from-sorted-array/
class MySolution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 1 else {
            return nums.count
        }
        var j = 1
        for i in 1..<nums.count  {
            if nums[i] != nums[i-1] { // если два соседних элемента не равны то
                nums[j] = nums[i]
                j += 1
            }
        }
        return j
    }
}
//Мало понял почему, но я заменил интерацию с i in 1...nums.count - 2 на i in 1..<nums.count
//+ заменил немножко сравнение по итерациям if nums[i-1] != nums[i] у меня было
// по итогу решение из топ 60% попало в топ 98,5%

class Solution { //это решение мне оч понравилось, но оно оказалось еще хуже по метрикам чем мое
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        nums = Array(Set(nums))
        nums.sort()
        return nums.count
    }
}

