//
//  TopItemCell.swift
//  Hipip
//
//  Created by Sooraj S Nair on 13/11/21.
//

import UIKit

class TopItemCell: UITableViewCell {
    
    @IBOutlet weak var collectionVW: UICollectionView!
    var parentVC = UIViewController()

    override func awakeFromNib() {
        super.awakeFromNib()
        collectionVW.register(UINib(nibName: "TopItemCVCell", bundle: nil), forCellWithReuseIdentifier: "TopItemCVCell")
        collectionVW.autoresizesSubviews = true
    }
    
    func setupCell(){
        collectionVW.dataSource = self
        collectionVW.delegate = self
        collectionVW.setTransparent()
        collectionVW.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension TopItemCell: UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionVW.dequeueReusableCell(withReuseIdentifier: "TopItemCVCell", for: indexPath) as? TopItemCVCell else { return UICollectionViewCell() }
        
        cell.setUpCell()
           return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ((UIScreen.main.bounds.width-40)/3), height:((UIScreen.main.bounds.width-30)/3)+30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }

}
