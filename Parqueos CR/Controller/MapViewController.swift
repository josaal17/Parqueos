//
//  MapViewController.swift
//  Parqueos CR
//
//  Created by MacBookDesarrolloTecno on 3/6/18.
//  Copyright © 2018 Technical-PC. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
import RealmSwift
import PopupDialog
import SVProgressHUD

class MapViewController: UIViewController,CLLocationManagerDelegate,MKMapViewDelegate {

    var mapcenter : CLLocationCoordinate2D?
    {
        didSet
        {
            //if(self.loadMarkers())
            //{
            //  println("mapcenter invoke")
            //}
            //else
            //{
            //     println("mapcenter not invoke")
            // }
        }
    }
    
    @IBOutlet weak var gmaps: MKMapView!
    
    var annotationLoaded : Bool = false
    var userLocation : CLLocation?
    let locationManager = CLLocationManager()
    
    let realm = try! Realm()
    // Query Realm for all dogs less than 2 years old
    
    override func viewDidLoad() {
        super.viewDidLoad()
        obtieneParqueos()
        gmaps.delegate = self
        gmaps.isZoomEnabled = true
        gmaps.showsUserLocation = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func obtieneParqueos() {
        SVProgressHUD.show()
        self.gmaps.removeAnnotations( self.gmaps.annotations)
        let parqueos = realm.objects(Parqueos.self)
        //print(parqueos)
        for parqueo in parqueos{
            /*blet annotation = MKPointAnnotation()
            print(parqueo.nombrePQ)
            annotation.coordinate = CLLocationCoordinate2D(latitude: parqueo.latitudPQ, longitude: parqueo.longitudPQ)
            annotation.title = parqueo.nombrePQ
            gmaps.addAnnotation(annotation)*/
            
            let anotacion = ParqueoAnotacionMap(title: parqueo.nombrePQ, disponibilidad: parqueo.horarioPQ, coordinate: CLLocationCoordinate2D(latitude: parqueo.latitudPQ, longitude: parqueo.longitudPQ), idParqueo:parqueo.idPQ)
            gmaps.addAnnotation(anotacion)
            
        }
        SVProgressHUD.dismiss()
    }
    
    func startListeningLocation()
    {
        locationManager.startUpdatingLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            startListeningLocation();
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first as CLLocation? {
            
            let latDelta:CLLocationDegrees = 0.08
            let longDelta:CLLocationDegrees = 0.08
            let regionRadius: CLLocationDistance = 1000
            let theSpan:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
            //let theRegion:MKCoordinateRegion = MKCoordinateRegionMake(CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude), theSpan)
            let theRegion:MKCoordinateRegion = MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude),regionRadius, regionRadius)
            self.gmaps.setRegion(theRegion, animated: true)
            userLocation = location
            locationManager.stopUpdatingLocation()
            
        }
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        self.showModal(view)
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        self.mapcenter = gmaps.region.center
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // 2
        guard let annotation = annotation as? ParqueoAnotacionMap else { return nil }
        // 3
        let identifier = "marker"
        var view: MKMarkerAnnotationView
        // 4
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            // 5
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            //view.canShowCallout = true
            //view.calloutOffset = CGPoint(x: -5, y: 5)
            //view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            let aSelector : Selector = #selector(MapViewController.showModal(_:))
            let tapGesture = UITapGestureRecognizer(target: self, action: aSelector)
            tapGesture.numberOfTapsRequired = 2
            view.addGestureRecognizer(tapGesture)
            let left = UIImageView(image: UIImage(named: "icon_marker")!)
            let right = UIButton(frame:   CGRect(x: 0, y: 0, width: 40, height: 38))
            
            //left.backgroundColor = Style.mainColor3
            left.contentMode = UIViewContentMode.scaleAspectFit
            left.frame =  CGRect(x: 0, y: 0, width: 50, height: 38)
            right.setImage( UIImage(named: "info"), for: UIControlState())
            right.imageView?.contentMode = UIViewContentMode.scaleAspectFit
            right.tag = 537
            
