//
//  ClassTableViewController.swift
//  Todo
//
//  Created by AGA TOMOHIRO on 2020/05/06.
//  Copyright © 2020 AGA TOMOHIRO. All rights reserved.
//

import UIKit
import RealmSwift

class ClassTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    
    
    @IBOutlet weak var ClassTableView: UITableView!
    
    
    @IBAction func toClassRegistButton(_ sender: Any) {
        self.performSegue(withIdentifier: "toClassRegist", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        // Do any additional setup after loading the view.
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let realm = try! Realm()
        let classes = realm.objects(ClassList.self)
        
        return classes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClassCell", for: indexPath)
        let realm = try! Realm()
        let classes = realm.objects(ClassList.self)
        
        let Class = classes[indexPath.row]
        cell.textLabel?.text = Class.name
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let realm = try! Realm()
        _ = realm.objects(ClassList.self)
        ClassTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let realm = try! Realm()
            let classes = realm.objects(ClassList.self)
            let Class = classes[indexPath.row]
            
            try! realm.write {
            realm.delete(Class)
            }
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let realm = try! Realm()
        let classes = realm.objects(ClassList.self)
        
        if segue.identifier == "toClassCollection"{
            let next = segue.destination as! ClassViewController
            _ = sender as! String
            let selectedIndexPath = ClassTableView.indexPathForSelectedRow!
            
        }
    }
    
    
}
