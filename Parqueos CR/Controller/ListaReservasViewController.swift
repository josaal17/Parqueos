//
//  ListaReservasViewController.swift
//  Parqueos CR
//
//  Created by MacBookDesarrolloTecno on 6/6/18.
//  Copyright © 2018 Technical-PC. All rights reserved.
//

import UIKit

class ListaReservasViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var reservas:listaReservas!
    
    
    @IBOutlet weak var reservasTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadData()
        self.reservasTableView.addSubview(self.refreshControl)
        reservasTableView.tableFooterView = UIView(frame: .zero)
        // Do any additional setup after loading the view.
    }
    
    func loadData(){
        reservas = listaReservas()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if reservas.ListaReservas.count > 0 {
            self.reservasTableView.restoreReserva()
        } else {
            self.reservasTableView.setEmptyMessageReserva("No tienes ninguna Reserva creada, dirígete al mapa para hacer una nueva reserva.")
        }
        
        return reservas.ListaReservas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "miReserva", for: indexPath) as! ReservasTableViewCell
        cell.labelTitleReserva.text = reservas.ListaReservas[indexPath.row].parqueoReserva
        cell.labelSubtitleReserva.text = reservas.ListaReservas[indexPath.row].horaReserva

        print("Titulo: ",reservas.ListaReservas[indexPath.row].parqueoReserva)
        print("SubTitulo: ",reservas.ListaReservas[indexPath.row].horaReserva)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
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
        self.reservasTableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            // handle delete (by removing the data from your array and updating the tableview)
            let consulta = borraReserva(paramReserva: reservas.ListaReservas[indexPath.row].idReserva)
            if(consulta.borraReservacion())
            {
                self.loadData()
                self.reservasTableView.reloadData()
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
    
    func setEmptyMessageReserva(_ message: String) {
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
    
    func restoreReserva() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
}
