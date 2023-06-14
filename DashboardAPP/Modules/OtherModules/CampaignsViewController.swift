//
//  CampaignsViewController.swift
//  DashboardAPP
//
//  Created by SPURGE on 13/06/23.
//

import UIKit

class CampaignsViewController: UIViewController,YSTabBarCoorinator {
    let item: UITabBarItem = {
        let icon = UIImage(named: "campaign-35")
        let item = UITabBarItem(title: Constants.Screen.campaign, image: icon, selectedImage: nil)
        return item
    }()
        
    var correctedInsets: UIEdgeInsets = .zero
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
