//
//  LoginViewController.swift
//  Parqueos CR
//
//  Created by MacBookDesarrolloTecno on 29/5/18.
//  Copyright © 2018 Technical-PC. All rights reserved.
//

import UIKit
import IHKeyboardAvoiding

class LoginViewController: UIViewController, UITextFieldDelegate {

    let llenaparqueos = llenaTableParqueos()
    
    @IBOutlet weak var txtCorreo: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var contenedorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        KeyboardAvoiding.avoidingView = self.contenedorView
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        llenaparqueos.guardaParqueos()
        
        let recuerdaDatos = datosUsuario()
        let result = recuerdaDatos.recuerdaDatos()
        if (result) {
            txtCorreo.text = recuerdaDatos.cargaDatos()
        }
        // Do any additional setup after loading the view.
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
       /* let img = UIImage()
        self.navigationController?.navigationBar.shadowImage = img
        self.navigationController?.navigationBar.setBackgroundImage(img, for: UIBarMetrics.default)*/
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let img = UIImage()
        self.navigationController?.navigationBar.shadowImage = img
        self.navigationController?.navigationBar.setBackgroundImage(img, for: UIBarMetrics.default)
        self.title = ""
        
        let session = preguntaSession()
        if(session.estadoUsuario()){
            if let tabbar = (storyboard?.instantiateViewController(withIdentifier: "tabBarMainViewController") as? UITabBarController) {
                self.present(tabbar, animated: true, completion: nil)
            }
            //let mainViewController = storyboard?.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
            //self.present(mainViewController!, animated: true, completion: nil)
        }
        else
        {
            print("No esta Logueado")
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.title = "Login"
        txtCorreo.text = ""
        txtPassword.text = ""
    }
    
    
    @IBAction func btnLogin(_ sender: UIButton) {
        let Login = LoginUsuario(paramCorreo: txtCorreo.text!, paramPassword: txtPassword.text!)
        let existeUsuario = Login.existeUsuario()
        if(existeUsuario)
        {
            let result = Login.loginUsuario()
            if (result) {
                if let tabbar = (storyboard?.instantiateViewController(withIdentifier: "tabBarMainViewController") as? UITabBarController) {
                    self.present(tabbar, animated: true, completion: nil)
                }
                //let mainViewController = storyboard?.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
                //self.present(mainViewController, animated: true, completion: nil)
            }
            else
            {
                self.showAlert(text: "Sus datos no concuerdan, verifique de nuevo.")
            }
        }
        else
        {
            self.showAlert(text: "Su correo no se encuentra registrado, por favor registrese para luego ingresar a la aplicación.")
        }
    }
    
    func showAlert(text:String) {
        let alertController = UIAlertController(title: "Parqueos CR", message: text, preferredStyle: .alert)
        let cancelar = UIAlertAction(title: "Aceptar", style: .default, handler: {(action) in
            
        })
        alertController.addAction(cancelar)
        self.present(alertController, animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == self.txtCorreo {
            KeyboardAvoiding.avoidingView = self.contenedorView
        }
        else if textField == self.txtPassword {
            KeyboardAvoiding.avoidingView = self.contenedorView
        }
        return true
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.txtCorreo {
            self.txtPassword.becomeFirstResponder()
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        
    }
    
    

}
