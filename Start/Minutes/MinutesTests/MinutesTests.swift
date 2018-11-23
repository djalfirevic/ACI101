//
//  MinutesTests.swift
//  MinutesTests
//
//  Created by Djuro Alfirevic on 11/23/18.
//  Copyright © 2018 Microsoft. All rights reserved.
//

import XCTest
@testable import Minutes

class MinutesTests: XCTestCase {
    
    // MARK: - Properties
    var entryUnderTest: Entry!

    // MARK: - Setup
    override func setUp() {
        super.setUp()
        
        entryUnderTest = Entry("Title", "Content")
    }

    override func tearDown() {
        entryUnderTest = nil
        
        super.tearDown()
    }
    
    // MARK: - Tests
    func testSerialization() {
        let serializedData = FileEntryStore.serialize(entryUnderTest)
        let entry = FileEntryStore.deserialize(serializedData!)
        
        XCTAssertEqual(entry?.title, "Title", "Title does not match")
        XCTAssertEqual(entry?.content, "Content", "Content does not match")
    }

}
