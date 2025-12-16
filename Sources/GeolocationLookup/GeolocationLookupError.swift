//
//  GeolocationLookupError.swift
//  GeolocationLookup
//
//  Created by Mac on 15/12/25.
//

import Foundation

// MARK: GeolocationLookupError
enum GeolocationLookupError: Error {
    case conversionError
    case locationError
    case memoryError
    case alpha2IndexError
    case parameterError
}
