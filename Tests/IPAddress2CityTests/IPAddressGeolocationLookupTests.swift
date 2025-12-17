//
//  IPAddressGeolocationLookupTests.swift
//
//  Created by Mac on 15/12/25.
//


import XCTest
@testable import IPAddress2City

extension IPRangeLocation {
    static var null = IPRangeLocation(start: 0, end: 0, alpha2: "", subdiv: "")
}

final class IPAddressGeolocationLookupTests: XCTestCase {
    
    let lookup = IPAddressGeolocationLookup(locator: IPAddressRangeGeolocation())
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidLocation()throws {
        let location = try lookup.location(with: "102.130.125.86")
        
        let start = lookup.start(with:location)
        let end = lookup.end(with:location)
        let country = lookup.country(with:location)
        let subdivision = lookup.subdivision(with:location)
        let flag = lookup.flag(with:location)
        
        XCTAssert("102.130.114.0" == start)
        XCTAssert("102.130.126.255" == end)
        
        XCTAssert("South Africa" == country)
        XCTAssert("🇿🇦" == flag)
        XCTAssert(subdivision == "Cape Town (Manenberg) - Western Cape")
    }
    
    func testValidStartLocation() throws {
        let location = try lookup.location(with: "102.130.125.86")
        XCTAssert("102.130.114.0" == lookup.start(with:location))
    }
    
    func testValidEndLocation() throws {
        let location = try lookup.location(with: "102.130.125.86")
        XCTAssert("102.130.126.255" == lookup.end(with:location))
    }
    
    func testValidCountryLocation() throws {
        let location = try lookup.location(with: "102.130.125.86")
        XCTAssert("South Africa" == lookup.country(with:location))
    }
    func testValidFlagLocation()throws {
        let location = try lookup.location(with: "102.130.125.86")
        XCTAssert("🇿🇦" == lookup.flag(with:location))
    }
    
    func testValidSubdivisionLocation() throws {
        let location = try lookup.location(with: "102.130.125.86")
        XCTAssert(lookup.subdivision(with:location) == "Cape Town (Manenberg) - Western Cape")
    }
    
    func testInvalidLocation() {
       
        XCTAssertThrowsError(try lookup.location(with: ""))
        XCTAssertThrowsError(try lookup.location(with: "...."))
        XCTAssertThrowsError(try lookup.location(with: "..1.0."))
        XCTAssertThrowsError(try lookup.location(with: ".1.0.10."))
        XCTAssertThrowsError(try lookup.location(with: ".10.1.10."))
        XCTAssertThrowsError(try lookup.location(with: ".10.0.10."))
        XCTAssertThrowsError(try lookup.location(with: "10..10.10."))
        XCTAssertThrowsError(try lookup.location(with: "266.25.10.10."))
        XCTAssertThrowsError(try lookup.location(with: "0.266.25.10.10"))
    }
    
    func testInvalidEmptyFields() {
        XCTAssert(lookup.start(with: .null).isEmpty)
        XCTAssert(lookup.end(with: .null).isEmpty)
        XCTAssert(lookup.country(with: .null).isEmpty)
        XCTAssert(lookup.flag(with: .null).isEmpty)
        XCTAssert(lookup.subdivision(with: .null).isEmpty)
    }
    
    func testInvalidStartField() {
        XCTAssertNil(lookup.start(for: ""))
        XCTAssertNil(lookup.start(for: "...."))
        XCTAssertNil(lookup.start(for: "..1.0."))
        XCTAssertNil(lookup.start(for: ".1.0.10."))
        XCTAssertNil(lookup.start(for: ".10.1.10."))
        XCTAssertNil(lookup.start(for: ".10.0.10."))
        XCTAssertNil(lookup.start(for:"10..10.10."))
        XCTAssertNil(lookup.start(for:"266.25.10.10."))
        XCTAssertNil(lookup.start(for:"0.266.25.10.10"))
    }
    func testInvalidEndField() {
        XCTAssertNil(lookup.end(for: ""))
        XCTAssertNil(lookup.end(for: "...."))
        XCTAssertNil(lookup.end(for: "..1.0."))
        XCTAssertNil(lookup.end(for: ".1.0.10."))
        XCTAssertNil(lookup.end(for: ".10.1.10."))
        XCTAssertNil(lookup.end(for: ".10.0.10."))
        XCTAssertNil(lookup.end(for:"10..10.10."))
        XCTAssertNil(lookup.end(for:"266.25.10.10."))
        XCTAssertNil(lookup.end(for:"0.266.25.10.10"))
    }
    func testInvalidCountryField() {
        XCTAssertNil(lookup.country(for: ""))
        XCTAssertNil(lookup.country(for: "...."))
        XCTAssertNil(lookup.country(for: "..1.0."))
        XCTAssertNil(lookup.country(for: ".1.0.10."))
        XCTAssertNil(lookup.country(for: ".10.1.10."))
        XCTAssertNil(lookup.country(for: ".10.0.10."))
        XCTAssertNil(lookup.country(for:"10..10.10."))
        XCTAssertNil(lookup.country(for:"266.25.10.10."))
        XCTAssertNil(lookup.country(for:"0.266.25.10.10"))
    }
    func testInvalidFlagField() {
        XCTAssertNil(lookup.flag(for: ""))
        XCTAssertNil(lookup.flag(for: "...."))
        XCTAssertNil(lookup.flag(for: "..1.0."))
        XCTAssertNil(lookup.flag(for: ".1.0.10."))
        XCTAssertNil(lookup.flag(for: ".10.1.10."))
        XCTAssertNil(lookup.flag(for: ".10.0.10."))
        XCTAssertNil(lookup.flag(for:"10..10.10."))
        XCTAssertNil(lookup.flag(for:"266.25.10.10."))
        XCTAssertNil(lookup.flag(for:"0.266.25.10.10"))
    }
    func testInvalidSubdivField() {
        XCTAssertNil(lookup.subdivision(for: ""))
        XCTAssertNil(lookup.subdivision(for: "...."))
        XCTAssertNil(lookup.subdivision(for: "..1.0."))
        XCTAssertNil(lookup.subdivision(for: ".1.0.10."))
        XCTAssertNil(lookup.subdivision(for: ".10.1.10."))
        XCTAssertNil(lookup.subdivision(for: ".10.0.10."))
        XCTAssertNil(lookup.subdivision(for:"10..10.10."))
        XCTAssertNil(lookup.subdivision(for:"266.25.10.10."))
        XCTAssertNil(lookup.subdivision(for:"0.266.25.10.10"))
    }
    
}



