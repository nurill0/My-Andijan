//
//  AppTextFields.swift
//  My Andijan
//
//  Created by Nurillo Domlajonov on 23/03/22.
//

import Foundation
import UIKit
class AppTextFields: UITextField{
    open override func layoutSubviews() {
        super.layoutSubviews()
    }
    init(plaseHolder: String,textColor: UIColor,textSize: CGFloat){
        super.init(frame: .zero)
        self.placeholder = plaseHolder
        self.textColor = textColor
        self.font = .systemFont(ofSize: textSize, weight: .medium)
        self.leftViewMode = .always
        let view = UIView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
        self.leftView = view
        self.backgroundColor = .white
        self.layer.cornerRadius = 20
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
        self.returnKeyType = .done
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
