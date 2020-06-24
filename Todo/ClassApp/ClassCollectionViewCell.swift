//
//  ClassCollectionViewCell.swift
//  Todo
//
//  Created by AGA TOMOHIRO on 2020/05/06.
//  Copyright © 2020 AGA TOMOHIRO. All rights reserved.
//

import UIKit

class ClassCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var classLabel: UILabel!
    
  required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    override init(frame: CGRect) {
        super.init(frame:frame)
    }
}
