import XCTest
import SwiftShell
import Files
@testable import RoffSwift


func getOutputFromInput(_ input: String) -> String {
    
    let folder = Folder.current
    let file = try! folder.createFile(named: "tmp")
    try! file.write(string: input)
    defer { try! file.delete() }
    
    let result = run("troff", "-a", "-mman", "tmp")
    return result.stdout
}

func getOutputFromTestFile() -> String {
    let file = try! File(path: "./demo.troff")
    let result = run("troff", "-a", "-mman", file.path)
    return result.stdout
}



final class RoffSwiftTests: XCTestCase {
    
    func testGenerating() {
        let page = Roff("corrupt", section: 1)
            .appendSection("name", content: ["corrupt - modify files by randomly changing bits"])
            .appendSection("SYNOPSIS", content: [
                Printer.bold(input: "corrupt"),
                " ",
                "[", Printer.bold(input: "-n"), " ", Printer.italic(input: "BITS"), "]",
                " ",
                "[", Printer.bold(input: "--bits"), " ", Printer.italic(input: "BITS"), "]",
                " ",
                Printer.italic(input: "file"), "..."
                ])
            .appendSection("description", content: [Printer.bold(input: "corrupt"), " modifies files by toggling a randomly chosen bit."])
            .appendSection("options", content: [
                Printer.list(header: [Printer.bold(input: "-n"),
                                      ", ",
                                      Printer.bold(input: "--bits"),
                                      "=",
                                      Printer.italic(input: "BITS")],
                             content: ["Set the number of bits to modify. ", "Default is one bit."])
                ])
        XCTAssertEqual(getOutputFromInput(page.render()) , getOutputFromTestFile())
    }
    static var allTests = [
        ("testGenerating", testGenerating)
    ]
}
