//
//  SpotifyLoginView.swift
//  SpotifyNowListeningAppDemo
//
//  Created by JotaroSugiyama on 2023/07/09.
//

import SwiftUI
import AuthenticationServices

struct SpotifyLoginView: View {
    @Environment(\.presentationMode) var presentationMode
    private var contextProvider = ContextProvider()
    
    var body: some View {
        Button("Log in with Spotify") {
            let authURL = SpotifyAuthManager.shared.getAuthURL()
            let scheme = "SpotifyNowListeningAppDemo"
            
            let session = ASWebAuthenticationSession(url: authURL, callbackURLScheme: scheme) { callbackURL, error in
                guard error == nil, let callbackURL = callbackURL else { return }
                let queryItems = URLComponents(string: callbackURL.absoluteString)?.queryItems
                if let code = queryItems?.first(where: { $0.name == "code" })?.value {
                    SpotifyAuthManager.shared.requestTokens(code: code)
                    presentationMode.wrappedValue.dismiss()
                }
            }
            session.presentationContextProvider = contextProvider
            session.start()
        }
    }
}

class ContextProvider: NSObject, ASWebAuthenticationPresentationContextProviding {
    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        return UIApplication.shared.windows.first!
    }
}
