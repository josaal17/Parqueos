//
//  RegisterViewController.swift
//  Parqueos CR
//
//  Created by MacBookDesarrolloTecno on 4/6/18.
//  Copyright © 2018 Technical-PC. All rights reserved.
//

import UIKit
import IHKeyboardAvoiding

class RegisterViewController: UIViewController, UITextFieldDelegate {
    

    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtCorreo: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtRepetirPassword: UITextField!
    @IBOutlet weak var txtUbicacion: UITextField!
    
    @IBOutlet weak var contenedorView1: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        KeyboardAvoiding.avoidingView = self.contenedorView1
        // Do any additional setup after loading the view.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
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
        self.navigationController?.navigationBar.tintColor = UIColor.black
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.title = "Register"
    }
    
    @IBAction func btnRegistrarse(_ sender: UIButton) {
        if(validateForm()){
            let newUsuario = creaUsuario(paramNombre: txtNombre.text!, paramTelefono: "", paramCorreo: txtCorreo.text!, paramPassword: txtPassword.text!, paramUbicacion: txtUbicacion.text!, paramEstado: false)
            let result = newUsuario.guardaUsuario()
            if(result == 1){
                print("success")
                //Retrocede a Login
                self.showAlertSuccess(text: "Usted se ha registrado con Éxito.")
            }else{
                print("error")
                self.showAlert(text: "El usuario con este correo: \( txtCorreo.text! ), ya exíste.")
                _ = navigationController?.popViewController(animated: true)
            }
        }
    }
    
    func isSamePassword(password1: String, password2:String) -> Bool {
        if(txtPassword.text == txtRepetirPassword.text)
        {
            return true
        }
        else
        {
            self.showAlert(text: "Las contraseñas no son iguales.")
            return false
        }
    }
    
    func validateForm() -> Bool {
        if((txtNombre.text?.isEmpty)! || (txtCorreo.text?.isEmpty)! || (txtPassword.text?.isEmpty)! || (txtRepetirPassword.text?.isEmpty)! || (txtUbicacion.text?.isEmpty)!){
            self.showAlert(text: "No puede quedar ningún espacio en blanco.")
            return false
        }
        else
        {
            if(isSamePassword(password1: txtPassword.text!, password2: txtRepetirPassword.text!)){
                return true
            }
            else
            {
                return false
            }
        }
    }
    
    func showAlert(text:String) {
        let alertController = UIAlertController(title: "Error", message: text, preferredStyle: .alert)
        let cancelar = UIAlertAction(title: "Cancelar", style: .default, handler: {(action) in
            
        })
        alertController.addAction(cancelar)
        self.present(alertController, animated: true, completion: nil)
    }
    
    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == self.txtNombre {
            KeyboardAvoiding.avoidingView = self.contenedorView1
        }
        else if textField == self.txtCorreo {
            KeyboardAvoiding.avoidingView = self.contenedorView1
        }
        else if textField == self.txtPassword {
            KeyboardAvoiding.avoidingView = self.contenedorView1
        }
        else if textField == self.txtRepetirPassword {
            KeyboardAvoiding.avoidingView = self.contenedorView1
        }
        else if textField == self.txtUbicacion {
            KeyboardAvoiding.avoidingView = self.contenedorView1
        }
        return true
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.txtNombre {
            self.txtCorreo.becomeFirstResponder()
        }
        else if textField == self.txtCorreo {
            self.txtPassword.becomeFirstResponder()
        }
        else if textField == self.txtPassword {
            txtRepetirPassword.resignFirstResponder()
        }
        else if textField == self.txtRepetirPassword {
            txtUbicacion.resignFirstResponder()
        }

        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        
    }
    
    func showAlertSuccess(text:String) {
        let alertController = UIAlertController(title: "Parqueos CR", message: text, preferredStyle: .alert)
        let cancelar = UIAlertAction(title: "Aceptar", style: .default, handler: {(action) in
            _ = self.navigationController?.popViewController(animated: true)
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

}
