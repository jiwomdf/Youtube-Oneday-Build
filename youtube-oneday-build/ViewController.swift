//
//  ViewController.swift
//  youtube-oneday-build
//
//  Created by MAC on 16/05/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var video = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set itself as a datasource and the delegate
        tableView.dataSource = self
        tableView.delegate = self
        
        // set itself as a delegate of the model
        model.delegate = self
        
        model.getVideo()
    }
    
    // MARK: - Model delegate method
    func videoFetched(_ video: [Video]) {
        //set the return video to our video property
        self.video = video
        
        //refresh the table view
        tableView.reloadData()
    }

    // MARK: - table view method
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constans.VIDEOCELL_ID, for: indexPath)
        
        //Configure the cell with the data
        //Get the title for the video in question
        let title = self.video[indexPath.row].title
        
        cell.textLabel?.text = title
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return video.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

