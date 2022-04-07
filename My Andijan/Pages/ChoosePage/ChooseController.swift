//
//  ChooseController.swift
//  My Andijan
//
//  Created by Nurillo Domlajonov on 26/03/22.
//

import UIKit
import SideMenu

class ChooseController: UIViewController,SideMenuNavigationControllerDelegate {
    
    var sideMenu: SideMenuNavigationController?
    var isSideMenuClosed = true
    var model = ChooseData()
    
        lazy var collectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.minimumLineSpacing = 20
            layout.minimumInteritemSpacing = 20
            layout.scrollDirection = .vertical
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.showsVerticalScrollIndicator = false
            collectionView.register(ChooseCell.self, forCellWithReuseIdentifier: ChooseCell.identifier)
            return collectionView
        }()
    override func viewWillAppear(_ animated: Bool) {
        title = "My Andijan"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "BackColor")
        initSideMenu()
        initViews()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu")?.withRenderingMode(.alwaysOriginal).withTintColor(UIColor(named: "TextColors") ?? .black), style: .plain, target: self, action: #selector(openSideMenu))
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(descriptor: UIFontDescriptor(name: "Times New Roman", size: 30), size: 25)]

    }
    
    
    @objc func openSideMenu(){
        present(sideMenu!, animated: true, completion: nil)
    }
    
    
}

//MARK: UI
extension ChooseController{
    
    private func initSideMenu(){
        var menu = SideMenuController()
        sideMenu = SideMenuNavigationController(rootViewController: menu)
        sideMenu?.leftSide = true
        sideMenu?.menuWidth = (view.frame.width)*3/4
        sideMenu?.setNavigationBarHidden(true, animated: false)
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        sideMenu?.navigationBar.clipsToBounds = true
        sideMenu?.navigationBar.barTintColor = #colorLiteral(red: 0.7175473571, green: 0.2955725491, blue: 0.9618186355, alpha: 1)
    }
    private func initViews(){
        view.addSubview(collectionView)
        collectionView.backgroundColor = .clear
        collectionView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.right.equalToSuperview()

        }
    }

}


//MARK: collectionView delegate+ datasource
extension ChooseController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.getSize()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChooseCell.identifier, for: indexPath) as! ChooseCell
        cell.getImageAndTitle(title: model.getItem(index: indexPath.item).title, name: model.getItem(index: indexPath.item).imageName)
        cell.backgroundColor = UIColor(named: "CellBack")

        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.collectionView.frame.width-40)/2, height: 200)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
 
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var vc = UIViewController()
       
        if indexPath.item == 1{
            vc = CurrencyController()
        }
        UIView.animate(withDuration: 0.3) {
            if let cell = collectionView.cellForItem(at: indexPath) as? ChooseCell {
                cell.transform = .init(scaleX: 0.92, y: 0.92)
            }
        } completion: { anime in
            UIView.animate(withDuration: 0.15) {
                if let cell = collectionView.cellForItem(at: indexPath) as? ChooseCell {
                    cell.transform = .identity
                    vc.modalPresentationStyle = .fullScreen
                    self.navigationController?.pushViewController(vc, animated: false)
                }
            }
        }
    }
  
    
    
    
    
}
