AddressLookup library

This library geolocate a internet IP address


let lookup = IPAddressGeolocationLookup()

Get the geo location of ip address

do 
    let location = lookup.location(with: "102.130.125.86")
    let start = lookup.start(with:location)
    let end = lookup.end(with:location)
    let country = lookup.country(with:location)
    let subdivision = lookup.subdivision(with:location)
    let flag = lookup.flag(with:location)
        
} catch() {

}

Print a geo location from a IP address string.

lookup.printAddress(for: "102.130.125.86")

>Printing geo location record for: 102.130.125.86
>102.130.114.0 102.130.126.255 South Africa 🇿🇦 Cape Town (Manenberg) - Western Cape
