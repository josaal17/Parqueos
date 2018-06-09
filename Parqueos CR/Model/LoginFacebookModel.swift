//
//  LoginFacebookModel.swift
//  Parqueos CR
//
//  Created by MacBookDesarrolloTecno on 14/5/18.
//  Copyright © 2018 Technical-PC. All rights reserved.
//

import Foundation
import FBSDKCoreKit
import FBSDKLoginKit

class LoginFacebookModel {
    var email: String = ""
    var name: String = ""
    var first_name:String = ""
    var last_name:String = ""
    var id:String = ""
    var gender:String = ""
    var pictureProfile:NSData? = nil
    var error:String = ""
    var viewController:UIViewController? = nil
    
    let FBloginButton : FBSDKLoginButton = FBSDKLoginButton()
    let FBAccessToken = FBSDKAccessToken.current()
    let FBDelegate: FBSDKLoginButtonDelegate? = nil
    let FBButton : FBSDKLoginButton! = nil
    let LoginResult:FBSDKLoginManagerLoginResult! = nil
    
    
    let FACEBOOK_PERMISSIONS:Array = ["public_profile", "user_friends", "email", "user_gender", "user_location", "user_hometown"]
    let FACEBOOK_PARAMETERS_RESPONSE:[AnyHashable : Any] = ["fields":"id,name_format,name,email,first_name,last_name,gender,location,hometown,picture,friends"]
    
    let login: FBSDKLoginManager = FBSDKLoginManager()
    let request: FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"id,name_format,name,email,first_name,last_name,gender,location,hometown,picture,friends"])
    
    init() {

    }
    
    
    func extractImage() -> NSData {
        let urlString = String(format: "https://graph.facebook.com/%@/picture?type=large", self.id)
        let imageUrl:URL = URL(string: urlString)!
        let imageData:NSData = NSData(contentsOf: imageUrl)!
        return imageData
    }
    
}
