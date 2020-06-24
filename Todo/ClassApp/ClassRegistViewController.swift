//
//  ClassRegistViewController.swift
//  Todo
//
//  Created by AGA TOMOHIRO on 2020/05/05.
//  Copyright © 2020 AGA TOMOHIRO. All rights reserved.
//

import UIKit
import RealmSwift

class ClassRegistViewController: UIViewController,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource{

    override func viewDidLoad() {
        super.viewDidLoad()
        className.delegate = self
        classNumber.delegate = self
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/225, green: 217/225, blue: 100/225, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.donePressed))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(cancelPressed))
        
        toolBar.setItems([cancelButton,spaceButton,doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        classDayField.inputView = classNumber
        classDayField.inputAccessoryView = toolBar
        
        // Do any additional setup after loading the view.
    }
  
    @IBOutlet weak var className: UITextField!
    
    //    PickerViewについてまとめる
    let classNumber = UIPickerView()

    @IBOutlet weak var classDayField: UITextField!
    
    //    Picker内のコンテンツの決定
        let Day:[String] = ["月","火","水","木","金"]
        let Number:[String] = ["1","2","3","4","5"]
    //    セクション数の設定（縦切り）
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 2
        }
    //    コンテンツの数の設定
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            if component == 0 {
                 return Number.count
            }else{
                return Day.count
            }
        }
    //  コンテンツの数の設定
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            switch component {
            case 0:
                return Day[row]+"曜日"
            case 1:
                 return Number[row]+"コマ"
            default:
                 return "月曜日-1コマ"
            }
        }
       
        var DayText = ""
        var NumberText = ""
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            switch component {
            case 0:
                    DayText = Day[row]
            case 1:
                    NumberText = Number[row]
            default:
                classDayField.text = "月曜日-1コマ"
            }
            classDayField.text = DayText+"曜日-" + NumberText+"コマ"
        }
    
    @objc func donePressed() {
           view.endEditing(true)
       }
       @objc func cancelPressed() {
           classDayField.text = ""
           view.endEditing(true)
       }
       
       func textFieldShouldReturn(_ textField: UITextField) -> Bool {
              self.view.endEditing(true)
              return true
          }
    
    @IBAction func backButton(_ sender: Any) {
        let saveClassName = className.text!
        
        if saveClassName != "" && ClassNumber() != 25{
            
            let ClassName = ClassList()
            ClassName.name = saveClassName
            ClassName.number = ClassNumber()
            
            let realm = try! Realm()
            try! realm.write {
                realm.add(ClassName)
            }
            
            let classesName = realm.objects(ClassList.self)
            print(classesName.count)
            
                       self.navigationController?.popViewController(animated: true)
                           }else{
                               showAlert(title: "No Text")
        }
    }
    //    もし授業名が空文字の時にアラートが出るようにする設定
        func showAlert(title:String){
               let alert = UIAlertController(title:title,message: nil,preferredStyle: .alert)
               alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
               alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
               self.present(alert,animated: true,completion: nil)
           }
        
        
        
    //    曜日コマ数から授業がどのセルに入るのかを決めるために番号を振り分ける
        var ClassNumbers = 25
        func ClassNumber() -> Int {
                  if classDayField.text == "月曜日-1コマ" {
                ClassNumbers = 0
            }else if classDayField.text == "火曜日-1コマ"{
                ClassNumbers = 1
            }else if classDayField.text == "水曜日-1コマ"{
                ClassNumbers = 2
            }else if classDayField.text == "木曜日-1コマ"{
                ClassNumbers = 3
            }else if classDayField.text == "金曜日-1コマ"{
                ClassNumbers = 4
            }else if classDayField.text == "月曜日-2コマ"{
                ClassNumbers = 5
            }else if classDayField.text == "火曜日-2コマ"{
                ClassNumbers = 6
            }else if classDayField.text == "水曜日-2コマ"{
                ClassNumbers = 7
            }else if classDayField.text == "木曜日-2コマ"{
                ClassNumbers = 8
            }else if classDayField.text == "金曜日-2コマ"{
                ClassNumbers = 9
            }else if classDayField.text == "月曜日-3コマ"{
                ClassNumbers = 10
            }else if classDayField.text == "火曜日-3コマ"{
                ClassNumbers = 11
            }else if classDayField.text == "水曜日-3コマ"{
                ClassNumbers = 12
            }else if classDayField.text == "木曜日-3コマ"{
                ClassNumbers = 13
            }else if classDayField.text == "金曜日-3コマ"{
                ClassNumbers = 14
            }else if classDayField.text == "月曜日-4コマ"{
                ClassNumbers = 15
            }else if classDayField.text == "火曜日-4コマ"{
                ClassNumbers = 16
            }else if classDayField.text == "水曜日-4コマ"{
                ClassNumbers = 17
            }else if classDayField.text == "木曜日-4コマ"{
                ClassNumbers = 18
            }else if classDayField.text == "金曜日-4コマ"{
                ClassNumbers = 19
            }else if classDayField.text == "月曜日-5コマ"{
                ClassNumbers = 20
            }else if classDayField.text == "火曜日-5コマ"{
                ClassNumbers = 21
            }else if classDayField.text == "水曜日-5コマ"{
                ClassNumbers = 22
            }else if classDayField.text == "木曜日-5コマ"{
                ClassNumbers = 23
            }else if classDayField.text == "金曜日-5コマ"{
                ClassNumbers = 24
            }
           return ClassNumbers
        }

}
