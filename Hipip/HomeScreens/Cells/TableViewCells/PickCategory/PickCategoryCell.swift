//
//  PickCategoryCell.swift
//  Hipip
//
//  Created by Sooraj S Nair on 13/11/21.
//

import UIKit

class PickCategoryCell: UITableViewCell {

    @IBOutlet weak var CollectionVW: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        CollectionVW.register(UINib(nibName: "PickCategoryCVCell", bundle: nil), forCellWithReuseIdentifier: "PickCategoryCVCell")
        CollectionVW.autoresizesSubviews = true
    }
    
    func setupCell(){
        CollectionVW.dataSource = self
        CollectionVW.delegate = self
        CollectionVW.setTransparent()
        CollectionVW.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension PickCategoryCell: UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = CollectionVW.dequeueReusableCell(withReuseIdentifier: "PickCategoryCVCell", for: indexPath) as? PickCategoryCVCell else { return UICollectionViewCell() }
        
        cell.setUpCell()
           return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = "Popular"
        var itemSize = item.size(withAttributes: [
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14)
        ])
        itemSize.height = 60
        itemSize.width =  itemSize.width + 40
        return itemSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
    
}
