//
//  InternetExplorer.swift
//  CustomSwiftViews (iOS)
//
//  Created by frimpongOpokuAgyemang on 25/12/2020.
//

import Foundation
import SwiftUI

// ------ A class that is used to make network request calls in swift.
// ------ Returns  InternetResponse everytime ----------
class InternetExplorer{
    static let getInstance = InternetExplorer()
    public var link : String = ""
    private var goToURL : URL{
        return URL (string:self.link)!
    }
    private let networkSession = URLSession.shared;
    
    func search(onComplete: @escaping (InternetResponse) -> Void ){
        
        //---- Escape function if URL is not provided...
        guard self.link != "" else {
            onComplete(InternetResponse(error: .invalidURL))
            return
        }
        let networkTask =  self.networkSession.dataTask(with: self.goToURL, completionHandler:{ data, response, error in
            
           // --- Check if error is available, then return response object with error field set and quit running.
            guard error == nil else {
                onComplete(InternetResponse(error:(.networkError)))
                return;
            }
            let netResponse = InternetResponse(data:data!)
            onComplete(netResponse)
        });
        
        networkTask.resume();
    }
    
    func roamAndFind(link:String?, callback onComplete: @escaping (InternetResponse) -> Void){
        self.link = link ?? ""
        self.search(){ netResponse in
            onComplete(netResponse)
        }
    }
    
    func fetchImage(link:String?, callback onComplete: @escaping (Image?) -> Void) {
        guard link != "" else {
            print("Please check your image URL")
            onComplete(nil)
            return
        }
        
        self.roamAndFind(link:link){
            response in
            guard response.error == nil else {
                print("Error loading message: --->\(response.error?.message ?? "not_internet_error")")
                onComplete(nil)
                return
            }
            
            guard response.data != nil else {
                print("Data from URL is not image");
                onComplete(nil)
                return;
            }
            let newImage = UIImage(data: response.data!)
            let swiftUIImage = Image(uiImage:newImage!);
            onComplete(swiftUIImage)
            return;
            
        }
    }
}

