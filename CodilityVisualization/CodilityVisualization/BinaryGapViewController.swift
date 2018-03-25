//
//  ViewController.swift
//  CodilityVisualization
//
//  Created by 오민호 on 2018. 3. 24..
//  Copyright © 2018년 오민호. All rights reserved.
//

import UIKit
import SnapKit

class BinaryGapViewController: UIViewController {
    
    @IBOutlet weak var inputTextField : UITextField!
    @IBOutlet weak var binaryCollectionView : UICollectionView!
    @IBOutlet weak var currentCountLabel : UILabel!
    @IBOutlet weak var maxBinaryGapLabel : UILabel!
    
    private var binaryNumber : Int =  0 {
        didSet {
            self.binaryNumberString = String(binaryNumber, radix : 2)
            if self.binaryNumberString?.count ?? 0 == 1 && binaryNumber == 0 {
                self.binaryNumberString = ""
            }
        }
    }
    
    private var count : Int = 0 {
        didSet {
            self.currentCountLabel.text = "\(count)"
        }
    }
    
    private var answer : Int = 0 {
        didSet {
            self.maxBinaryGapLabel.text = "\(answer)"
        }
    }
    
    private var binaryNumberString : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func touchUpConvertBinaryButton(_ sender : UIButton) {
        guard let inputText = self.inputTextField.text else {return}
        self.binaryNumber = Int(inputText) ?? 0
        self.binaryCollectionView.reloadData()
        self.inputTextField.resignFirstResponder()
    }
    
    @IBAction private func touchUpExcuteAlgorithmButton(_ sender : UIButton) {
        let infos = BinaryGap.solution(self.binaryNumber)
        self.collectionViewAnimation(with: infos[self.binaryNumber]!)
    }
    
    func collectionViewAnimation(with infoList : [BinaryGap.AnimationInfo]) {
        guard let info = infoList.first else {return}
        guard let binaryNumberString = self.binaryNumberString else {return}
        guard binaryNumberString.count >= 1 else {return}
        
        self.binaryCollectionView.performBatchUpdates({
            self.binaryCollectionView.deleteItems(at: [IndexPath(item: binaryNumberString.count - 1, section : 0)])
            self.binaryNumber = info.num
            self.count = info.count
            self.answer = info.answer
        }) { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500), execute: {
                self.collectionViewAnimation(with: [BinaryGap.AnimationInfo](infoList.dropFirst()))
            })
        }
    }
    
}

extension BinaryGapViewController : UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.count = 0
        self.answer = 0
    }
}

extension BinaryGapViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.binaryNumberString?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let binaryCell = collectionView.dequeueReusableCell(withReuseIdentifier: BinaryCell.id, for: indexPath) as? BinaryCell else {
            return UICollectionViewCell()
        }
        guard let binaryNumberString = self.binaryNumberString else {return UICollectionViewCell()}
        
        let start = binaryNumberString.startIndex
        let idx = binaryNumberString.index(start, offsetBy: indexPath.item)
        
        let binaryChar = binaryNumberString[idx]
        binaryCell.binary = Int(String(binaryChar))
        return binaryCell
    }
    
}


