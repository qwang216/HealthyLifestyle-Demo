//
//  Logger.swift
//  Healthy Lifestyle
//
//  Created by Jason wang on 6/13/21.
//

import Foundation

/// Use this class to log any analytics if needed
class Logger {
    static let shared = Logger()
    func log(_ info: String) {
        print(info)
    }

    func logError(_ error: Error) {
        print(error.localizedDescription)
    }
}
