//
//  Track.swift
//  SpotifyNowListeningAppDemo
//
//  Created by JotaroSugiyama on 2023/07/09.
//

import Foundation

struct Track: Decodable {
    let name: String
    let artists: [Artist]

    struct Artist: Decodable {
        let name: String
    }
}
