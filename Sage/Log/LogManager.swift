//
//  LogManager.swift
//  Sage
//
//  Created by gurren-l on 2017. 7. 15..
//  Copyright © 2017년 boxjeon. All rights reserved.
//

let Log = LogManager()

class LogManager {
    
    func d<T>(_ value: T, file: NSString = #file, line: Int = #line) {
        print("\(file.lastPathComponent)[\(line)]: \(value)", terminator: "\n")
    }
    
}
