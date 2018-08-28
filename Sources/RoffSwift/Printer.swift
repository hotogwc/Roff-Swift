//
//  printer.swift
//  RoffSwift
//
//  Created by addictedtoelixir on 2018/8/27.
//

import Foundation

public struct Printer {
    
    static func bold(input: String) -> String {
        return "\\fB" + input + "\\fR"
    }
    
    static func italic(input: String) -> String {
        return "\\fI" + input + "\\fR"
    }
    
    static func list<T: Renderable>(header: [T], content: [T]) -> String {
        return ".TP\n\(header.render())\n\(content.render())\n"
    }
    
    static func escape(input: String) -> String {
        return input.replacingOccurrences(of: "-", with: "\\-")
    }
    
}
