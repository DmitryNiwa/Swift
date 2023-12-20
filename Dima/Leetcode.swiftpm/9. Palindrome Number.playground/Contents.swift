import UIKit

//https://leetcode.com/problems/palindrome-number

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        guard x >= 10 || x < 0 else {
            return true
        }
        let string = String(x)
        let iter: Int = string.count / 2
        for i in 0..<iter {
            if string[string.index(string.startIndex, offsetBy: i)] != string[string.index(string.endIndex, offsetBy: -i - 1)] { //endIndex дает индекс после последнего элемента, поэтому смещаем начало на -1
                return false
            }
        }
        return true
    }
}
//String нельзя вызывать по сабскрипту, можно только если ты указываешь не Int а StringIndex

