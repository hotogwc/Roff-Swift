//
//  Array + Extension.swift
//  RoffSwift
//
//  Created by addictedtoelixir on 2018/8/27.
//

import Foundation

extension Array: Renderable where Element: Renderable {
    func render() -> String {
        return self.reduce("") { $0 + $1.render() }
    }
}
