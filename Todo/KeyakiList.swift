//
//  KeyakiList.swift
//  Todo
//
//  Created by AGA TOMOHIRO on 2020/05/05.
//  Copyright © 2020 AGA TOMOHIRO. All rights reserved.
//
//    ["石森虹花","上村莉奈","尾関梨香","小池美波","小林由依","斎藤冬優花","佐藤詩織","菅井友香","長沢菜々香","土生瑞穂","原田葵","守屋茜","渡辺梨加","渡辺理佐"]
import UIKit
import RealmSwift

class KeyakiList: Object {
    @objc dynamic var name = ""
    @objc dynamic var birthday = ""
}


// Get the default Realm
let realm = try! Realm()
let Member1 = KeyakiList()
Member1.name = "石森虹花"
Member1.birthday = "1997/5/7"

try! realm.write {
    realm.add(Member1)
}
