//
//  CurrencyPageController.swift
//  My Andijan
//
//  Created by Nurillo Domlajonov on 27/03/22.
//

import UIKit
import Network
import Lottie
class CurrencyController: UIViewController {
    
    var animationView: AnimationView?
    let noConnectionLabel = AppLabels(text: "Internet bilan bog`liq muammo bor!", textColor: UIColor(named: "TextColors")!, fontSize: 22)
    let monitor = NWPathMonitor()
    var data: [CurrencyData] = []
    let networker = NetworkManager.shared
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 15
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(CurrencyCell.self, forCellWithReuseIdentifier: CurrencyCell.identifier)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "BackColor")
        title = "Valyuta Kurslari"
        self.navigationController?.navigationBar.backItem?.title = "Ortga"
        initViews()
        fetchData()
        
    }
    
}
//MARK: NETWORK FUNtion
extension CurrencyController{
    func fetchData(){
        let queue = DispatchQueue(label: "Monitor")
        monitor.start(queue: queue)
        monitor.pathUpdateHandler = { [weak self] path in
            if path.status == .satisfied {
                self?.networker.getCurrensDatas { res in
                    DispatchQueue.main.async {
                        self?.data = res
                        self?.collectionView.reloadData()
                    }
                }
            } else {
                DispatchQueue.main.async {
                    self?.initAnimations()
                    self?.noConnectionLabel.isHidden = false
                    self?.collectionView.isHidden = true
                }
                print("No connection.😜😜😜😜")
            }
        }
    }
}

//MARK: UI
extension CurrencyController{
    private func initAnimations(){
        animationView = .init(name: "networkError")
        animationView?.frame = view.bounds
        animationView?.animationSpeed = 1
        view.addSubview(animationView!)
        animationView?.play()
    }
    
    private func initViews(){
        view.addSubview(noConnectionLabel)
        noConnectionLabel.snp.makeConstraints { make in
            make.right.left.equalToSuperview().inset(10)
            make.height.equalTo(200)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(50)
        }
        noConnectionLabel.isHidden = true
        view.addSubview(collectionView)
        collectionView.backgroundColor = .clear
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(10)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            make.left.right.equalToSuperview()
        }
    }
}

//MARK: CollectionView delegate+data source
extension CurrencyController: UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CurrencyCell.identifier, for: indexPath) as! CurrencyCell
        cell.getItems(title: data[indexPath.item].title, code: data[indexPath.item].code, price: "1 "+data[indexPath.item].title+" = "+data[indexPath.item].cb_price+" so`m", buyprice: "Sotib olish: "+data[indexPath.item].nbu_buy_price!, cellprice: "Sotilishi: "+data[indexPath.item].nbu_cell_price!, date: "Sanasi: "+data[indexPath.item].date)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width - 30, height: 150)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    
    
}
