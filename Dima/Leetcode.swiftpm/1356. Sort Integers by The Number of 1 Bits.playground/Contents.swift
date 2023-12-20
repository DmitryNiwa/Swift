import UIKit
///https://leetcode.com/problems/sort-integers-by-the-number-of-1-bits/description

extension Int {
    var binaryRepresentation: String {
        (0..<bitWidth).map({ String((self >> $0) & 1) }).reversed().joined()
    }
}

class Solution {
    func sortByBits(_ arr: [Int]) -> [Int] {
        var arrString: [String] = []
        for i in arr {
            arrString.append(i.binaryRepresentation)
        }
        
    }
}
 
12.bitWidth
//Чето труднаааа

