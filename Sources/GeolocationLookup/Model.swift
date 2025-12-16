//
//  Model.swift
//
//  Created by Mac on 11/12/25.
//

import Foundation

// MARK: IPRangeProtocol protocol
/// Protocol  describing address  range in network byte order
protocol IPRangeLocationProtocol {
    /// Start of address  range  in network byte order
    var start: UInt32 {get set}
    /// End of address  range in network byte order
    var end: UInt32 {get set}
}

// MARK: IPRangeLocation (Internet Protocol version 4 (IPv4))
struct IPRangeLocation: IPRangeLocationProtocol, Codable {
    /// Start of address  range  in network byte order
    var start: UInt32
    /// End of address  range in network byte order
    var end: UInt32
    var alpha2: String
    var subdiv: String
}

// MARK: IPRangeLocationIdx (Internet Protocol version 4 (IPv4))
struct IPRangeLocationIdx: IPRangeLocationProtocol {
    /// Start of address  range  in network byte order
    var start: UInt32
    /// End of address  range in network byte order
    var end: UInt32
    var alpha2Idx: UInt32
    var subdivIdx: UInt32
}

// MARK: GeoCoordinate
struct GeoCoordinate: Codable {
    let name: String
    let latitude: Double
    let longitude: Double
}
