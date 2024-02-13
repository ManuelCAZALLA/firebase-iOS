//
//  TweetsViewModelProtocol.swift
//  firebaseios
//
//  Created by Manuel Cazalla on 11/2/24.
//

import Foundation

protocol TweetsViewModelProtocol {
    func fetchTweets(onSuccess: @escaping ([Tweet]) -> Void, onFailure: @escaping (Error) -> Void)
    func postTweet(tweet: Tweet, onSuccess: @escaping () -> Void, onFailure: @escaping (Error) -> Void)
}
