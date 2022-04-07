//
//  AppLabels.swift
//  My Andijan
//
//  Created by Nurillo Domlajonov on 23/03/22.
//
import UIKit

class AppLabels: UILabel{
    open override func layoutSubviews() {
        super.layoutSubviews()
    }
    init(text: String,textColor: UIColor,fontSize: CGFloat){
        super.init(frame: .zero)
        self.text = text
        self.textColor = textColor
        self.font = UIFont(name: "Times New Roman", size: fontSize)
        self.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

