//
//  TaxeBoissonAnnuellePdfViewer.swift
//  taxes
//
//  Created by adhoc on 26/11/1437 AH.
//  Copyright © 1437 AH adhoc. All rights reserved.
//

import UIKit

class TaxeBoissonAnnuellePdfViewer: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    var data:NSData?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("this is pdf")
        if data != nil {
        
            webView.loadData(data!, MIMEType: "application/pdf", textEncodingName: "utf-8", baseURL: NSURL())
        }
    }

}
