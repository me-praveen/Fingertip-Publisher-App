//
//  ViewController.swift
//  Fingertip Publisher App
//
//  Created by T, Praveen on 10/06/21.
//

import UIKit
import WebViewLoginModule
import CoreData
import WebKit
import Alamofire
//import NetWorkingFiles


public class ViewController: UIViewController  {
    
    public var LoginURL = "https://mylan-publisher.devweb01.fingertipformulary.com/custom_templates"
    public var PRODUCT_MYLAN = "https://mylan-publisher.devweb01.fingertipformulary.com"
    
    var tok: String!
    
    public override func viewDidLoad() {
        var loginParameters = [String : Any]()
        let rootVC = FormularyScreen()
        
        loginParameters["user"] = "mylan2@dresources.com"
        loginParameters["password"] = "fineFLAG86"
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        loginChecker.getTok(withParameters: loginParameters, success: { [self] (userdata, username, sessionKey) in
            tok = DRGHTTPConnectionManger.sharedInstance.authorizationHeader["AUTHORIZATION"]
            if (tok != nil) {
                rootVC.tok = tok
                let navVC = UINavigationController(rootViewController: rootVC)
                navVC.modalPresentationStyle = .fullScreen
                present(navVC, animated: true)
            } else {
                present(self, animated: true)
            }
            appDelegate?.loginSuccessfullForUsername(username: username ?? "", sessionkey: sessionKey ?? "")
        }, failure: {
        })
        
    }
    
}

