//
//  ClassDetailViewController.swift
//  Todo
//
//  Created by AGA TOMOHIRO on 2020/05/07.
//  Copyright © 2020 AGA TOMOHIRO. All rights reserved.
//

import UIKit

class ClassDetailViewController: UIViewController {
    @IBOutlet weak var ClassLabel: UILabel!
    @IBOutlet weak var ClassDays: UILabel!
    
    var ClassName = ""
    var ClassNumber = 0
    var ClassDay = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        ClassLabel.text = ClassName
        ClassDays.text = Classdays()
        // Do any additional setup after loading the view.
    }
   
    func Classdays() -> String {
                 if  ClassNumber == 0{
                    ClassDay = "月曜日-1コマ"
            }else if ClassNumber == 1{
                    ClassDay = "火曜日-1コマ"
            }else if ClassNumber == 2{
                    ClassDay = "水曜日-1コマ"
            }else if ClassNumber == 3{
                    ClassDay = "木曜日-1コマ"
            }else if ClassNumber == 4{
                    ClassDay = "金曜日-1コマ"
            }else if ClassNumber == 5{
                    ClassDay = "月曜日-2コマ"
            }else if ClassNumber == 6{
                    ClassDay = "火曜日-2コマ"
            }else if ClassNumber == 7{
                    ClassDay = "水曜日-2コマ"
            }else if ClassNumber == 8{
                    ClassDay = "木曜日-2コマ"
            }else if ClassNumber == 9{
                    ClassDay = "金曜日-2コマ"
            }else if ClassNumber == 10{
                    ClassDay = "月曜日-3コマ"
            }else if ClassNumber == 11{
                    ClassDay = "火曜日-3コマ"
            }else if ClassNumber == 12{
                    ClassDay = "水曜日-3コマ"
            }else if ClassNumber == 13{
                    ClassDay = "木曜日-3コマ"
            }else if ClassNumber == 14{
                    ClassDay = "金曜日-3コマ"
            }else if ClassNumber == 15{
                    ClassDay = "月曜日-4コマ"
            }else if ClassNumber == 16{
                    ClassDay = "火曜日-4コマ"
            }else if ClassNumber == 17{
                    ClassDay = "水曜日-4コマ"
            }else if ClassNumber == 18{
                    ClassDay = "木曜日-4コマ"
            }else if ClassNumber == 19{
                    ClassDay = "金曜日-4コマ"
            }else if ClassNumber == 20{
                    ClassDay = "月曜日-5コマ"
            }else if ClassNumber == 21{
                    ClassDay = "火曜日-5コマ"
            }else if ClassNumber == 22{
                    ClassDay = "水曜日-5コマ"
            }else if ClassNumber == 23{
                    ClassDay = "木曜日-5コマ"
            }else if ClassNumber == 24{
                    ClassDay = "金曜日-5コマ"
        }
        return ClassDay
    }
}
