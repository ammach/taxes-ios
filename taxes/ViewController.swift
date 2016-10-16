//
//  ViewController.swift
//  taxes
//
//  Created by adhoc on 26/09/1437 AH.
//  Copyright © 1437 AH adhoc. All rights reserved.
//

import UIKit
import PDFGenerator

class ViewController: UIViewController {
    
    @IBOutlet weak var topLogin: NSLayoutConstraint!
    @IBOutlet weak var leadingUsername: NSLayoutConstraint!
    @IBOutlet weak var trailingUsername: NSLayoutConstraint!
    @IBOutlet weak var leadingPassword: NSLayoutConstraint!
    @IBOutlet weak var trailingPassword: NSLayoutConstraint!
    

    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var passwordEdit: UITextField!
    @IBOutlet weak var usernameEdit: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
 
        usernameEdit.attributedPlaceholder = NSAttributedString(string:"username",attributes:[NSForegroundColorAttributeName: UIColor(red: 84/255, green: 124/255, blue:102/255, alpha: 1)])
        
        passwordEdit.attributedPlaceholder = NSAttributedString(string:"password",attributes:[NSForegroundColorAttributeName: UIColor(red: 84/255, green: 124/255, blue:102/255, alpha: 1)])
        
        loginBtn.layer.borderWidth=3
        let color:UIColor=UIColor(red: 84/255, green: 124/255, blue:102/255, alpha: 1)
        loginBtn.layer.borderColor=color.CGColor
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        UIView.animateWithDuration(2) {
            self.leadingUsername.constant -= self.view.bounds.width
            self.trailingUsername.constant += self.view.bounds.width
            self.trailingPassword.constant -= self.view.bounds.width
            self.leadingPassword.constant += self.view.bounds.width
            
            self.topLogin.constant -= self.view.bounds.height
            self.view.layoutIfNeeded()
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        leadingUsername.constant += view.bounds.width
        trailingUsername.constant -= view.bounds.width
        trailingPassword.constant += view.bounds.width
        leadingPassword.constant -= view.bounds.width
        
        topLogin.constant += view.bounds.height
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func login(sender: AnyObject) {
        
        if usernameEdit.text=="" || passwordEdit.text=="" {
            
            let alert=UIAlertController(title: "Attention", message: "veuillez entrer vos données", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "ok", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        else{
            print("pressed")
       let url=NSURL(string: "http://"+Configuration.ADDR_IP+":28075/taxe3_new/webresources/user/login")
            let request=NSMutableURLRequest(URL: url!)
            request.HTTPMethod="POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            let user=User(login: usernameEdit.text!, password: passwordEdit.text!)
            do{
                let persoJSON=try NSJSONSerialization.dataWithJSONObject(user.toAnyObject(), options: [])
                request.HTTPBody=persoJSON
            }catch{}
            
            let task=NSURLSession(configuration:NSURLSessionConfiguration.defaultSessionConfiguration()).dataTaskWithRequest(request, completionHandler: { (data, response, error) in
                if let responseData=data{
                    let resp=NSString(data: responseData, encoding: NSUTF8StringEncoding)?.doubleValue
                    if resp<0 {
                        print(resp!)
                        print("données erronées")
                        
                    }else{
                        print(resp!)
                        
                        dispatch_async(dispatch_get_main_queue(), {
                             self.performSegueWithIdentifier("connected", sender: sender)
                        })
                       
                        
                    }
                }
            })
            task.resume()
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier=="connected" {
            
            let navController=segue.destinationViewController as! UINavigationController
        
            let dest=navController.topViewController as! MenuViewController
            dest.userName="Bienvenue "+usernameEdit.text!
        }
        
    }
}

