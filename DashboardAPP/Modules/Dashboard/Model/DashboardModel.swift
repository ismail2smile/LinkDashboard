//
//  DashboardModel.swift
//  DashboardAPP
//
//  Created by SPURGE on 13/06/23.
//

import Foundation

struct DashboardResponse: Codable {
    let status: Bool?
    let statusCode: Int?
    let message: String?
    let support_whatsapp_number: String?
    let extra_income: Double?
    let total_links: Int?
    let total_clicks: Int?
    let today_clicks: Int?
    let top_source: String?
    let top_location: String?
    let startTime: String?
    let links_created_today: Int?
    let applied_campaign: Int?
    let data: DashboardData?
}

struct DashboardData: Codable {
    let recent_links: [Link]?
    let top_links: [Link]?
    let overall_url_chart: [String: Int]?
}

struct Link: Codable {
    let url_id: Int?
    let web_link: String?
    let smart_link: String?
    let title: String?
    let total_clicks: Int?
    let original_image: String?
    let thumbnail: String?
    let times_ago: String?
    let created_at: String?
    let domain_dd: String?
    let url_prefix: String?
    let url_suffix: String?
    let app: String?
}

struct FlowAnalytic{
    let title:String?
    let desc:String?
    let imageName:String?
}
