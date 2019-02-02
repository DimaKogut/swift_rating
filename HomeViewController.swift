//
//  HomeViewController.swift
//  CoaxTrip
//
//  Created by Dmytro Kogut on 2/2/19.
//  Copyright © 2019 Dmytro Kogut. All rights reserved.
//

import UIKit
import GoogleMaps

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("LOAD")
        
        /* Hide header block */
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        /* Hide back button */
        self.navigationItem.setHidesBackButton(true, animated:true);
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        super.loadView()
        
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        // Creates a marker in the center of the map.
        let labels = ["Taras": 1, "Dima": 2, "Olga": 3]
        for (animalName, legCount) in labels {
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: -33.86 + Double(legCount), longitude: 151.20)
            marker.title = animalName
            marker.snippet = "Australia"
            marker.map = mapView
        }

//        let marker1 = GMSMarker()
//        marker1.position = CLLocationCoordinate2D(latitude: -35.86, longitude: 151.20)
//        marker1.title = "Sydney"
//        marker1.snippet = "Australia"
//        marker1.map = mapView
        
        print("VIEW")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
