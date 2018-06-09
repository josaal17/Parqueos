//
//  ListaPlacasViewController.swift
//  Parqueos CR
//
//  Created by MacBookDesarrolloTecno on 5/6/18.
//  Copyright © 2018 Technical-PC. All rights reserved.
//

import UIKit

class ListaPlacasViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var placas:listaVehiculos!

    @IBOutlet weak var placasTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        self.placasTableView.addSubview(self.refreshControl)
        placasTableView.tableFooterView = UIView(frame: .zero)
        //self.setNavigationBar()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*func setNavigationBar() {
        let screenSize: CGRect = UIScreen.main.bounds
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: 44))
        let navItem = UINavigationItem(title: "")
        let doneItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: nil, action: #selector(done))
        navItem.rightBarButtonItem = doneItem
        navBar.setItems([navItem], animated: false)
        self.view.addSubview(navBar)
    }
    
    @objc func done() { // remove @objc for Swift 3
        
    }*/
    
    func loadData(){
        placas = listaVehiculos()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if placas.ListaVehiculos.count > 0 {
            self.placasTableView.restore()
        } else {
            self.placasTableView.setEmptyMessage("No tienes ninguna Placa creada, agrega una nueva.")
        }
        return placas.ListaVehiculos.count
        //return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "miCelda", for: indexPath) as! PlacasTableViewCell
        cell.labelTitulo.text = placas.ListaVehiculos[indexPath.row].placaCarro
        cell.labelSubtitulo.text = placas.ListaVehiculos[indexPath.row].marcaCarro
        print("Titulo: ",placas.ListaVehiculos[indexPath.row].placaCarro)
        print("SubTitulo: ",placas.ListaVehiculos[indexPath.row].marcaCarro)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    
    @IBAction func btnAddPlaca(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Agregar Placa", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Número de Placa"
        })
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Marca Vahículo"
        })
        
        alert.addAction(UIAlertAction(title: "Insertar", style: .default, handler: { action in
            
            let guardaPlaca = guardaVehiculo(paramPlaca: alert.textFields![0].text!, paramMarca: alert.textFields![1].text!)
            let result = guardaPlaca.guardaPlaca()
            if(result == 1){
                print("success")
                self.loadData()
                self.placasTableView.reloadData()
            }else{
                print("error")
            }
 
        }))
        
        self.present(alert, animated: true)
        
    }
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(self.handleRefresh(_:)),
                                 for: UIControlEvents.valueChanged)
        refreshControl.tintColor = UIColor.red
        
        return refreshControl
    }()
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {

        self.loadData()
        self.placasTableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            // handle delete (by removing the data from your array and updating the tableview)
            let consulta = borraVehiculo(paramPlaca: placas.ListaVehiculos[indexPath.row].placaCarro)
            if(consulta.borraPlaca())
            {
                self.loadData()
                self.placasTableView.reloadData()
            }
            else
            {
                self.showAlert(text: "Surgió un problema borrando la placa. Intente nuevamente.")
            }
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

}

extension UITableView {
    
    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height))
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = .center;
        messageLabel.font = UIFont(name: "TrebuchetMS", size: 15)
        messageLabel.sizeToFit()
        
        self.backgroundView = messageLabel;
        self.separatorStyle = .none;
    }
    
    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
}
