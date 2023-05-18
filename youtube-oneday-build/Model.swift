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
        guard url != nil else {return}
        
        //Get URLSession object
        let session = URLSession.shared
        
        //Get a data task from the URLSession obj
        let dataTask = session.dataTask(with: url!) { data, response, error in
            
            print("jiwo")
            //print(data)
            print(response)
            //print(error)
            
            if let httpResponse = response as? HTTPURLResponse {
                print("error \(httpResponse)")
            }


            
            //Check if any error
            if error != nil || data == nil {
                return
            }
            
            //Parsing the data
            
        }
        
        //Kick off the task
        dataTask.resume()
        
    }
}
