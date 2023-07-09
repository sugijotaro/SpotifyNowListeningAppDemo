//
//  SpotifyTrackViewModel.swift
//  SpotifyNowListeningAppDemo
//
//  Created by JotaroSugiyama on 2023/07/09.
//

import Foundation

class SpotifyTrackViewModel: ObservableObject {
    @Published var currentTrack: SpotifyTrack?
    
    func getCurrentTrack() {
        guard let accessToken = SpotifyAuthManager.shared.accessToken else { return }
        let url = URL(string: "https://api.spotify.com/v1/me/player/currently-playing")!
        
        var request = URLRequest(url: url)
        request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                let decodedResponse = try? JSONDecoder().decode(SpotifyTrack.self, from: data)
                DispatchQueue.main.async {
                    self.currentTrack = decodedResponse
                }
            }
        }.resume()
    }
}
