//
//  FormularyScreen.swift
//  Fingertip Publisher App
//
//  Created by T, Praveen on 10/06/21.
//

import Foundation
import UIKit
import WebViewLoginModule
//import NetWorkingFiles

class FormularyScreen: UIViewController {

    var tok = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        title = "Formulary Screen"
        let label = UILabel(frame: CGRect(x: 50, y: 20, width: self.view.frame.width, height: self.view.frame.height))
        label.textAlignment = .center
        label.text = tok
        label.numberOfLines = 3
        self.view.addSubview(label)
        let button = UIBarButtonItem(title: "LoginPage", style: .done, target: self, action:  #selector(buttonAction))
        self.navigationItem.rightBarButtonItem = button
      }


    
    @objc func buttonAction(sender: UIButton!) {
      print("Button tapped")
        let vc = WebViewController()
        vc.view.backgroundColor = .white
        vc.loadLoginScreen(url: DRGCustomizationManager.LoginURL())
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}

