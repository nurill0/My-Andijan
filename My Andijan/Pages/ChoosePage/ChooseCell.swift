//
//  ChooseCell.swift
//  My Andijan
//
//  Created by Nurillo Domlajonov on 26/03/22.
//

import UIKit

class ChooseCell: UICollectionViewCell{
    
    static let identifier = "cell"
    let objectImageView = UIImageView()
    let titleLabel = AppLabels(text: "", textColor: UIColor(named: "TextColors")!, fontSize: 22)
    let darkShadow = CALayer()
    let lightShadow = CALayer()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
        setupContentView()
        setshadow()
        self.backgroundColor = UIColor(named: "CellBack")

    }
    private func initViews(){
        self.addSubview(objectImageView)
        self.addSubview(titleLabel)

        objectImageView.image = UIImage(named: "1")
        objectImageView.contentMode = .scaleAspectFit
        objectImageView.snp.makeConstraints { make in
            make.right.left.top.equalToSuperview().inset(15)
            make.height.equalToSuperview().multipliedBy(0.55)
        }
        titleLabel.numberOfLines = 0
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(objectImageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.right.left.equalToSuperview().inset(10)
            make.height.equalToSuperview().multipliedBy(0.3)
        }
        titleLabel.adjustsFontSizeToFitWidth = true
    }
    
    
    func setupContentView() {
        self.backgroundColor = UIColor(named: "CellBack")
        self.frame = self.bounds
        self.layer.cornerRadius = 15
        self.self.layer.cornerRadius = 15
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    func setshadow() {
        darkShadow.frame = self.bounds
        darkShadow.cornerRadius = 15
        darkShadow.backgroundColor =  UIColor(named: "CellBack")?.cgColor
        darkShadow.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        darkShadow.shadowOffset = CGSize(width: 10, height: 10)
        darkShadow.shadowOpacity = 1
        darkShadow.shadowRadius = 15
        self.layer.insertSublayer(darkShadow, at: 0)
        lightShadow.frame = self.bounds
        lightShadow.cornerRadius = 15
        lightShadow.backgroundColor =  UIColor(named: "CellBack")?.cgColor
        lightShadow.shadowColor = UIColor(named: "CellBack")?.withAlphaComponent(0.9).cgColor
        lightShadow.shadowOffset = CGSize(width: -5, height: -5)
        lightShadow.shadowOpacity = 1
        lightShadow.shadowRadius = 15
        self.layer.insertSublayer(lightShadow, at: 0)
    }
    func getImageAndTitle(title: String,name: String){
        self.titleLabel.text = title
        self.objectImageView.image = UIImage(named: name)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension UIColor {
    static let offWhite = UIColor.init(red: 225/255, green: 225/255, blue: 235/255, alpha: 1)
}
