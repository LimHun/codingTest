/*
 2022 Kakao Blind Recruitment
 신고결과받기
*/

import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {

    var result : [Int] = Array<Int>.init(repeating: 0, count: id_list.count)

    // 중복 제거
    let setReport : Set = Set(report)
    let reReport = Array(setReport)
    var reportDic : [String : [String]] = [:]

    for repo in reReport {
        let user = String(repo.split(separator: " ")[0])
        let reporter = String(repo.split(separator: " ")[1])

        if reportDic.keys.contains(reporter) {
            reportDic[reporter]?.append(user)
        } else {
            reportDic.updateValue([user], forKey: reporter)
        }
    }

    var userReportCount : [String : Int]  = [:]
    for repoList in reportDic.values {
        if repoList.count >= k {
            for repo in repoList {
                if userReportCount.keys.contains(repo) {
                    userReportCount.updateValue(userReportCount[repo]! + 1, forKey: repo)
                } else {
                    userReportCount.updateValue(1, forKey: repo)
                }
            }
        }
    }

    for i in 0...id_list.count - 1{
        if userReportCount.keys.contains(id_list[i]) {
            result[i] = userReportCount[id_list[i]]!
        } else {
            result[i] = 0
        }
    }
    return result
}

//print( solution(["muzi", "frodo", "apeach", "neo"], ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"], 2))
//print( solution(["con", "ryan"], ["ryan con", "ryan con", "ryan con", "ryan con"], 3))

func solution2(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var reported: [String: Int] = [:]
    var user: [String: [String]] = [:]

    for r in Set(report) {
        let splited = r.split(separator: " ").map { String($0) }
        //user[splited[0]] = 기존 배열 + 다음 객체
        user[splited[0]] = (user[splited[0]] ?? []) + [splited[1]]
        reported[splited[1]] = (reported[splited[1]] ?? 0) + 1
    }

    return id_list.map { id in
        return (user[id] ?? []).reduce(0) {
            $0 + ((reported[$1] ?? 0) >= k ? 1 : 0)
        }
    }
}

print( solution2(["muzi", "frodo", "apeach", "neo"], ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"], 2))
print( solution2(["con", "ryan"], ["ryan con", "ryan con", "ryan con", "ryan con"], 3))

let str = """
|\\_/|
|q p|   /}
( 0 )\"\"\"\\
|\"^\"`    |
||_/=\\\\__|
"""
print(str)
print("")

let a = readLine()
