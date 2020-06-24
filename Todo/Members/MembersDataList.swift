//
//  MembersDataList.swift
//  Todo
//
//  Created by AGA TOMOHIRO on 2020/05/08.
//  Copyright © 2020 AGA TOMOHIRO. All rights reserved.
//

import UIKit
import RealmSwift

class Group: Object {
    @objc dynamic var GroupId = 0
    @objc dynamic var GroupName = ""
    
    let Members = List<Members>

        override static func primaryKey()  -> String {
            return "groupId"
    }

        override static func indexedProperties() -> [String]{
            return ["GroupName"]
    }
}

class Members: Object {
    @objc dynamic var name = ""
    @objc dynamic var birthplace = ""
    @objc dynamic var blogurl = ""
    @objc dynamic var birthday = 0
}




let keyaki1 = Members()
keyaki1.name = "石森虹花"
keyaki1.blogurl"https://www.keyakizaka46.com/s/k46o/diary/member/list?ima=0000&ct=01",
keyaki1.birthday = 19970507
keyaki1.birthplace = "宮城県"

let members = List<Members>()
members.append(keyaki1)

let keyakizaka46 = Group()
keyakizaka46.GroupId = 2
keyakizaka46.GroupName = "欅坂46"
Group.Members.append(objectsIn:members)

let realm = try! Realm()
try! realm.write{
    realm.add(Group)
}


