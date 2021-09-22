//
//  LocationApi.swift
//  TestTaskArbita
//
//  Created by Petro on 21.09.2021.
//

import Foundation

class LocationApi {
    
    let apiKey: String
    let session: URLSession
    lazy var jsonDecoder = JSONDecoder()
    
    init(apiKey: String, session: URLSession = URLSession.shared) {
        self.apiKey = apiKey
        self.session = session
    }
    
    func getSources(completion: @escaping (Result<LocationResponse, Error>) -> Void ) {
        /*
         URLSession.shared.dataTask(with: request) { (data, response, error) in
         guard error == nil else { print(error!.localizedDescription); return }
         guard let data = data else { print("Empty data"); return }
         
         if let str = String(data: data, encoding: .utf8) {
         print(str)
         }
         }.resume()*/
        
        let urlComponents = URLComponents(string: "https://ipinfo.io/?token=\(apiKey)")!
        
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request) { [self] (data, response, error) in
            
            guard let data = data, error == nil else {
                completion(.failure(error!))
                return
            }
            
            do {
                let response = try self.jsonDecoder.decode(LocationResponse.self, from: data)
                completion(.success(response))
            }
            catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
