//
//  ProfileViewController.swift
//  DashboardAPP
//
//  Created by SPURGE on 13/06/23.
//

import UIKit

class ProfileViewController: UIViewController,YSTabBarCoorinator {
   
    let item: UITabBarItem = {
        let icon = UIImage(named: "user-25")
        let item = UITabBarItem(title: Constants.Screen.profile, image: icon, selectedImage: nil)
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
