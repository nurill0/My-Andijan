//
//  CurrencyCell.swift
//  My Andijan
//
//  Created by Nurillo Domlajonov on 27/03/22.
//

import UIKit

class CurrencyCell: UICollectionViewCell{
    
    let darkShadow  = CALayer()
    let lightShadow = CALayer()
    static let identifier = "currencyCell"
    let titleLabel = AppLabels(text: "AQSH Dollar: ", textColor: UIColor(named: "TextColors")!, fontSize: 22)
    let codeLabel = AppLabels(text: "AQSH Dollar: ", textColor: UIColor(named: "TextColors")!, fontSize: 20)
    let priceLabel = AppLabels(text: "AQSH Dollar: ", textColor: UIColor(named: "TextColors")!, fontSize: 20)
    let buyPriceLabel = AppLabels(text: "AQSH Dollar: ", textColor: .red, fontSize: 18)
    let cellPriceLabel = AppLabels(text: "AQSH Dollar: ", textColor: #colorLiteral(red: 0.3546295762, green: 0.6902691722, blue: 0.1273127198, alpha: 1), fontSize: 18)
    let dateLabel = AppLabels(text: "AQSH Dollar: ", textColor: UIColor(named: "TextColors")!, fontSize: 16)
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupContentView()
        setshadow()
        initViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: UI
extension CurrencyCell{
    func getItems(title: String,code: String,price:String,buyprice:String,cellprice:String,date:String){
        titleLabel.text = title
        codeLabel.text = code
        priceLabel.text = price
        buyPriceLabel.text = buyprice
        cellPriceLabel.text = cellprice
        dateLabel.text = date
    }
    private func initViews(){
        self.addSubview(titleLabel)
        self.addSubview(codeLabel)
        self.addSubview(priceLabel)
        self.addSubview(buyPriceLabel)
        self.addSubview(cellPriceLabel)
        self.addSubview(dateLabel)
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.textAlignment = .left
        codeLabel.textAlignment = .right
        priceLabel.textAlignment = .left
        buyPriceLabel.textAlignment = .left
        cellPriceLabel.textAlignment = .right
        dateLabel.textAlignment = .right
        titleLabel.font = .systemFont(ofSize: 22, weight: .heavy)
        dateLabel.font = .systemFont(ofSize: 17, weight: .thin)
        titleLabel.snp.makeConstraints { make in
            make.left.top.equalToSuperview().inset(5)
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalTo(40)
        }
        codeLabel.snp.makeConstraints { make in
            make.right.top.equalToSuperview().inset(5)
            make.width.equalToSuperview().multipliedBy(0.2)
            make.height.equalTo(40)
        }
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.right.left.equalToSuperview().inset(5)
            make.height.equalTo(40)
        }
        buyPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom)
            make.width.equalToSuperview().multipliedBy(0.5)
            make.left.equalToSuperview().inset(5)
        }
        cellPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom)
            make.width.equalToSuperview().multipliedBy(0.5)
            make.right.equalToSuperview().inset(5)
        }
        dateLabel.snp.makeConstraints { make in
            make.right.bottom.equalToSuperview().inset(5)
            make.height.equalTo(30)
            make.width.equalToSuperview().multipliedBy(0.9)
        }


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
}
