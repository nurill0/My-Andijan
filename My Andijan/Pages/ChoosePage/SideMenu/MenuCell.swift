//
//  MenuCell.swift
//  My Andijan
//
//  Created by Nurillo Domlajonov on 01/04/22.
//

import UIKit

class MenuCell: UICollectionViewCell{
    static let identifier = "cell"
    let titleImage = UIImageView()
    let titleLabel = AppLabels(text: "", textColor: UIColor(named: "TextColors")!, fontSize: 20)
    let bottomView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: UI
extension MenuCell{
    
    private func initViews(){
        self.addSubview(titleLabel)
        self.addSubview(titleImage)
        self.addSubview(bottomView)
        
        
        titleImage.contentMode = .scaleAspectFit
        titleImage.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(10)
            make.top.bottom.equalToSuperview().inset(12)
            make.width.equalToSuperview().multipliedBy(0.1)
        }
        bottomView.backgroundColor = UIColor(named: "TextColors")
        bottomView.snp.makeConstraints { make in
            make.bottom.right.equalToSuperview()
            make.height.equalTo(2)
            make.left.equalTo(titleImage.snp.right).offset(15)
        }
        titleLabel.font = .systemFont(ofSize: 20, weight: .light)
        titleLabel.textAlignment = .left
        titleLabel.snp.makeConstraints { make in
            make.right.top.equalToSuperview().inset(5)
            make.width.equalToSuperview().multipliedBy(0.75)
            make.bottom.equalTo(bottomView.snp.top).offset(-5)
        }
        
    }
    func getItems(title: String,image: String){
        titleImage.image = UIImage(named: image)?.withTintColor(UIColor(named: "TextColors")!)
        titleLabel.text = title
        
    }
}
