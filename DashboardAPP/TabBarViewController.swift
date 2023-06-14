//
//  TabBarViewController.swift
//  DashboardAPP
//
//  Created by SPURGE on 13/06/23.
//

import UIKit

class TabBarViewController: YSTabBar {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarDelegate = self
        tabBarStyle = .convex
        let coordinators: [YSTabBarCoorinator] = [DependencyInjector.linksVC, DependencyInjector.coursesVC, DependencyInjector.campaignVC, DependencyInjector.profileVC]
        coordinators.forEach { $0.correctedInsets = correctedInsets }
        viewControllers = coordinators.compactMap { $0 as? UIViewController }
        items = coordinators.map { $0.item }
        
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
extension TabBarViewController: YSTabBarDelegate{
    func tabBar(_ sender: YSTabBar, didSelectItemAt index: Int) {
    }
    
    func centerButton(_ sender: UIButton) {
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
    }
}
