//
//  Person.swift
//  AccessPassGenerator
//
//  Created by Mihai Leonte on 12/20/17.
//  Copyright © 2017 Mihai Leonte. All rights reserved.
//

import Foundation

enum Entrant {
    case classicGuest
    case vipGuest
    case freeChildGuess
    case hourlyEmployeeFoodServices
    case hourlyEmployeeRideServices
    case hourlyEmployeeMaintenance
    case manager
}

enum Guest {
    case classic
    case vip
    case freeChild
}

enum HourlyEmployee {
    case foodServices
    case rideServices
    case maintenance
}

enum Manager {
    case manager
}

enum AreaAccess {
    case amusement
    case kitchen
    case rideControl
    case maintenance
    case office
}

enum RideAccess {
    case all
    case skipLines
}

enum Discount {
    case none
    case food(percentage: Int)
    case merchandise(percentage: Int)
}

enum ManagementTier {
    case shift
    case general
    case senior
}

/*
class RequiredInformation {
    lazy var birthDate: Date? = nil
    lazy var firstName: String? = nil
    lazy var lastName: String? = nil
    lazy var streetName: String? = nil
    lazy var city: String? = nil
    lazy var state: String? = nil
    lazy var zipCode: String? = nil
    lazy var SSN: String? = nil
    lazy var managementTier: ManagementTier? = nil
    
    init(birthDate: Date) {
        self.birthDate = birthDate
    }
    
    init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: String, SSN: String, birthDate: Date) {
        self.firstName = firstName
        self.lastName = lastName
        self.streetName = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.SSN = SSN
        self.birthDate = birthDate
    }
    
    init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: String, SSN: String, birthDate: Date, managementTier: ManagementTier) {
        self.firstName = firstName
        self.lastName = lastName
        self.streetName = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.SSN = SSN
        self.birthDate = birthDate
        self.managementTier = managementTier
    }
}
*/

protocol PersonType {
    var areaAccess: [AreaAccess] { get }
    var rideAccess: [RideAccess] { get }
    var discountAccess: [Discount] { get }
    // var requiredInformation: RequiredInformation? { get }
    
    
    init(ofType type: Guest, birthDate: Date?)
    init(ofType type: HourlyEmployee, firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: String, SSN: String, birthDate: Date?)
    init(ofType type: Manager, firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: String, SSN: String, birthDate: Date?, managementTier: ManagementTier)
    
    func swipeArea(in area: AreaAccess) -> Bool
    func swipeRide(in ride: RideAccess) -> Bool
}

class Person: PersonType {
    var areaAccess: [AreaAccess]
    var rideAccess: [RideAccess]
    var discountAccess: [Discount]
    
    lazy var birthDate: Date? = nil
    lazy var firstName: String? = nil
    lazy var lastName: String? = nil
    lazy var streetName: String? = nil
    lazy var city: String? = nil
    lazy var state: String? = nil
    lazy var zipCode: String? = nil
    lazy var SSN: String? = nil
    lazy var managementTier: ManagementTier? = nil
    
    
    required init(ofType type: Guest, birthDate: Date?) {
        switch type {
        case .classic:
            self.areaAccess = [.amusement]
            self.rideAccess = [.all]
            self.discountAccess = [.none]
        case .vip:
            self.areaAccess = [.amusement]
            self.rideAccess = [.all, .skipLines]
            self.discountAccess = [.food(percentage: 10), .merchandise(percentage: 20)]
        case .freeChild:
            self.areaAccess = [.amusement]
            self.rideAccess = [.all]
            self.discountAccess = [.none]
            self.birthDate = Date()
        }
    }
    
    required init(ofType type: HourlyEmployee, firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: String, SSN: String, birthDate: Date?) {
        switch type {
        case .foodServices:
            self.areaAccess = [.amusement, .kitchen]
            self.rideAccess = [.all]
            self.discountAccess = [.food(percentage: 15), .merchandise(percentage: 25)]
        case .rideServices:
            self.areaAccess = [.amusement, .rideControl]
            self.rideAccess = [.all]
            self.discountAccess = [.food(percentage: 15), .merchandise(percentage: 25)]
        case .maintenance:
            self.areaAccess = [.amusement, .kitchen, .rideControl, .maintenance]
            self.rideAccess = [.all]
            self.discountAccess = [.food(percentage: 15), .merchandise(percentage: 25)]
        }
        self.firstName = firstName
        self.lastName = lastName
        self.streetName = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.SSN = SSN
        self.birthDate = birthDate
    }
    
    required init(ofType type: Manager, firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: String, SSN: String, birthDate: Date?, managementTier: ManagementTier) {
        self.areaAccess = [.amusement, .kitchen, .rideControl, .maintenance, .office]
        self.rideAccess = [.all]
        self.discountAccess = [.food(percentage: 25), .merchandise(percentage: 25)]
        
        self.firstName = firstName
        self.lastName = lastName
        self.streetName = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.SSN = SSN
        self.birthDate = birthDate
        self.managementTier = managementTier
    }
    
    /*
    required init(ofType type: Entrant) {
        self.entrant = type
        
        switch type {
        case .classicGuest:
            self.areaAccess = [.amusement]
            self.rideAccess = [.all]
            self.discountAccess = [.none]
        case .vipGuest:
            self.areaAccess = [.amusement]
            self.rideAccess = [.all, .skipLines]
            self.discountAccess = [.food(percentage: 10), .merchandise(percentage: 20)]
        case .freeChildGuess:
            self.areaAccess = [.amusement]
            self.rideAccess = [.all]
            self.discountAccess = [.none]
            self.requiredInformation = [.birthDate]
        case .hourlyEmployeeFoodServices:
            self.areaAccess = [.amusement, .kitchen]
            self.rideAccess = [.all]
            self.discountAccess = [.food(percentage: 15), .merchandise(percentage: 25)]
            self.requiredInformation = [.firstName, .lastName, .streetAddress, .city, .state, .zipCode, .SSN, .birthDate]
        case .hourlyEmployeeRideServices:
            self.areaAccess = [.amusement, .rideControl]
            self.rideAccess = [.all]
            self.discountAccess = [.food(percentage: 15), .merchandise(percentage: 25)]
            self.requiredInformation = [.firstName, .lastName, .streetAddress, .city, .state, .zipCode, .SSN, .birthDate]
        case .hourlyEmployeeMaintenance:
            self.areaAccess = [.amusement, .kitchen, .rideControl, .maintenance]
            self.rideAccess = [.all]
            self.discountAccess = [.food(percentage: 15), .merchandise(percentage: 25)]
            self.requiredInformation = [.firstName, .lastName, .streetAddress, .city, .state, .zipCode, .SSN, .birthDate]
        case .manager:
            self.areaAccess = [.amusement, .kitchen, .rideControl, .maintenance, .office]
            self.rideAccess = [.all]
            self.discountAccess = [.food(percentage: 25), .merchandise(percentage: 25)]
            self.requiredInformation = [.firstName, .lastName, .streetAddress, .city, .state, .zipCode, .SSN, .birthDate, .managementTier]
        }
        
        
    }
 */
    
    func swipeArea(in area: AreaAccess) -> Bool {
        for areaWithAccess in self.areaAccess {
            if areaWithAccess == area {
                return true
            }
        }
        return false
    }
    
    func swipeRide(in ride: RideAccess) -> Bool {
        for rideWithAccess in self.rideAccess {
            if rideWithAccess == ride {
                return true
            }
        }
        return false
    }
}
















