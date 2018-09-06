//
//  RoffSwift.swift
//  RoffSwift
//
//  Created by addictedtoelixir on 2018/8/27.
//

import Foundation

struct Section: Equatable {
    let title: String
    let content: String
    
    static func ==(lhs: Section, rhs: Section) -> Bool {
        return (lhs.title == rhs.title) &&
            (lhs.title == rhs.content)
    }
}

extension Section: Renderable {
    func render() -> String {
        return ".SH " + title.uppercased() + "\n" + content
    }
}


public class Roff {
    let title: String
    let section: UInt
    var content: [Section]
    
    init(_ title: String, section: UInt) {
        self.title = title
        self.section = section
        self.content = [Section]()
    }
    
    func appendSection(_ title: String, content: [Renderable]) -> Roff {
        self.content.append(Section(title: title,
                                    content: content.map { $0.render() }
                                                    .joined(separator: "")))
        return self
    }
}

extension Roff: Renderable {
    func render() -> String {
        var result = ".TH " + title.uppercased() + " " + "\(section)"
        result += "\n"
        content.forEach {
            result += Printer.escape(input: $0.render())
            result += "\n"
        }
        return result
    }
}

