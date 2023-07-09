//
//  ContentView.swift
//  SpotifyNowListeningAppDemo
//
//  Created by JotaroSugiyama on 2023/07/09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        if SpotifyAuthManager.shared.accessToken == nil {
            SpotifyLoginView()
        } else {
            SpotifyTrackView()
        }
    }
}
