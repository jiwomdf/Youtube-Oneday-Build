//
//  VideoTableViewCell.swift
//  youtube-oneday-build
//
//  Created by MAC on 20/05/23.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var video: Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ v: Video){
        
        video = v
        
        // Ensure the video not null
        guard video != nil else {return}
        
        //set the title and date label
        titleLabel.text = video?.title
        
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        dateLabel.text = df.string(from: video!.published)
        
        //set the thumbnail
        guard video?.thumbnail != "" else {return}
        
        //Check cache before downloading data
        if let cachedData = CacheManager.getVideoCache(video!.thumbnail) {
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return
        }
        
        //Download thumbnail data
        let url = URL(string: video!.thumbnail)
        
        let dataTask = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil && data != nil {
                
                // save data in cache
                CacheManager.setVideoCache(url!.absoluteString, data!)
                
                if url!.absoluteString != self.video?.thumbnail {
                    //Video call has been recycled for another video and no longer matches the
                    //thumbnail that was downloaded
                    return
                }
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = UIImage(data: data!)
                }
            }
        }
        
        dataTask.resume()
    }

}
