//
//  TweetRow.swift
//  firebaseios
//
//  Created by Manuel Cazalla on 12/2/24.
//

import SwiftUI
import Kingfisher

struct TweetRow: View {
    var tweet: Tweet
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(tweet.userName)
                .font(.headline)
            if tweet.type == .TEXT {
                Text(tweet.message)
                    .font(.subheadline)
            } else if tweet.type == .IMAGE {
                KFImage(URL(string: tweet.message))
                    .resizable()
                    .placeholder {
                        ProgressView()
                    }
                    .cacheOriginalImage()
                .scaledToFit()
            }
        }
    }
}
