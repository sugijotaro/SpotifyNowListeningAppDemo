//
//  ContentView.swift
//  SpotifyNowListeningAppDemo
//
//  Created by JotaroSugiyama on 2023/07/09.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var authManager = SpotifyAuthManager.shared
    
    var body: some View {
        Group {
            if authManager.accessToken == nil {
                SpotifyLoginView()
            } else {
                SpotifyTrackView()
            }
        }
    }
}
