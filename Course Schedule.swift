//
//  Course Schedule.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by Diego Espinosa on 2020-03-05.
//  Copyright © 2020 Diego Espinosa. All rights reserved.
//

import Foundation

func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
    let t = numCourses
    let content = prerequisites
    
    var sum = 0
    for i in 0..<content.count {
        sum += content[i].count
    }
    
    if t >= sum {
        return true
    } else {
        return false
    }
}

func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
    var courses = prerequisites
    var ans = [Int]()
    var whatIHave = ""
    var temp = 0
    
    if numCourses == 2{
        if courses[0][0] > courses [0][1]{
            temp = courses[0][0]
            courses[0][0] = courses[0][1]
            courses[0][1] = temp
        }
        else{
            temp = courses[0][1]
            courses[0][1] = courses[0][0]
            courses[0][0] = temp
        }
    
        ans = courses[0]
        return ans
    }
    
    for i in 0..<numCourses{
        if courses[i][0] > courses[i][1]  {
            if !whatIHave.contains("\(courses[i][1]))"){
                ans.append(courses[i][1])
                whatIHave.append("\(courses[i][1]))")
            } else {
                ans.append(courses[i][0])
                whatIHave.append("\(courses[i][0]))")
            }
        }
        if courses[i][1] > courses[i][0]  {
            if !whatIHave.contains("\(courses[i][0]))"){
                ans.append(courses[i][0])
                whatIHave.append("\(courses[i][0]))")
            } else {
                ans.append(courses[i][1])
                whatIHave.append("\(courses[i][1]))")
            }
        }
    }
    return ans
}
