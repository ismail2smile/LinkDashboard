//
//  DashboardRepositry.swift
//  DashboardAPP
//
//  Created by SPURGE on 13/06/23.
//

import Foundation

class DashboardRepository: APIRepository {
    
    private let apiManager: APIManager
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
    func fetchDashboard(completion: @escaping (Result<DashboardResponse, Error>) -> Void){
        apiManager.fetchDashboardData { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
