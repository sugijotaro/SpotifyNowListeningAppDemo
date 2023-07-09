//
//  SpotifyAuthManager.swift
//  SpotifyNowListeningAppDemo
//
//  Created by JotaroSugiyama on 2023/07/09.
//

import Foundation
import AuthenticationServices

class SpotifyAuthManager: ObservableObject {
    static let shared = SpotifyAuthManager()
    
    @Published var accessToken: String?
    @Published var refreshToken: String?
    
    private var clientId: String {
        getAPIKey(for: "CLIENT_ID")
    }
    
    private var clientSecret: String {
        getAPIKey(for: "CLIENT_SECRET")
    }
    
    private let redirectUri = "SpotifyNowListeningAppDemo://spotify"
    
    private func getAPIKey(for key: String) -> String {
        guard let filePath = Bundle.main.path(forResource: "Config", ofType: "plist"),
              let plist = NSDictionary(contentsOfFile: filePath),
              let value = plist[key] as? String else {
            fatalError("Failed to get \(key) from Config.plist")
        }
        return value
    }
    
    func getAuthURL() -> URL {
        let scopes = "user-read-currently-playing"
        let base = "https://accounts.spotify.com/authorize"
        let responseType = "code"
        let urlString = "\(base)?client_id=\(clientId)&response_type=\(responseType)&redirect_uri=\(redirectUri)&scope=\(scopes)"
        
        return URL(string: urlString)!
    }
    
    func requestTokens(code: String) {
        guard let url = URL(string: "https://accounts.spotify.com/api/token") else { return }
        
        var components = URLComponents()
        components.queryItems = [
            URLQueryItem(name: "grant_type", value: "authorization_code"),
            URLQueryItem(name: "code", value: code),
            URLQueryItem(name: "redirect_uri", value: redirectUri),
            URLQueryItem(name: "client_id", value: clientId),
            URLQueryItem(name: "client_secret", value: clientSecret)
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = components.query?.data(using: .utf8)
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            if let tokenResponse = try? JSONDecoder().decode(TokenResponse.self, from: data) {
                DispatchQueue.main.async {
                    print("Access token fetched: \(tokenResponse.accessToken)")
                    self.accessToken = tokenResponse.accessToken
                    self.refreshToken = tokenResponse.refreshToken
                }
            } else {
                print("Failed to fetch access token")
            }
        }
        task.resume()
    }
    
    private struct TokenResponse: Decodable {
        let accessToken: String
        let refreshToken: String
        
        enum CodingKeys: String, CodingKey {
            case accessToken = "access_token"
            case refreshToken = "refresh_token"
        }
    }
}
