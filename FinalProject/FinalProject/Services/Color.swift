//
//  Color.swift
//  FinalProject
//
//  Created by الوليد خشيم on 15/02/1445 AH.
//

import Foundation
import SwiftUI

class Colors {

        var Backgroundcolor  = LinearGradient(
            stops: [
                Gradient.Stop(color: Color(red: 0.06, green: 0.19, blue: 0.34), location: 0.08),
                Gradient.Stop(color: Color(red: 0.3, green: 0.42, blue: 0.45), location: 0.92),
            ],
            startPoint: UnitPoint(x: 0.5, y: 0),
            endPoint: UnitPoint(x: 0.5, y: 1)
        )
    // How to use   .background(Colors().Backgroundcolor)
        
}
    
    

