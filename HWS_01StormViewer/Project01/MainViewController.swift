//
// MainViewController.swift
// Project01
//


import UIKit

class MainViewController: UITableViewController {

    // MARK: - Properties
    
    var pictures = [String]()

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Storm Viewer"
        
        // path to files in folders in the app
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                // this is a picture to load
                pictures.append(item)
            }
        }
    }
    
    // MARK: - Table View Data Source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "picture", for: indexPath)
        var cellContent = cell.defaultContentConfiguration()
        cellContent.text = pictures[indexPath.row]
        cell.contentConfiguration = cellContent
        
        return cell
    }
    
    // navigation to DetailViewController
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1. try loading the "Detail" ViewController and typecasting it to be DetailViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            // 2. success, set its selectedImage property
            vc.selectedImage = pictures[indexPath.row]
            // 3. push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
