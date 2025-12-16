//
//  IPAddressRangeLocatorProtocol.swift
//  GeolocationLookup
//
//  Created by Mac on 12/12/25.
//

// MARK: IPAddressRangeLocatorProtocol protocol
/// Protocol for locate the `IPRange` location for a ip `address`
protocol IPAddressRangeLocatorProtocol {
    /// Find the location for a netword address
    ///
    /// - Note IP (Internet Protocol) uses big-endian byte order, also known as network byte order
    ///
    /// - Parameter address:UInt32 address in network byte order
    ///
    /// - Returns: IPRangeLocation?
    ///
    func locate(from address: UInt32) -> IPRangeLocation?
    /// Load the location information
    ///
    /// - Returns: Bool
    ///
    func load() -> Bool
}
