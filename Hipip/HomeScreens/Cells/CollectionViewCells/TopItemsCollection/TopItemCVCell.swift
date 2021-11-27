//
//  TopItemCVCell.swift
//  Hipip
//
//  Created by Sooraj S Nair on 13/11/21.
//

import UIKit

class TopItemCVCell: UICollectionViewCell {
    @IBOutlet weak var BG_imgVW: UIImageView!
    @IBOutlet weak var imgVW: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
      
    func setUpCell(){
        BG_imgVW.standerdCornerRadius()
        imgVW.standerdCornerRadius()
    }
}
