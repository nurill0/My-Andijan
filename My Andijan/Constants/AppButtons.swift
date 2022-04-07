//
//  AppButtons.swift
//  My Andijan
//
//  Created by Nurillo Domlajonov on 23/03/22.
//

import UIKit

class AppButtons: UIButton{
    open override func layoutSubviews() {
        super.layoutSubviews()
    }
    init(title: String, fontSize: CGFloat, bgcColor: UIColor, titleColor: UIColor, radius: CGFloat,borderWidth: CGFloat,borderColor: CGColor){
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = .boldSystemFont(ofSize: fontSize)
        self.backgroundColor = bgcColor
        self.setTitleColor(titleColor, for: .normal)
        self.layer.cornerRadius = radius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor
        self.titleLabel?.textAlignment = .left
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
