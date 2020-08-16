//
//  NewsDetailViewController.swift
//  Republic News
//
//  Created by sahil pathania on 13/08/20.
//  Copyright © 2020 sahil pathania. All rights reserved.
//

import UIKit
import WebKit
class NewsDetailViewController: UIViewController {
    
    //MARK:- Outlet
    @IBOutlet weak var webView: WKWebView!
    
    //MARK:- Variable declaration
    var url = ""
    
    //MARK:- Class instantiate
    static func instantiate() -> NewsDetailViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "NewsDetailViewController") as! NewsDetailViewController
    }
    
    //MARK:- Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI(url: url)
    }
    
    /// Open the web page for the selected url
    /// - Parameter url: url of the selected article
    func setupUI(url :String) {
        if let webUrl: NSURL = NSURL(string: "\(url)"){
            let webRequest: NSURLRequest = NSURLRequest(url: webUrl as URL)
            webView.load(webRequest as URLRequest)
        }
    }
    
    /// Close button action handler
    @IBAction func closeBtnClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
