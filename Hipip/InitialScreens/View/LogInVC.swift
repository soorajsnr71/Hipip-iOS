//
//  LogInVC.swift
//  Hipip
//
//  Created by Sooraj S Nair on 27/06/21.
//

import UIKit
import Foundation

class LogInVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func siignInAction(_ sender: Any) {
        let  mainView = UIStoryboard(name:"Home", bundle: nil)
        let viewcontroller : UIViewController = mainView.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        self.navigationController?.pushViewController(viewcontroller, animated: true)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
