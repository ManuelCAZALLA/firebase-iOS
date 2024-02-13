//
//  CurrentDate.swift
//  firebaseios
//
//  Created by Manuel Cazalla on 10/2/24.
//

import Foundation

extension Date {
    var currentDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMddHHmmss"
        return formatter.string(from: self)
    }
}
