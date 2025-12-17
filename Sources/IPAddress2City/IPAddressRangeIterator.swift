//
//  IPAddressRangeIterator.swift
//  IPAddress2City
//
//  Created by Mac on 12/12/25.
//

// MARK: IPAddressRangeIterator
class IPAddressRangeIterator {
    
    private let collection: IPAddressRangeCollection
    private var index = 0
    
    init(_ collection: IPAddressRangeCollection) {
        self.collection = collection
    }
}
// MARK: IPAddressRangeIterator: IteratorProtocol
extension IPAddressRangeIterator: IteratorProtocol {
    func next() -> String? {
        defer { index += 1 }
        return index < self.collection.range.count ? collection.range[index] : nil
    }
}
