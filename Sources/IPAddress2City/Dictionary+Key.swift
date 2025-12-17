//
//  Dictionary+Key.swift
//  IPAddress2City
//
//  Created by Mac on 11/12/25.
//

extension Dictionary where Value: Equatable {
    func key(from value: Value) -> Key? {
        first { $1 == value }?.key
    }
}
