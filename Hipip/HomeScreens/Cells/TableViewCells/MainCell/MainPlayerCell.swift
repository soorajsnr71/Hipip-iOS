//
//  MainPlayerCell.swift
//  Hipip
//
//  Created by Sooraj S Nair on 13/11/21.
//

import UIKit

class MainPlayerCell: UITableViewCell {

    @IBOutlet weak var ProfilePicture: UIImageView!
    @IBOutlet weak var HipipButton: UIButton!
    @IBOutlet weak var buttonBG: UIView!
    @IBOutlet weak var imgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
