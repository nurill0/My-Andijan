//
//  ChooseModel.swift
//  My Andijan
//
//  Created by Nurillo Domlajonov on 26/03/22.
//

import UIKit

struct ChooserDetail{
    let title: String
    let imageName: String
}
struct ChooseData{
    var data: [ChooserDetail] = [
    ChooserDetail(title: "Avtobuslar harakati", imageName: "1"),
    ChooserDetail(title: "Valyuta kurslari", imageName: "2"),
    ChooserDetail(title: "Zapravkalar", imageName: "3"),
    ChooserDetail(title: "Kuzatuv kameralari", imageName: "4"),
    ChooserDetail(title: "Masjidlar", imageName: "6"),
    ChooserDetail(title: "Choyxonalar", imageName: "7"),
    ChooserDetail(title: "To`yxonalar", imageName: "8"),
    ChooserDetail(title: "Mexmonxonalar", imageName: "9"),
    ]
    
    func getSize()->Int{
        return data.count
    }
    func getItem(index: Int)->ChooserDetail{
        return data[index]
    }
    
}
