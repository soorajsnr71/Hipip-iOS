//
//  PickCategoryCVCell.swift
//  Hipip
//
//  Created by Sooraj S Nair on 13/11/21.
//

import UIKit

class PickCategoryCVCell: UICollectionViewCell {

    @IBOutlet weak var catButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setUpCell(){
        catButton.setTitle("Popular", for: .normal)
        catButton.ovalCorner()
    }
}
