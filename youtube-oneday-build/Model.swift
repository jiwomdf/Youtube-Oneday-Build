//
//  Model.swift
//  youtube-oneday-build
//
//  Created by MAC on 18/05/23.
//

import Foundation

class Model {
    
    func getVideo() {
        
        //Create url object
        let url = URL(string: Constans.API_URL)
        //TODO JIWO
        print(url)
        
        guard url != nil else {return}
        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.setValue("Authorization", forHTTPHeaderField: "Bearer \(Constans.API_KEY)")
        request.setValue("Accept", forHTTPHeaderField: "application/json")

        
        //Get a data task from the URLSession obj
        let dataTask = URLSession.shared.dataTask(with: url!) { data, response, error in
            
            //Check if any error
            if error != nil || data == nil {
                return
            }
            
            do {
                //Parsing the data into video obj
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                
                dump(response)
            } catch {
                print("catch \(error)")
            }
            
        }
        
        //Kick off the task
        dataTask.resume()
        
    }
}
