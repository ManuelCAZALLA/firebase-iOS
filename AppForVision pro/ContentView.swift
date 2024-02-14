//
//  ContentView.swift
//  AppForVision pro
//
//  Created by Manuel Cazalla Colmenero on 12/2/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @State var viewModel = ViewModel()
    
    var body: some View {
        NavigationSplitView {
            List(viewModel.videos, selection: $viewModel.videosIds ) {video in
                VStack {
                    AsyncImage(url: .init(string: video.thumbnailURL), scale: 1.0){
                        image in
                        image.resizable()
                            .scaledToFit()
                            .cornerRadius(20)
                        
                        
                    } placeholder: {
                        ProgressView()
                    }
                    
                }
                Text(video.title)
            }
            .navigationTitle("Videoclips")
        } detail: {
            VStack {
                if !viewModel.isVideoIdsEmpty() {
                    VStack {
                        Text(viewModel.getSelectedVideoTitle())
                            .font(.largeTitle)
                        
                        YouTubeVideo(videoId: viewModel.getSelectedVideoURL())
                            .padding()
                    }
                }
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
