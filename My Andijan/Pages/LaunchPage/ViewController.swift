//
//  ViewController.swift
//  My Andijan
//
//  Created by Nurillo Domlajonov on 22/03/22.
//

import UIKit
import SnapKit
import LTMorphingLabel

class ViewController: UIViewController, LTMorphingLabelDelegate {
    
    let imageView =     UIImageView()
    var timer     :            Timer!
    let nameLabel = LTMorphingLabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.007843137719, green: 0.007843137719, blue: 0.007843137719, alpha: 1)
        initViews()
        initTimer()
    }
    
    
    func initTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(goWelcomeContoller), userInfo: nil, repeats: true)
    }
    
    
    @objc func goWelcomeContoller(){
//        let rootvc = ViewController()
        let vc = ChooseController()
        vc.modalPresentationStyle = .fullScreen
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        vc.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
        navigationController?.pushViewController(vc, animated: true)
//        present(nav, animated: true) {
////            self.navigationController?.pushViewController(vc, animated: true)
//        }
        
        
        
        
    }
    
    
}


//MARK: UI
extension ViewController{
    private func initViews(){
        view.addSubview(imageView)
        view.addSubview(nameLabel)
        view.sendSubviewToBack(imageView)
        imageView.image = UIImage(named: "launch")
        imageView.contentMode = .scaleAspectFit
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        nameLabel.text = "My Andijan"
        nameLabel.textColor = .white
        nameLabel.textAlignment = .center
        nameLabel.start()
        nameLabel.font = UIFont(name: "Noteworthy-Bold", size: 40)
        nameLabel.delegate = self
        nameLabel.morphingCharacterDelay = 0.1
        nameLabel.morphingEffect = .sparkle
        nameLabel.morphingDuration = 1.2
        nameLabel.morphingEnabled = true
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(50)
            make.right.left.equalToSuperview().inset(10)
            make.height.equalTo(80)
        }
        
        
    }
}

