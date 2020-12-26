//
//  XDismiss.swift
//  FoodCourt (iOS)
//
//  Created by frimpongOpokuAgyemang on 26/12/2020.
//

import SwiftUI

struct XDismiss: View {
	var body: some View {
		Button{
			
		}label:{
			ZStack{
				Circle()
					.frame(width:30, height:30)
					.foregroundColor(Color(.systemBackground))
					.opacity(0.6)
				Image(systemName:"xmark")
					.imageScale(.small)
					.frame(width:44, height:44)
					.foregroundColor(Color.black )
			}
		}
	}
}

struct XDismiss_Previews: PreviewProvider {
	static var previews: some View {
		XDismiss()
	}
}
