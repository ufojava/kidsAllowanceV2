//
//  AllowanceDetails.swift
//  kidsAllowanceV2
//
//  Created by Ufuoma Okoro on 04/12/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

//Allowace Details
import Foundation
import SwiftUI
import Combine



//Class - Published Variables

class allowanceDetails: ObservableObject {
    
    //Allowance Period Indicator
    @Published var allowanceWkly = ""
    @Published var allowanceMthly = ""
    @Published var allowanceYrly = ""
    
}
