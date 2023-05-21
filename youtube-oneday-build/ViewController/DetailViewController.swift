//
//  DetailViewController.swift
//  youtube-oneday-build
//
//  Created by MAC on 21/05/23.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var textView: UITextView!
    
    var video: Video?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //clear the field
        titleLabel.text = ""
        dateLabel.text = ""
        textView.text = ""
        
        // check if there is a video
        guard video != nil else { return }
        
        //create the imbaded url
        let embedUrlString = Constans.YT_EMBED_URL + video!.videoId
        
        //load it into the webview
        let url = URL(string: embedUrlString)
        let request = URLRequest(url: url!)
        webView.load(request)
        
        //set the title
        titleLabel.text = video?.title ?? ""
        
        //set the date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        dateLabel.text = df.string(from: video!.published)
        
        //set the dsc
        textView.text = video?.description ?? ""
    }
    
    
}
