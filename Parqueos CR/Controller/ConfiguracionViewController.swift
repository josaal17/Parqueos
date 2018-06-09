//
//  ConfiguracionViewController.swift
//  Parqueos CR
//
//  Created by MacBookDesarrolloTecno on 7/6/18.
//  Copyright © 2018 Technical-PC. All rights reserved.
//

import UIKit

class ConfiguracionViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    var picker:UIImagePickerController?=UIImagePickerController()
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var labelNombre: UILabel!
    @IBOutlet weak var switchDatos: UISwitch!
    
    let datos = datosUsuario()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        datos.datosUser()
        labelNombre.text = datos.nombre
        let obtieneImagen = AdministradorImagenes()
        if(obtieneImagen.obtenerImagen(nombre: datos.nombre) != nil){
            profilePic.image = obtieneImagen.obtenerImagen(nombre: datos.nombre)
        }

        
        
        switchDatos.isOn = datos.recordarDatos
        
        let tapGesto = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        profilePic.addGestureRecognizer(tapGesto)
        profilePic.isUserInteractionEnabled = true
        picker?.delegate=self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnCerrarSesion(_ sender: UIButton) {
        self.showAlert(text: "Está seguro que desea cerrar la sesión?")
    }
    
    func showAlert(text:String) {
        let alertController = UIAlertController(title: "Parqueos CR", message: text, preferredStyle: .alert)
        let cancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: {(action) in
            
        })
        let aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: {(action) in
            print("cerraria la sesión")
            let cerrar = cerrarSesion()
            let result = cerrar.logout()
            if(result){
                self.dismiss(animated: true, completion: {});
                self.navigationController?.popViewController(animated: true);
            }
            else
            {
                
            }
            
            
        })
        alertController.addAction(cancelar)
        alertController.addAction(aceptar)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func imageTapped(gesture:UIGestureRecognizer) {
        if (gesture.view as? UIImageView) != nil {
            print("Image Tapped")
            showActionSheet()
        }
    }
    func camera()
    {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self
        myPickerController.sourceType = UIImagePickerControllerSourceType.camera
        
        self.present(myPickerController, animated: true, completion: nil)
        
    }
    
    func photoLibrary()
    {
        
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self
        myPickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        self.present(myPickerController, animated: true, completion: nil)
        
    }
    
    func showActionSheet() {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Cámara", style: UIAlertActionStyle.default, handler: { (alert:UIAlertAction!) -> Void in
            self.camera()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Galería", style: UIAlertActionStyle.default, handler: { (alert:UIAlertAction!) -> Void in
            self.photoLibrary()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancelar", style: UIAlertActionStyle.cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
        
    }
    
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        profilePic.contentMode = .scaleAspectFill
        profilePic.image = chosenImage
        let imageControl = AdministradorImagenes()
        imageControl.guardarImagen(image: chosenImage, nombre: datos.nombre)
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func changeValueDatos(_ sender: UISwitch) {
        print(sender.isOn)
        let consultaDatos = datosUsuario()
        consultaDatos.recordarDatos = sender.isOn
        consultaDatos.actualizaRecuerdaDatos()

    }
    
   
}
