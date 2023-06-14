//
//  DashboardViewModel.swift
//  DashboardAPP
//
//  Created by SPURGE on 13/06/23.
//

import Foundation

protocol LinkViewControllerDelegate: AnyObject{
    func apiSuccess()
    func apiFailed(error:Error)
}

protocol DashboardViewModelProtocol{
    func fetchDashboard()
}
final class DashboardViewModel:DashboardViewModelProtocol {
    var dashboardData: DashboardResponse?
    var repositry : DashboardRepository
    weak var linkViewDelegate: LinkViewControllerDelegate?
    var analyticDM = [FlowAnalytic]()
    
    init(repo: DashboardRepository){
        repositry = repo
        getFlowAnalyticArray()
    }
    func fetchDashboard() {
        repositry.fetchDashboard { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                self.dashboardData = response
                self.linkViewDelegate?.apiSuccess()
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
                self.linkViewDelegate?.apiFailed(error: error)
            }
        }
    }
    
    func getFlowAnalyticArray(){
        analyticDM.removeAll()
        
        let tempimgArray = ["mousePointer","locationPin","socialMediaWorld"]
        let titleArray = [dashboardData?.total_clicks ?? 0,dashboardData?.top_location ?? "--",dashboardData?.top_source ?? "--"] as [Any]
        let descArray = ["Today's Clicks","Top Location","Top Sources"]
        
        for index in 0..<3 {
            let flowObj = FlowAnalytic(title: "\(titleArray[index])", desc: descArray[index], imageName: tempimgArray[index])
            analyticDM.append(flowObj)
        }
        
    }
    
    func groupGraphAndProject() -> [String:Int]?{
        var graphDict = [String:Int]()
        if let keys = dashboardData?.data?.overall_url_chart?.keys {
            for key in keys {
                let dateStr = Utils.chartDateConvert(dateString: key)
                var clickCount = dashboardData?.data?.overall_url_chart![key]
                if graphDict[dateStr] != nil{
                    let tempCount = graphDict[dateStr]! as Int
                    clickCount = clickCount! + tempCount
                }
                graphDict[dateStr] = clickCount
            }
        }
        return graphDict
        
    }
    
}



