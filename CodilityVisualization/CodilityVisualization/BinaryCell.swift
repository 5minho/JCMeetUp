//
//  BinaryCell.swift
//  CodilityVisualization
//
//  Created by 오민호 on 2018. 3. 24..
//  Copyright © 2018년 오민호. All rights reserved.
//

import UIKit

class BinaryCell : UICollectionViewCell {
    static let id : String = "BinaryCell"
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.binaryLabel.text = nil
    }
    
    var binary : Int? {
        didSet {
            guard let binary = binary else {return}
            self.layer.borderWidth = 1
            self.layer.borderColor = UIColor.black.cgColor
            self.binaryLabel.text = "\(binary)"
            self.binaryLabel.backgroundColor = binary == 0 ? UIColor.red.withAlphaComponent(0.3) : .white
        }
    }
    
    @IBOutlet weak var binaryLabel : UILabel!

}