           // view.image = UIImage(named:"pin")
            view.canShowCallout = true
            view.leftCalloutAccessoryView = left
            view.rightCalloutAccessoryView = right
            
        }
        return view
    }
    
    /*func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if !(annotation is MKPointAnnotation) {
            return nil
        }
        
        let reuseId = "place"
        
        var anView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId)
        
        if anView == nil {
            let aSelector : Selector = #selector(MapViewController.showModal(_:))
            anView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            let tapGesture = UITapGestureRecognizer(target: self, action: aSelector)
            tapGesture.numberOfTapsRequired = 2
            anView?.addGestureRecognizer(tapGesture)
            let left = UIImageView(image: UIImage(named: "icon_marker")!)
            let right = UIButton(frame:   CGRect(x: 0, y: 0, width: 40, height: 38))
            
            //left.backgroundColor = Style.mainColor3
            left.contentMode = UIViewContentMode.scaleAspectFit
            left.frame =  CGRect(x: 0, y: 0, width: 50, height: 38)
            right.setImage( UIImage(named: "info"), for: UIControlState())
            right.imageView?.contentMode = UIViewContentMode.scaleAspectFit
            right.tag = 537
            
            anView?.image = UIImage(named:"icon_marker")
            anView?.canShowCallout = true
            anView?.leftCalloutAccessoryView = left
            anView?.rightCalloutAccessoryView = right
            
        }
        else {
            //we are re-using a view, update its annotation reference...
            anView?.annotation = annotation
        }
        
        return anView
    } */
    
    @IBAction func showModal(_ sender: AnyObject) {
        SVProgressHUD.show()
        var target : AnyObject = sender
        //self.animateTable(true)
        if let gesture = sender  as? UITapGestureRecognizer
        {
            target = gesture.view!
        }
        if let view = target as? MKAnnotationView
        {
            print(view.annotation?.title)
            self.gmaps.deselectAnnotation(view.annotation, animated: true)
            /*if let anotation = view.annotation as? PlaceMarker
            {
                //self.showBusyIndicator("Loading Data")
                BaseMapModal.getInfoView(self.selectedCategory,place: anotation.place,  userLocation: userLocation, success:
                    { (result, modalView) -> Void in
                        
                        if(result.isSuccess)
                        {
                            DispatchQueue.main.async {
                                //self.hideBusyIndicator()
                                self.present(modalView!, animated: true, completion: nil)
                            }
                        }
                        else
                        {
                            //self.hideBusyIndicator()
                            self.showAlert("Error Title", messageKey: result.message as String)
                        }
                }
                    , failure: { (error) -> Void in
                        //self.hideBusyIndicator()
                        self.showAlert("Error Title", messageKey: "Timeout Generic Exception Message")
                })
                
            }*/
            self.creaPopUp(parqueo: view.annotation?.title as! String)
            
            print("Entro aqui")
        }
        
    }
    
    func creaPopUp(parqueo: String){
        SVProgressHUD.dismiss()
        let startDate = NSDate()
        let date = startDate.addingTimeInterval(5.0 * 60.0)
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-mm-yyyy hh:mm:ss tt"
        let dateString = formatter.string(from: date as Date)
        
        
        let datos = datosParqueo()
        datos.nombre = parqueo
        datos.datosPQ()
        let title = datos.nombre
        let message = datos.direccion + "\n\n Horario:" + datos.horario + "\n\n Tarifa: " + datos.tarifa + "\n\n Teléfono: " + datos.telefono
        let image = UIImage(named: "pexels-photo-103290")
        
        // Create the dialog
        let popup = PopupDialog(title: title, message: message, image: image)
        // Create buttons
        // This button will not the dismiss the dialog
        let buttonOne = DefaultButton(title: "Reservar Espacio", dismissOnTap: false) {
            print("What a beauty!")
            SVProgressHUD.show()
            let guardaEspacio = creaReserva(paramParqueoReserva: datos.nombre, paramHoraReserva: dateString, paramEspacioReserva: "1", paramEstadoReserva: "Activa", paramPlacaReserva: "Placa")
            let result = guardaEspacio.guardaReserva()
            if(result){
                SVProgressHUD.dismiss()
                popup.dismiss(animated: true, completion: nil)
                self.showAlert(text: "Reserva creada correctamente. Tiene 5 minutos para llegar al parqueo antes de que expire la reserva.")
                print("success")
            }
            else
            {
                SVProgressHUD.dismiss()
                popup.dismiss(animated: true, completion: nil)
                self.showAlert(text: "Error creando la reserva.")
            }
        }
        
        let buttonTwo = DefaultButton(title: "Ir con Waze", height: 60) {
            self.abreWaze(latitude:datos.latitud,longitude:datos.longitud)
        }
        
        let buttonThree = CancelButton(title: "Cancelar") {
            print("You canceled the car dialog.")
        }
        
        // Add buttons to dialog
        // Alternatively, you can use popup.addButton(buttonOne)
        // to add a single button
        popup.addButtons([buttonOne, buttonTwo, buttonThree])
        
        // Present dialog
        self.present(popup, animated: true, completion: nil)
    }
    
    func abreWaze(latitude:Double,longitude:Double) {
        let hasWaze = UIApplication.shared.canOpenURL(URL( string:"waze://")!)
        let lat = latitude
        let lon = longitude
        var urlStr : String =  ""
        
        if (hasWaze){
            urlStr =  String(format: "waze://?ll=%f,%f&navigate=yes",lat,lon);
        }
        else
        {
            // Waze is not installed. Launch AppStore to install Waze app
            urlStr = "https://itunes.apple.com/app/waze-social-gps-maps-traffic/id323229106?l=en&mt=8"
            //            if let myLocation = userLocation
            //            {
            //                urlStr = String(format: "https://maps.google.com/maps?saddr=%f,%f&daddr=%f,%f&directionsmode=directionsmode", myLocation.coordinate.latitude, myLocation.coordinate.longitude, lat!,lon!);
            //            }
            //            else
            //            {
            //                urlStr = String(format: "https://maps.google.com/maps?daddr=%f,%f&directionsmode=directionsmode",  lat!,lon!);
            //            }
            
        }
        
        DispatchQueue.main.async {
            let url = URL(string: urlStr)
            UIApplication.shared.openURL(url!)
            
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

