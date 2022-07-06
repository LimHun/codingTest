
import Foundation

func part(_ s: String, startIndex : Int, endIndex : Int) -> String {
    let startIndex = s.index(s.startIndex, offsetBy: startIndex)// 사용자지정 시작인덱스
    let endIndex = s.index(s.startIndex, offsetBy: endIndex)// 사용자지정 끝인덱스
    let sliced_str = s[startIndex ..< endIndex]
    return String(sliced_str)
}

func slice(str : String, n : Int) -> [String] {
    var arr : [String] = []
    var temp = ""

    for i in str {
        temp += String(i)
        if temp.count >= n {
            arr.append(temp)
            temp = ""
        }
    }

    if temp != "" {
        arr.append(temp)
    }

    return arr
}

func compress(arr : [String]) -> String {
    var result = ""
    var before = ""
    var count = 1

    for s in arr {
        if s == before {
            count += 1
        } else {
            if before != "" {
                result += (count > 1) ? "\(count)\(before)" : "\(before)"
            }
            before = s
            count = 1
        }
    }
    result += (count > 1) ? "\(count)\(before)" : "\(before)"

    return result

}

func solution(_ s : String) -> Int {
    if s.count < 3 { return s.count }

    var resultCount = s.count
    let limit = s.count / 2
    for n in 1...limit {
        let sliceArray = slice(str: s, n: n)
        let compressString = compress(arr: sliceArray)
        let length = compressString.count
        if length < resultCount {
            resultCount = length
        }
    }
    return resultCount
}

print(solution("aabbaccc"))
print(solution("ababcdcdababcdcd"))
print(solution("abcabcdede"))
print(solution("abcabcabcabcdededededede"))
print(solution("xababcdcdababcdcd"))
