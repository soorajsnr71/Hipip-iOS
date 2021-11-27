//
//  HomeHeaderCell.swift
//  Hipip
//
//  Created by Sooraj S Nair on 14/11/21.
//

import UIKit

class HomeHeaderCell: UITableViewCell {

    @IBOutlet weak var HeaderText: UILabel!
    @IBOutlet weak var Button: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.frame.size.width = UIScreen.main.bounds.width
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func ButtonClick(_ sender: Any) {
    }
}
