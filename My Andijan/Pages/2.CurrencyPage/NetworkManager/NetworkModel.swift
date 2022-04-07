//
//  NetworkModel.swift
//  My Andijan
//
//  Created by Nurillo Domlajonov on 26/03/22.
//

import UIKit

struct CurrencyData: Decodable{
    let title: String
    let code: String
    let cb_price: String
    let nbu_buy_price: String?
    let nbu_cell_price: String?
    let date:  String
}



