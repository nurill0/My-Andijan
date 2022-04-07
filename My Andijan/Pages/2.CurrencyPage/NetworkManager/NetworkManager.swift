//
//  NetworkManager.swift
//  My Andijan
//
//  Created by Nurillo Domlajonov on 26/03/22.
//

import UIKit
import Alamofire

class NetworkManager{
    static let shared = NetworkManager()
    func getCurrensDatas(completionHandler: @escaping (([CurrencyData])->Void)){
        
        let request = AF.request(AppURLs.currencyUrl)
        request.responseDecodable(of: [CurrencyData].self ){ [weak self] res in
            guard let news = res.value else{
                print("data no comming")
                return}
            completionHandler(news)
        }
    }
    
}
