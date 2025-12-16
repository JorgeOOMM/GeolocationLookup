AddressLookup library

This library geolocate a internet IP address

Create the object

> let lookup = IPAddressGeolocationLookup()

Get the geo location of ip address and print the country with the flag

> guard let var location = try? lookup.location(with: "102.130.125.86") else {
>     return
> }
> 
> print("\(location.country(with: location)) [\(location.flag(with: location))]")
> 
>South Africa 🇿🇦

Print a geo location from a IP address string.

> lookup.printAddress(for: "102.130.125.86")

>Printing geo location record for: 102.130.125.86
>102.130.114.0 102.130.126.255 South Africa 🇿🇦 Cape Town (Manenberg) - Western Cape
