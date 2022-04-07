//
//  SideMenuController.swift
//  My Andijan
//
//  Created by Nurillo Domlajonov on 26/03/22.
//
import UIKit

protocol MenuControllerDelegate {
    func didSelectMenuItem(named: String)
}
class SideMenuController: UIViewController {
    let imageSideMenu = UIImageView()
    let model = MenuData()
    lazy var menuCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: MenuCell.identifier)
        return collectionView
    }()
    let copyWriteLabel = AppLabels(text: "My Andijan mobile © 2022 ", textColor: UIColor(named: "TextColors")!, fontSize: 20)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "BackColor")
        initViews()
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
   
}

//MARK: UI
extension SideMenuController{
    private func initViews(){
        view.addSubview(imageSideMenu)
        view.addSubview(menuCollectionView)
        view.addSubview(copyWriteLabel)
        imageSideMenu.image = UIImage(named: "launch")
        imageSideMenu.contentMode = .scaleAspectFill
        imageSideMenu.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(30)
            make.right.left.equalToSuperview().inset(10)
            make.height.equalToSuperview().multipliedBy(0.2)
        }
        copyWriteLabel.snp.makeConstraints { make in
            make.bottom.right.left.equalToSuperview().inset(10)
            make.height.equalToSuperview().multipliedBy(0.05)
        }
        menuCollectionView.snp.makeConstraints { make in
            make.top.equalTo(imageSideMenu.snp.bottom).offset(40)
            make.bottom.equalTo(copyWriteLabel.snp.top).offset(-10)
            make.right.left.equalToSuperview().inset(15)
        }
        
    }
}
//MARK: CollectionView delegate + datasource
extension SideMenuController: UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.getSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCell.identifier, for: indexPath) as! MenuCell
        cell.getItems(title: model.getItems(index: indexPath.item).title.localized, image: model.getItems(index: indexPath.item).imageName)
        if indexPath.item>=4{
            cell.bottomView.isHidden = true
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == 0{
            showAlert()
        }
        else if indexPath.item == 1{
            //some code
        }
        else if indexPath.item == 2{
            shareApp()
        }
        else if indexPath.item == 3{
            rateApp()
        }
        else{
            let vc = InfoController()
            vc.modalPresentationStyle = .formSheet
            present(vc, animated: true, completion: nil)
//            navigationController?.pushViewController(vc, animated: true)
        }
    }
  
}

//MARK: sidemenu actions
extension SideMenuController{
     func shareApp()->Void{
            let someText:String = "https://apps.apple.com/app/apple-store/id" + "\(Constants.appId)"
            let objectsToShare:URL = URL(string: "https://apps.apple.com/app/apple-store/id" + "\(Constants.appId)")!
            let sharedObjects:[AnyObject] = [objectsToShare as AnyObject,someText as AnyObject]
            let activityViewController = UIActivityViewController(activityItems : sharedObjects, applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            
            activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook,UIActivity.ActivityType.postToTwitter,UIActivity.ActivityType.mail]
            self.present(activityViewController, animated: true, completion: nil)
        }
     func rateApp()->Void{
        let url = URL(string: "https://apps.apple.com/app/apple-store/id" + "\(Constants.appId)")!
        UIApplication.shared.open(url)
    }
    func showAlert(){
        let alert = UIAlertController(title: "Tilni o`zgartirish".localized, message: "Iltimos o`zgartirmoqchi bo`lgan tilingizni tanlang.".localized, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "O`zbekcha 🇺🇿", style: .default, handler: { a in
               self.changeLanguage("uz")
        }))
        
        alert.addAction(UIAlertAction(title: "Russian 🇷🇺", style: .default, handler: { a in
            self.changeLanguage("ru")
        }))
        alert.addAction(UIAlertAction(title: "English🇺🇸", style: .default, handler: { a in
            self.changeLanguage("en")
        }))
        alert.addAction(UIAlertAction(title: "Узбекча🇺🇿", style: .default, handler: { a in
            self.changeLanguage("уз")
        }))
        alert.addAction(UIAlertAction(title: "Bekor qilish", style: .destructive))
        present(alert, animated: true, completion: nil)
    }
    func changeLanguage(_ langCode: String) {
//    let vc = ViewController()
        if LocalizationSystem.sharedInstance.getLanguage() != langCode {
            LocalizationSystem.sharedInstance.setLanguage(languageCode: langCode)
        } else {
           return
        }
        self.view.layoutSubviews()
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "vc") as! ViewController
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
        let delegate = windowScene.delegate as? SceneDelegate else { return }
        delegate.window?.rootViewController = vc
        
//        let appDlg = UIApplication.shared.delegate as? AppDelegate
//                appDlg?.window?.rootViewController = vc
    }
    
}

//MARK: Menu Datas And Structs
struct MenuElements{
    let imageName: String
    let title: String
}
struct MenuData{
    let data: [MenuElements] = [
        MenuElements(imageName: "translation", title: "Tilni o`zgartirish"),
    MenuElements(imageName: "video", title: "Video qo`llanma"),
    MenuElements(imageName: "share", title: "Ulashish"),
    MenuElements(imageName: "rating", title: "Baxolash"),
    MenuElements(imageName: "info", title: "Dastur haqida")
    ]
    func getSize()->Int{
        return data.count
    }
    func getItems(index: Int)->MenuElements{
        return data[index]
    }
}


//MARK: extension for string
extension String {
    
    var localized: String {
        return LocalizationSystem.sharedInstance.localizedStringForKey(key: self, comment: "")
    }
}
