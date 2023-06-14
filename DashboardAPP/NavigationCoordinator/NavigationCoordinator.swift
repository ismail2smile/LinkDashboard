//
//  NavigationCoordinator.swift
//  DashboardAPP
//
//  Created by SPURGE on 13/06/23.
//

import Foundation
import UIKit

final class NavCoordinator {
    
    final let rootView = DependencyInjector.rootViewController
    
    // MARK: - Methods
     func rootViewController() -> TabBarViewController{    
       return rootView
    }
    
}
