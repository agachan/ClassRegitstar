//
//  ClassViewController.swift
//  Todo
//
//  Created by AGA TOMOHIRO on 2020/05/06.
//  Copyright © 2020 AGA TOMOHIRO. All rights reserved.
//

import UIKit
import RealmSwift

class ClassViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{

    @IBOutlet weak var ClassCollectionView: UICollectionView!
    
    var classNemes = ["","","","","",
                      "","","","","",
                      "","","","","",
                      "","","","","",
                      "","","","",""]
    @IBAction func toClassTableButton(_ sender: Any) {
        let alertController = UIAlertController(title: "授業を追加します", message: nil, preferredStyle: .alert)
               let newRegist:UIAlertAction = UIAlertAction(title: "保存されている授業から追加", style: .default) {(Void) in
                   self.performSegue(withIdentifier: "toClassTable", sender: nil)
               }
                let didRegist:UIAlertAction = UIAlertAction(title: "新規に登録し追加", style: .default) {(Void) in
                    self.performSegue(withIdentifier: "toRegist", sender: nil)
                }
               alertController.addAction(newRegist)
               alertController.addAction(didRegist)
               present(alertController, animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return classNemes.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ClassView", for: indexPath) as! ClassCollectionViewCell
        
        let realm = try! Realm()
        let classes = realm.objects(ClassList.self)
        let ClassNumbers = realm.objects(ClassList.self)
        
        for i in 0..<classes.count{
            let Class = classes[i].name
            let ClassNumber = ClassNumbers[i].number
        classNemes[ClassNumber] = Class

        cell.classLabel?.text = classNemes[indexPath.row]
        cell.classLabel?.text = classNemes[indexPath.row]
        }
        return cell
        
    }
    var giveClassName = ""
    var giveClassNumber = 25
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let realm = try! Realm()
        let classes = realm.objects(ClassList.self)
        let ClassNumbers = realm.objects(ClassList.self)
        
        for i in 0..<classes.count{
            let Class = classes[i].name
            let ClassNumber = ClassNumbers[i].number
            classNemes[ClassNumber] = Class
            giveClassName = classNemes[indexPath.row]
            giveClassNumber = indexPath.row
        }
        if classNemes[indexPath.row] == ""{
            performSegue(withIdentifier: "toRegist", sender: nil)
        }else{
           performSegue(withIdentifier: "toDetail", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetail"{
            let vc = segue.destination as! ClassDetailViewController
            vc.ClassName = giveClassName
            vc.ClassNumber = giveClassNumber
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
           let realm = try! Realm()
           _ = realm.objects(ClassList.self)
           ClassCollectionView.reloadData()
       }
    
}
