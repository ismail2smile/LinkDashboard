//
//  DependencyInjector.swift
//  DashboardAPP
//
//  Created by SPURGE on 13/06/23.
//

import Foundation
import UIKit


struct DependencyInjector {
    static var apiManager = try! APIManager()
    
    static var rootViewController: TabBarViewController {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let tabBarVC = storyBoard.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
        return tabBarVC
    }
    
    static var dashboardRepo: DashboardRepository {
        return DashboardRepository(apiManager: apiManager)
    }
    static var linksVM: DashboardViewModel {
        return DashboardViewModel(repo: dashboardRepo)
    }
    
    static var linksVC: LinksViewController {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let linkVC = storyBoard.instantiateViewController(withIdentifier: "LinksViewController") as! LinksViewController
        linkVC.linksViewModel = linksVM
        linksVM.linkViewDelegate = linkVC
        return linkVC
    }
    static var coursesVC: CoursesViewController {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let courseVC = storyBoard.instantiateViewController(withIdentifier: "CoursesViewController") as! CoursesViewController
        return courseVC
    }
    static var addLinkVC: AddLinkViewController {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let addLinkVC = storyBoard.instantiateViewController(withIdentifier: "AddLinkViewController") as! AddLinkViewController
        return addLinkVC
    }
    static var campaignVC: CampaignsViewController {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let campaignVC = storyBoard.instantiateViewController(withIdentifier: "CampaignsViewController") as! CampaignsViewController
        return campaignVC
    }
    static var profileVC: ProfileViewController {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let profileVC = storyBoard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        return profileVC
    }

}
