//
//  InternetResponse.swift
//  CustomSwiftViews (iOS)
//
//  Created by frimpongOpokuAgyemang on 25/12/2020.
//

import Foundation

// --- A model that is used as type to parse values obtained from a network request ---
// --- Inits with either available Data or InternetError
struct InternetResponse {
    var data : Data?
    var decoder  = JSONDecoder();
    var error : InternetError?
    
    init(error:InternetError) {
        self.error = error;
    }
    
    init(data:Data) {
        self.data = data;
    }
}
