
//  Created by frimpongOpokuAgyemang on 25/12/2020.
//

import UIKit
import SwiftUI
//-- Spinner is not available in swiftUI yet, so UIKIT ActivityIndidcatorView is meant to be used
struct Spinner : UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        // -- Initialiase the spinner [ A Spinner in IOS is called UIActivityIndicatorView ]
        let spinner  = UIActivityIndicatorView(style: .large);
        //--- now add modifications to the spinner -----
        spinner.color = UIColor(Color.red);
        spinner.startAnimating();
        return spinner;
    }
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
}
        
