import Foundation

func solution(_ new_id:String) -> String {
    var id = new_id.lowercased()
    id = id.filter{ $0.isNumber || $0.isLetter || $0 == "-" || $0 == "_" || $0 == "."}
    while id.contains("..") {
        id = id.replacingOccurrences(of: "..", with: ".")
    }
    if id.hasPrefix(".") { id.removeFirst() }
    if id.hasSuffix(".") { id.removeLast() }
    if id.isEmpty { id = "a" }
    if id.count >= 16 {
        id = String(id.prefix(15))
        if id.hasSuffix(".") { id.removeLast() }
    }
    while id.count < 3 {
        id += id.suffix(1)
    }
    return id
}

print(solution("abcdefghijklmn.p"))
print(solution("...!@BaT#*..y.abcdefghijklm"))
