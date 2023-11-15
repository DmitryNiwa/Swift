import UIKit

//https://leetcode.com/problems/eliminate-maximum-number-of-monsters/description/?envType=daily-question&envId=2023-11-07

class Solution {
    func eliminateMaximum(_ dist: [Int], _ speed: [Int]) -> Int {
        var distTime:[Int] = []
        var eliminated = 0
        let n = dist.count
        for i in 0..<n {
            distTime.append(dist[i] / speed[i])
            if dist[i] % speed[i] != 0 {
                distTime[i] += 1 //Здесь мы получили массив, в котором содержится, сколько ходов нужно сделать каждому монстру, чтобы добраться до базы
            }
        }
        distTime.sort() //Сортируем
        for i in 0..<n {
            distTime.removeFirst()
            eliminated += 1
            if distTime[i] - i == 0 {
                break
            }
        }
        return eliminated
    }
}

let Sol = Solution()
Sol.eliminateMaximum([1,3,4], [1,1,1])
