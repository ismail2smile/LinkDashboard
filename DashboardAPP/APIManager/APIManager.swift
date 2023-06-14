//
//  APIManager.swift
//  DashboardAPP
//
//  Created by SPURGE on 13/06/23.
//

import Foundation
enum APIError: Error {
    case invalidURL
    case noData
}

protocol APIRepository {
    func fetchDashboard( completion: @escaping (Result<DashboardResponse, Error>) -> Void)
    // Define other methods for different API endpoints and actions
}
class APIManager {
    static let shared = APIManager()
    
       private let token = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjU5MjcsImlhdCI6MTY3NDU1MDQ1MH0.dCkW0ox8tbjJA2GgUx2UEwNlbTZ7Rr38PVFJevYcXFI"
       
       func fetchDashboardData(completion: @escaping (Result<DashboardResponse, Error>) -> Void) {
           guard let url = URL(string:Constants.URLConstants.baseUrl + Constants.URLConstants.dashboard) else {
               completion(.failure(APIError.invalidURL))
               return
           }
           var request = URLRequest(url: url)
           request.httpMethod = "GET"
           request.setValue("application/json", forHTTPHeaderField: "Content-Type")
           request.setValue(token, forHTTPHeaderField: "Authorization")
           
           let task = URLSession.shared.dataTask(with: request) { (data, _, error) in
               
               if let error = error {
                   completion(.failure(error))
                   return
               }
               
               guard let data = data else {
                   completion(.failure(APIError.noData))
                   return
               }
               
               do {
                   let response = try JSONDecoder().decode(DashboardResponse.self, from: data)
                   completion(.success(response))
               } catch {
                   print("errorr---",error.localizedDescription)
                   completion(.failure(error))
               }
           }
           
           task.resume()
       }
}
