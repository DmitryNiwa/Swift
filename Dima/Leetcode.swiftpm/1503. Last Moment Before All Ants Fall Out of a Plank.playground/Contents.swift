import UIKit


//https://leetcode.com/problems/last-moment-before-all-ants-fall-out-of-a-plank/description/?envType=daily-question&envId=2023-11-04
// Т.к. все муравьи одинаковые, то можем считать, что при столкновении муравьев, они просто проходят мимо друг друга, результат будет тот же, поэтому просто найдем муравья, которому нужно пройти максимальное расстояние и найдем t, за которое он пройдет это расстояние, это и будет ответ

class Solution {
    func getLastMoment(n: Int, left: [Int], right: [Int]) -> Int {
        let RightMax = n - (right.min() ?? n)
        let LeftMax = left.max() ?? 0
        return max(RightMax, LeftMax)
    }
}
let solve = Solution()
solve.getLastMoment(n: 4, left: [4,3], right: [0,1])
solve.getLastMoment(n: 7, left: [], right: [0,1,2,3,4,5,6,7])
solve.getLastMoment(n: 7, left: [0,1,2,3,4,5,6,7], right: [])
