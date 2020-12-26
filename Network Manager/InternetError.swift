//
//  InternetError.swift
//  CustomSwiftViews (iOS)
//
//  Created by frimpongOpokuAgyemang on 25/12/2020.
//

import Foundation

enum InternetError:Error{
    case networkError
    case unknownError
    case randomError
    case emptyData
    case invalidURL
    
    var message :String {
        switch self {
        case .networkError:
            return "Looks like something happened to your network.";
        case .emptyData :
            return "Looks like your request did not return any data";
        case .invalidURL :
            return " Your URL might be invalid";
        default:
            return ""
        }
            
    }
}
