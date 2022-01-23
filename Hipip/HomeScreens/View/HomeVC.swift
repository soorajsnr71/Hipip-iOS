//
//  HomeVC.swift
//  Hipip
//
//  Created by Sooraj S Nair on 13/11/21.
//

import UIKit
import MMPlayerView

class HomeVC: UIViewController {
    
    let mmPlayerLayer = MMPlayerLayer()
    
    @IBOutlet weak var tableVW: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        tableVW.register(UINib(nibName: "TopItemCell", bundle: nil), forCellReuseIdentifier: "TopItemCell")
        tableVW.register(UINib(nibName: "PickCategoryCell", bundle: nil), forCellReuseIdentifier: "PickCategoryCell")
        tableVW.register(UINib(nibName: "HomeHeaderCell", bundle: nil), forCellReuseIdentifier: "HomeHeaderCell")
        tableVW.register(UINib(nibName: "MainPlayerCell", bundle: nil), forCellReuseIdentifier: "MainPlayerCell")
        
        tableVW.rowHeight = UITableView.automaticDimension
        tableVW.setTransparent()
    }
    
    
    @IBAction func menuAction(_ sender: Any) {
    }
    @IBAction func searchAction(_ sender: Any) {
    }
    
}


extension HomeVC:UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0{
            let headerView = UIView()
            let headerCell = tableView.dequeueReusableCell(withIdentifier: "HomeHeaderCell") as? HomeHeaderCell
            headerCell?.HeaderText.text = "Top 20 On Fire"
            headerView.addSubview(headerCell ?? UITableViewCell())
            return headerView
        }else{
            let headerView = UIView()
            let headerCell = tableView.dequeueReusableCell(withIdentifier: "HomeHeaderCell") as? HomeHeaderCell
            headerCell?.HeaderText.text = "Pick your Hip Pip"
            headerView.addSubview(headerCell ?? UITableViewCell())
            return headerView
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 2{
            return 3;
        }
        return 1;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TopItemCell", for: indexPath) as? TopItemCell else { return UITableViewCell() }
            cell.setupCell()
            return cell
        }
        
        if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PickCategoryCell", for: indexPath) as? PickCategoryCell else { return UITableViewCell() }
            cell.setupCell()
            return cell
        }
        
        if indexPath.section == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainPlayerCell", for: indexPath) as? MainPlayerCell else { return UITableViewCell() }
            cell.loadVideo(url: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")

            return cell
        }
        
        
        return UITableViewCell()
    }
    
    
}
