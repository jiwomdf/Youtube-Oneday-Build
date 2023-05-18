//
//  Constants.swift
//  youtube-oneday-build
//
//  Created by MAC on 18/05/23.
//

import Foundation

struct Constans {
    
    static var API_KEY = "AIzaSyCiLTA5mqBEZMpPJIgdGtV2s8rasq0alZs"
    static var PLAYLIST_ID = "PLMRqhzcHGw1aLoz4pM_Mg2TewmJcMg9ua"
    static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlists?part=snippet&id=\(Constans.PLAYLIST_ID)&key=\(Constans.API_KEY)"
}
