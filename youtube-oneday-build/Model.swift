//
//  Model.swift
//  youtube-oneday-build
//
//  Created by MAC on 18/05/23.
//

import Foundation

protocol ModelDelegate {
    func videoFetched(_ video:[Video])
}

class Model {
    
    var delegate: ModelDelegate?
    
    func getVideo() {
        
        //Create url object
        let url = URL(string: Constans.API_URL)
        
        guard url != nil else {return}
        
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
                
                if response.items != nil {
                    
                    DispatchQueue.main.async {
                        //call the "videoFetched" method of the delegate
                        self.delegate?.videoFetched(response.items!)
                    }
                }
                
                dump(response)
            } catch {
                print("catch \(error)")
            }
            
        }
        
        //Kick off the task
        dataTask.resume()
        
    }
}
