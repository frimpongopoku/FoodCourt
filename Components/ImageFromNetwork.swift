
//  Created by frimpongOpokuAgyemang on 25/12/2020.
//
import Foundation
import SwiftUI

struct ImageFromNetwork: View {
	var link : String
	@StateObject var imageState : ImageLoader  = ImageLoader()
//	var link:String = ""
//	var fallBackImageString:String? = ""
//	@State private var image : Image? = nil
	var body: some View {
		
		RemoteImage(image: imageState.image)
			.onAppear(){
				imageState.fetchImage(link: self.link)
			}
//		image?.resizable() ?? Image(systemName: "photo.fill").resizable()
//		VStack{
//			// ---- if image is not available -----
//			if( image == nil){
//
//				// --- If no fallback image is provided, use a system image
//				if ( self.fallBackImageString == nil || self.fallBackImageString == ""){
//					Image(systemName: "photo.fill")
//						.resizable()
//						.scaledToFit()
//						.frame(width: 100, height: 80)
//
//					//-- show fallback image if provided
//				}else{
//					Image(
//						self.fallBackImageString! )
//						.resizable()
//						.scaledToFit()
//						.frame(width: 100, height: 80)
//				}
//
//				// --- Show loaded network image ---
//			}else{
//
//				image!.resizable()
//					.resizable()
//					.aspectRatio(contentMode: .fit)
//					.frame(width: 100, height: 80)
//					.cornerRadius(10)
//
//			}
//		}.onAppear(){ self.fetchImage() }
	}
	
//	func fetchImage(){
//		guard self.link != "" else { return }
//		InternetExplorer.getInstance.fetchImage(link: self.link, callback: {
//			image in
//			self.image = image
//		})
//
//	}
}

struct RemoteImage:View {
	var image : Image?
	var body : some View {
		image?.resizable() ?? Image(systemName: "photo.fill").resizable()
	}
}

final class ImageLoader : ObservableObject {
	@Published var image : Image? = nil

	func fetchImage(link:String){
			guard link != "" else { return }
			InternetExplorer.getInstance.fetchImage(link: link, callback: {
					image in
				DispatchQueue.main.async{
					self.image = image
				}
					
			})

	}
}


//struct ImageWithFallback : View {
//	var fallbackImage: String?
//	var body : some View {
//		fallbackImage != "" ? Image(fallbackImage!).resizable() : Image(systemName:"photo.fill" ).resizable()
//	}
////}
//struct RemoteImage : View {
//	var image : Image?
//	var fallbackImage : String?
//	var body : some View {
//		image?.resizable()
//		image?.resizable() ?? ImageWithFallback(fallbackImage: fallbackImage ?? "")
//		if( image != nil ) { image?.resizable()}
//		else{
//			if( fallbackImage != nil || fallbackImage != ""){ Image(fallbackImage!).resizable()}
//		}else{
//			Image ( systemName: "photo.fil")
//		}
//		image?.resizable() ?? Image("no-food").resizable()
//	}
//}

struct SwiftUIView_Previews: PreviewProvider {
	static var previews: some View {
		ImageFromNetwork(link:"")
	}
}
