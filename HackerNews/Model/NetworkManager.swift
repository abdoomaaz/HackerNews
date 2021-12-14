//
//  NetworkManager.swift
//  HackerNews
//
//  Created by playground on 23.10.21.
//

import Foundation


class NetworkManager: ObservableObject {
    
   @Published var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page"){
            let session: URLSession = URLSession(configuration: .default)
            let task: URLSessionDataTask = session.dataTask(with: url) { data, response, err in
                if err == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        }catch {
                            print(error)
                        }
                    }
                        
                }
                
            }
            task.resume()
        }
        
    }
    
}
