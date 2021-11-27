//
//  imageExtensions.swift
//  Hipip
//
//  Created by Sooraj S Nair on 13/11/21.
//

import Foundation
import UIKit


extension UIImageView{
    
    func standerdCornerRadius(){
        self.layer.cornerRadius = 6
        self.layer.layoutIfNeeded()
    }
}
