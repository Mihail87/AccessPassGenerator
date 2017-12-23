//
//  ViewController.swift
//  AccessPassGenerator
//
//  Created by Mihai Leonte on 12/20/17.
//  Copyright © 2017 Mihai Leonte. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var testUser = Person(ofType: guestType, birthDate: nil)
        print("Test user swipes in Areas: ")
        print("Amusement \(testUser.swipeArea(in: .amusement))")
        print("Kitchen \(testUser.swipeArea(in: .kitchen))")
        print("Ride Control \(testUser.swipeArea(in: .rideControl))")
        print("Maintenance \(testUser.swipeArea(in: .maintenance))")
        print("Office \(testUser.swipeArea(in: .office))")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}












