//
//  Constants.swift
//  DashboardAPP
//
//  Created by SPURGE on 13/06/23.
//

import Foundation


struct Constants {
    static let appName = "OpeninApp"
    struct Screen{
        static let link = "Link"
        static let courses = "Courses"
        static let campaign = "Campaigns"
        static let profile = "Profile"
    }
    struct URLConstants {
        static let host = "https://api.inopenapp.com/api/"
        static let v1 = "v1"
        static let baseUrl = host + v1
        static let dashboard = "https://api.inopenapp.com/api/v1/dashboardNew"
//        "/dashboardNew"  // endpoint
    }
}
//https://api.inopenapp.com/api/v1/dashboardNew
