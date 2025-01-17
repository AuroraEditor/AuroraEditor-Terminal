//
//  MeanTests.swift
//  
//  These are tests that feed the fuzzer data into the terminal, to make sure
//  we do not regress those
//
//  Created by Miguel de Icaza on 4/24/20.
//
import XCTest
import Foundation

@testable import SwiftTerm

final class MeanTests: XCTestCase {
    
    func loadAndRun (d: Data)
    {
        let h = HeadlessTerminal (queue: SwiftTermTests.queue) { exitCode in }
        var data : [UInt8] = []
        data.append(contentsOf: d)
        let t = h.terminal!

        t.feed (byteArray: data)
    }
    
    func loadAndRun (file: String) -> Bool
    {
        let url = URL(fileURLWithPath: file)
        do {
            let data = try Data(contentsOf: url)
            loadAndRun(d: data)
        } catch {
            XCTFail("Failed to load the specified file \(file)")
            return false
        }
        return true
    }
}
