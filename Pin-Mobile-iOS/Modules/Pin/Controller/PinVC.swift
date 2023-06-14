//
//  PinVC.swift
//  KKExchange
//
//  Created by Chhan Sophearith on 24/5/23.

import UIKit
import AVFoundation

class PinVC: UIViewController {

    @IBOutlet weak var incorrectLbl: UILabel!
    @IBOutlet weak var pinTtlLbl: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var firstPinView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var secondPinView: UIView!
    @IBOutlet weak var fourPinView: UIView!
    @IBOutlet weak var fourView: UIView!
    @IBOutlet weak var thirdPinView: UIView!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    let model = PinModel()
    var pins: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    func setupView() {
        let cornerRadius = firstPinView.frame.width / 2
        firstView.layer.cornerRadius = 3
        firstView.layer.borderColor = UIColor.white.cgColor
        firstView.layer.borderWidth = 1
        firstView.backgroundColor = view.backgroundColor
        firstPinView.layer.cornerRadius = cornerRadius
        firstPinView.backgroundColor = .clear
        
        secondView.layer.cornerRadius = 3
        secondView.layer.borderColor = UIColor.white.cgColor
        secondView.layer.borderWidth = 1
        secondView.backgroundColor = view.backgroundColor
        secondPinView.layer.cornerRadius = cornerRadius
        secondPinView.backgroundColor = .clear
        
        thirdView.layer.cornerRadius = 3
        thirdView.layer.borderColor = UIColor.white.cgColor
        thirdView.layer.borderWidth = 1
        thirdView.backgroundColor = view.backgroundColor
        thirdPinView.layer.cornerRadius = cornerRadius
        thirdPinView.backgroundColor = .clear
        
        fourView.layer.cornerRadius = 3
        fourView.layer.borderColor = UIColor.white.cgColor
        fourView.layer.borderWidth = 1
        fourView.backgroundColor = view.backgroundColor
        fourPinView.layer.cornerRadius = cornerRadius
        fourPinView.backgroundColor = .clear
        incorrectLbl.text = ""
        self.pinTtlLbl.text = "Enter PIN to confirm"
    }
    
    @IBAction func tapDismissAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @objc func handleTapPin(_ sender: UIButton) {
        if self.pins.count < 1 {
            self.firstPinView.backgroundColor = .clear
            self.secondPinView.backgroundColor = .clear
            self.thirdPinView.backgroundColor = .clear
            self.fourPinView.backgroundColor = .clear
        }
        let title = self.model.titles[sender.tag]
        if title == "C" {
            self.pins = []
        } else if title == "X" {
            if self.pins.isEmpty == false {
                self.pins.removeLast()
            }
        } else {
            if self.pins.count < 4 {
                self.pins.append(title)
            }
        }
        self.incorrectLbl.text = ""
        switch self.pins.count {
        case 1:
            self.firstPinView.backgroundColor = .white
            self.secondPinView.backgroundColor = .clear
            self.thirdPinView.backgroundColor = .clear
            self.fourPinView.backgroundColor = .clear
        case 2:
            self.firstPinView.backgroundColor = .white
            self.secondPinView.backgroundColor = .white
            self.thirdPinView.backgroundColor = .clear
            self.fourPinView.backgroundColor = .clear
        case 3:
            self.firstPinView.backgroundColor = .white
            self.secondPinView.backgroundColor = .white
            self.thirdPinView.backgroundColor = .white
            self.fourPinView.backgroundColor = .clear
        case 4:
            self.firstPinView.backgroundColor = .red
            self.secondPinView.backgroundColor = .red
            self.thirdPinView.backgroundColor = .red
            self.fourPinView.backgroundColor = .red
               
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    self.stackView.shake()
                }
                
                self.incorrectLbl.text = "Incorrect PIN ( 2 attempts left)"
        default:
            self.firstPinView.backgroundColor = .clear
            self.secondPinView.backgroundColor = .clear
            self.thirdPinView.backgroundColor = .clear
            self.fourPinView.backgroundColor = .clear
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension PinVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PinCollectionCell", for: indexPath) as? PinCollectionCell {
            let title = self.model.titles[indexPath.row]
            cell.titleButton.setTitle(title, for: .normal)
            cell.titleButton.tag = indexPath.row
            cell.titleButton.addTarget(self, action: #selector(handleTapPin), for: .touchUpInside)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width - 28.6) / 3
        return CGSize(width: width, height: width - 28)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
