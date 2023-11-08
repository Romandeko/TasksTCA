//
//  Constants.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 8.11.23.
//

import Foundation

// MARK: - Constants

public enum Constants {
    
    // MARK: - NetWork
    
    public enum NetWork {
        
        /// URL for spaceflightnewsapi
        public static let apiURL = URL(string: "https://api.spaceflightnewsapi.net/v4").unsafelyUnwrapped
        
        /// Limit for obtained articles
        public static let articlesLimit = 10
    }
}
