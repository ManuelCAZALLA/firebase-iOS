//
//  YouTubrView.swift
//  AppForVision pro
//
//  Created by Manuel Cazalla Colmenero on 12/2/24.
//

import Foundation
import WebKit
import SwiftUI

struct YouTubeVideo: UIViewRepresentable {
    let videoId: String
    
    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let youtubeURLString = "https://www.youtube.com/watch?v=\(videoId)"
        print(youtubeURLString)
        
        guard let youtubeURL = URL(string: youtubeURLString) else {
            print("Error: La URL de YouTube no es válida")
            return
        }
        
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: youtubeURL))
    }
}
