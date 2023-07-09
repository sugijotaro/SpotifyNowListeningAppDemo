//
//  TrackViewModel.swift
//  SpotifyNowListeningAppDemo
//
//  Created by JotaroSugiyama on 2023/07/09.
//

import Foundation

class TrackViewModel: ObservableObject {
    @Published var currentTrack: Track?
    
    private let accessToken: String = {
        guard let urlBasePath = Bundle.main.path(forResource: "Config", ofType: "plist"),
              let plist = NSDictionary(contentsOfFile: urlBasePath),
              let urlBase = plist["API_KEY"] as? String else {
            fatalError("Failed to get API_KEY from Config.plist")
        }
        return urlBase
    }()
    
    func getCurrentTrack() {
        let url = URL(string: "https://api.spotify.com/v1/me/player/currently-playing")!
        
        var request = URLRequest(url: url)
        request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                let decodedResponse = try? JSONDecoder().decode(Track.self, from: data)
                DispatchQueue.main.async {
                    self.currentTrack = decodedResponse
                }
            }
        }.resume()
    }
}
