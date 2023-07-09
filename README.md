[![Platform](https://img.shields.io/badge/platform-iOS-blue.svg?style=flat)](http://developer.apple.com/ios/)
![Swift 5.3](https://img.shields.io/badge/Swift-5.3-orange.svg)
# Spotify Now Playing
<img src="https://github.com/sugijotaro/SpotifyNowListeningAppDemo/assets/52352924/cb9a0978-c1d4-4d04-b3e5-c146914d6e12" width="24%" />
<img src="https://github.com/sugijotaro/SpotifyNowListeningAppDemo/assets/52352924/9d600ebe-9c89-4ba6-8b74-f5cc2df68e61" width="24%" />
<img src="https://github.com/sugijotaro/SpotifyNowListeningAppDemo/assets/52352924/0a41f0d2-d982-4629-a81d-b9de435875da" width="24%" />
<img src="https://github.com/sugijotaro/SpotifyNowListeningAppDemo/assets/52352924/bf3b50e3-dfbd-49c3-95c9-2537c9796d7b" width="24%" />

Spotify Now PlayingはSpotifyの現在の再生曲を表示するiOS向けのデモアプリです。

## 機能

- Spotifyとの連携ログイン
- 現在再生中の曲の表示
- 手動による再生曲の更新

## セットアップ

1. [Spotify Developer Dashboard](https://developer.spotify.com/dashboard/)にアクセスし、新しいアプリケーションを作成します。
2. アプリケーション設定の"Redirect URIs"に`SpotifyNowListeningAppDemo://spotify`を追加します。
3. "Client ID"と"Client Secret"を取得し、プロジェクトの`Config.plist`ファイルにそれぞれを記述します。具体的には、`Config.plist`は以下のような形式とします。

```xml
<dict>
    <key>CLIENT_ID</key>
    <string>YOUR_CLIENT_ID</string>
    <key>CLIENT_SECRET</key>
    <string>YOUR_CLIENT_SECRET</string>
</dict>
```

`YOUR_CLIENT_ID`と`YOUR_CLIENT_SECRET`の部分はSpotify Developer Dashboardで取得した実際のClient IDとClient Secretに置き換えてください。

---

Spotify Now Playing is a demo iOS app that displays the current track being played on Spotify.

## Features

- Log in via Spotify
- Display the currently playing track
- Manual update of the playing track

## Setup

1. Visit the [Spotify Developer Dashboard](https://developer.spotify.com/dashboard/) and create a new application.
2. In the application settings, add `SpotifyNowListeningAppDemo://spotify` to "Redirect URIs".
3. Obtain the "Client ID" and "Client Secret", and write them in the project's `Config.plist` file respectively. Specifically, the `Config.plist` should be in the following format:

```xml
<dict>
    <key>CLIENT_ID</key>
    <string>YOUR_CLIENT_ID</string>
    <key>CLIENT_SECRET</key>
    <string>YOUR_CLIENT_SECRET</string>
</dict>
```

Replace YOUR_CLIENT_ID and YOUR_CLIENT_SECRET with the actual Client ID and Client Secret obtained from the Spotify Developer Dashboard.
