//
//  RegisterViewController.swift
//  EricssonShowCaseApp
//
//  Created by Mohamed Kleit on 2016-07-14.
//  Copyright © 2016 Mohamed Kleit. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerButtonTapped(sender: AnyObject) {
        
        let userEmail = userEmailTextField.text!;
        let userPassword = userPasswordTextField.text!;
        let userRepeatPassword = repeatPasswordTextField.text!;
        
        
        // Check for empty fields
        if (userEmail.isEmpty || userPassword.isEmpty || userRepeatPassword.isEmpty)
        {
            //Display alert message
            displayMyAlertMessage("All fields are required");
            return;
        }
        
        // Check if password match
        if (userPassword != userRepeatPassword)
        {
            // Display alert message
            displayMyAlertMessage("Passwords do not match");
            return;
        }
        
        // Store data
        NSUserDefaults.standardUserDefaults().setObject(userEmail, forKey:"userEmail");
        NSUserDefaults.standardUserDefaults().setObject(userPassword, forKey:"userPassword");
        NSUserDefaults.standardUserDefaults().synchronize();

        
        // Display alert message with confirmation
        var myAlert = UIAlertController(title:"Hey!", message: "Registration is successful. Thank you!", preferredStyle: UIAlertControllerStyle.Alert);
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.Default)
        {
            action in self.dismissViewControllerAnimated(true, completion:nil)
        }
        
        myAlert.addAction(okAction);
        self.presentViewController(myAlert, animated:true, completion:nil);
        
        
    }
    
    func displayMyAlertMessage(userMessage: String)
    {
        var myAlert = UIAlertController(title:"Hey!", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert);
        
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.Default, handler:nil);
        
        myAlert.addAction(okAction);
        
        self.presentViewController(myAlert, animated:true, completion:nil);
    }

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
