//
//  ButtonExtension.swift
//  Hipip
//
//  Created by Sooraj S Nair on 14/11/21.
//

import Foundation
import UIKit

extension UIButton{
    
    func ovalCorner(){
        self.layer.cornerRadius = self.frame.size.height/2
        self.layoutIfNeeded()
    }
}
