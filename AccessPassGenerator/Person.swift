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

enum RequiredInfo {
    case birthDate
    case firstName
    case lastName
    case streetAddress
    case city
    case state
    case zipCode
    case SSN
    case managementTier
}

protocol PersonType {
    var entrant: Entrant { get }
    var areaAccess: [AreaAccess] { get }
    var rideAccess: [RideAccess] { get }
    var discountAccess: [Discount] { get }
    var requiredInformation: [RequiredInfo]? { get }
    
    init(ofType type: Entrant)
}

class Person: PersonType {
    var entrant: Entrant
    var areaAccess: [AreaAccess]
    var rideAccess: [RideAccess]
    var discountAccess: [Discount]
    var requiredInformation: [RequiredInfo]?
    
    
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
}
















