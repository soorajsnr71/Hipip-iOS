//
//  collectionExtension.swift
//  Hipip
//
//  Created by Sooraj S Nair on 13/11/21.
//

import Foundation
import UIKit


extension UICollectionView {
    func setTransparent() {
        let bgView: UIView = UIView()
        bgView.backgroundColor = UIColor.clear
        self.backgroundView = bgView
        self.backgroundColor = UIColor.clear
        self.layer.backgroundColor = UIColor.clear.cgColor
    }
}
