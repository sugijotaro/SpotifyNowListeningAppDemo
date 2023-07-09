//
//  SpotifyTrackView.swift
//  SpotifyNowListeningAppDemo
//
//  Created by JotaroSugiyama on 2023/07/09.
//

import SwiftUI

struct SpotifyTrackView: View {
    @ObservedObject var viewModel = SpotifyTrackViewModel()
    
    var body: some View {
        VStack {
            if let track = viewModel.currentTrack {
                Text(track.name)
                Text(track.artists.first?.name ?? "")
            } else {
                Text("No track is currently playing.")
            }
        }.onAppear {
            viewModel.getCurrentTrack()
        }
    }
}
