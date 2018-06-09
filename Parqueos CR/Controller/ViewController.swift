//
//  ViewController.swift
//  Parqueos CR
//
//  Created by MacBookDesarrolloTecno on 3/5/18.
//  Copyright © 2018 Technical-PC. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    let FacebookLogin:LoginFacebookModel = LoginFacebookModel()

    @IBOutlet weak var labelNombre: UILabel!
    @IBOutlet weak var labelCorreo: UILabel!
    @IBOutlet weak var profilePicture: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (FacebookLogin.FBAccessToken != nil)
        {
            // User is already logged in, do work such as go to next view controller.
            print("Usted ya se encuentra logueado")
        }
        else
        {
            let loginButton = FacebookLogin.FBloginButton
            loginButton.center = CGPoint(x: 160, y: 597);
            loginButton.readPermissions = ["public_profile", "email", "user_friends"]
            loginButton.delegate = FacebookLogin.FBDelegate
            
            loginButton.addTarget(self, action: #selector(self.loginButtonClicked), for: .touchUpInside)
            
            self.view.addSubview(loginButton)
        }
        
       /* let myLoginButton = UIButton(type: .custom)
        myLoginButton.backgroundColor = UIColor.darkGray
        myLoginButton.frame = CGRect(x: 0, y: 0, width: 180, height: 40)
        myLoginButton.center = CGPoint(x: 160, y: 597);
        myLoginButton.setTitle("My Login Button", for: .normal)*/
        
        
        // Handle clicks on the button
        //myLoginButton.addTarget(self, action: #selector(self.loginButtonClicked), for: .touchUpInside)
        
        // Add the button to the view
       // view.addSubview(myLoginButton)
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        print("User Logged In")
        
        if ((error) != nil)
        {
            // Process error
        }
        else if result.isCancelled {
            // Handle cancellations
        }
        else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            if result.grantedPermissions.contains("email")
            {
                // Do work
            }
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("User Logged Out")
    }
    
    @objc func loginButtonClicked() {
        
        FacebookLogin.login.logIn(withReadPermissions: FacebookLogin.FACEBOOK_PERMISSIONS, from: self) { (result, error) -> Void in
            if let result = result, error == nil && !result.isCancelled {
                print("Logged in!")
                self.FacebookLogin.request.start(completionHandler: { (connection, result, error) in
                    if error == nil {
                        print("User Info : ",result!)
                        if let dictionary = result as? [String: AnyObject] {
                            
                            self.labelNombre.text = dictionary["name"] as? String
                            self.labelCorreo.text = dictionary["email"] as? String
                            self.FacebookLogin.id = dictionary["id"] as! String
                            self.profilePicture.image = UIImage(data: self.FacebookLogin.extractImage() as Data)
                        }
                        //self.imageFacebook
                    } else {
                        print("Error Getting Info: ", error!);
                    }
                })
                //print("success Get user information.")
            } else {
                //print("User cancelled login.")
            }
        }
        
        
        
            //self.labelCorreo.text = FacebookLogin.email
            //self.labelNombre.text = FacebookLogin.name
            //self.profilePicture.image = UIImage(data: FacebookLogin.pictureProfile as! Data)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}
/*
@IBDesignable
class GradientButton: UIButton {
    let gradientLayer = CAGradientLayer()
    
    @IBInspectable
    var topGradientColor: UIColor? {
        didSet {
            setGradient(topGradientColor: topGradientColor, middleGradientColor: middleGradientColor, bottomGradientColor: bottomGradientColor)
        }
    }
    
    @IBInspectable
    var middleGradientColor: UIColor? {
        didSet {
            setGradient(topGradientColor: topGradientColor, middleGradientColor: middleGradientColor, bottomGradientColor: bottomGradientColor)
        }
    }
    
    @IBInspectable
    var bottomGradientColor: UIColor? {
        didSet {
            setGradient(topGradientColor: topGradientColor, middleGradientColor: middleGradientColor, bottomGradientColor: bottomGradientColor)
        }
    }
    
    private func setGradient(topGradientColor: UIColor?, middleGradientColor: UIColor?, bottomGradientColor: UIColor?) {
        if let topGradientColor = topGradientColor, let bottomGradientColor = bottomGradientColor, let middleGradientColor = middleGradientColor{
            gradientLayer.frame = bounds
            gradientLayer.colors = [topGradientColor.cgColor, middleGradientColor.cgColor, bottomGradientColor.cgColor]
            gradientLayer.startPoint = CGPoint(x: 0, y: 1)
            gradientLayer.endPoint = CGPoint(x: 1, y: 0)
            gradientLayer.borderColor = layer.borderColor
            gradientLayer.borderWidth = layer.borderWidth
            gradientLayer.cornerRadius = layer.cornerRadius
            layer.insertSublayer(gradientLayer, at: 0)
        } else {
            gradientLayer.removeFromSuperlayer()
        }
    }
}
*/
