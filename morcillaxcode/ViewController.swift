//
//  ViewController.swift
//  morcillaxcode
//
//  Created by Luis José Sánchez Carrasco on 24/10/17.
//  Copyright © 2017 Luis José Sánchez Carrasco. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var btnRR: UIButton!
    @IBOutlet weak var btnL: UIButton!
    
    @IBOutlet weak var btnGo: UIButton!
    @IBOutlet weak var lblBajo: UILabel!
    @IBOutlet weak var url: UITextField!
    @IBOutlet weak var web: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
         url.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
         btnGo.isEnabled=false
         btnL.isEnabled=false
         btnRR.isEnabled=false
          }
    func textFieldDidChange(_ textField: UITextField) {
        if web.canGoBack {
            btnL.isEnabled=true
            
        }
        else {
            btnL.isEnabled=false
        }
        
        if web.canGoForward {
            btnRR.isEnabled=true
            
        }
        else {
            btnRR.isEnabled=false
        }
        
        if (url.text?.characters.count)! > 0 {
            btnGo.isEnabled=true
        }
        else {
            btnGo.isEnabled=false

        }
        
    }
    @IBAction func btnLeft(_ sender: Any) {
        web.goBack()
    }
    
    @IBAction func btnRight(_ sender: Any) {
        web.goForward()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func webViewDidStartLoad(_ webView: UIWebView) {
        lblBajo.text=web.request?.description
        
        
      
    }

    
   

    @IBAction func go(_ sender: Any) {
        
               if url.text != "" {
                    if (url.text?.characters.count)! > 7 {
                        let index1 = url.text?.index((url.text?.startIndex)!, offsetBy: 7)
                
                        let substring1 = url.text?.substring(to: index1!)
                        if substring1?.uppercased() != "HTTP://" {
                    url.text="http://"+url.text!
                        }
                }
                    else {
                        url.text="http://"+url.text!
                }
                
                
            
        }
         web.loadRequest(URLRequest(url: URL(string: url.text!)!))
    }
}

