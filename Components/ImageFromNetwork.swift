
//  Created by frimpongOpokuAgyemang on 25/12/2020.
//
import Foundation
import SwiftUI

struct ImageFromNetwork: View {
    var link:String = ""
    var fallBackImageString:String? = ""
    @State private var image : Image? = nil
    var body: some View {
        VStack{
            // ---- if image is not available -----
            if( image == nil){
                
                // --- If no fallback image is provided, use a system image
                if ( self.fallBackImageString == nil || self.fallBackImageString == ""){
                    Image(systemName: "photo.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    
                //-- show fallback image if provided
                }else{ Image(self.fallBackImageString! ) }
                
            // --- Show loaded network image ---
            }else{ image!.resizable() }
        }.onAppear(){ self.fetchImage() }
    }
    
    func fetchImage(){
        guard self.link != "" else { return }
        InternetExplorer.getInstance.fetchImage(link: self.link, callback: {
            image in
            self.image = image
        })
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ImageFromNetwork()
    }
}
