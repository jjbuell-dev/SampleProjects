//
//
// CoreLocationSample
// 
// MainViewController.swift
//
// Created by Royal Blue Software
// 


import UIKit
import CoreLocation

class MainViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var placeName: UILabel!
    @IBOutlet weak var locationDistance: UILabel!
    @IBOutlet weak var placeImage: UIImageView!
    
    // MARK: - Properties
    
    var placesViewController: PlaceScrollViewController?
    
    // create location manager
    var locationManager: CLLocationManager?
    var previousLocation: CLLocation?
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        if let childViewController = children.first as? PlaceScrollViewController {
            placesViewController = childViewController
        }
        
        loadPlaces()
        
        // location manager
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyHundredMeters
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Actions
    
    @IBAction func startLocationService(_ sender: UIButton) {
        if CLLocationManager.authorizationStatus() == .authorizedAlways || CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            activateLocationServices()
            
        } else {
            locationManager?.requestWhenInUseAuthorization()
        }
            
    }
    
    // MARK: - Helper Functions
    
    func selectPlace() {
        print("place selected")
    }
    
    private func activateLocationServices() {
        locationManager?.startUpdatingLocation()
    }
    
    func loadPlaces() {
        guard let entries = loadPlist() else { fatalError("Unable to load data") }
        
        for property in entries {
            guard let name = property["Name"] as? String,
                  let latitude = property["Latitude"] as? NSNumber,
                  let longitude = property["Longitude"] as? NSNumber,
                  let image = property["Image"] as? String else { fatalError("Error reading data") }
            
            print("name: \(name)")
            print("latitude: \(latitude)")
            print("longitude: \(longitude)")
            print("image: \(image)")
        }
    }
    
    private func loadPlist() -> [[String: Any]]? {
        guard let plistURL = Bundle.main.url(forResource: "Places", withExtension: "plist"),
              let plistData = try? Data(contentsOf: plistURL) else { return nil }
        
        var placedEntries: [[String: Any]]? = nil
        
        do {
            placedEntries = try PropertyListSerialization.propertyList(from: plistData, options: [], format: nil) as? [[String: Any]]
            
        } catch {
            print("error reading plist")
        }
        return placedEntries
    }
}

// MARK: - Extension

extension MainViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch manager.authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            activateLocationServices()
        
        case .restricted, .denied:
            print("location services not granted")
            
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
       
        @unknown default:
            print("location services error")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if previousLocation == nil {
            previousLocation = locations.first
            
        } else {
            guard let latestLocation = locations.first else { return }
            let distanceInMeters = previousLocation?.distance(from: latestLocation) ?? 0
            
            print("distance in meters: \(distanceInMeters)")
            previousLocation = latestLocation
        }
    }
}
