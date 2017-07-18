//
//  BarbuttonItemModel.swift
//  自定义导航栏
//
//  Created by mfang032 on 2017/7/8.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import Foundation

struct BarButtonItemModel {
    var title: String
    var category: String
    var backgroundImgName: String
    var backgroundSelectedImgName: String
    
    init(_ title:String, category:String, backgroundImgName:String, backgroundSelectedImgName:String) {
        self.title = title
        self.category = category
        self.backgroundImgName = backgroundImgName
        self.backgroundSelectedImgName = backgroundSelectedImgName
    }
    
    static func getLeftBarButtonItemModels() ->[BarButtonItemModel] {
        var arrays:[BarButtonItemModel] = []
        let food = BarButtonItemModel("川菜", category: "美食", backgroundImgName: "icon_category_1", backgroundSelectedImgName: "icon_category_highlighted_1")
        let food1 = BarButtonItemModel("成都", category: "地区", backgroundImgName: "icon_district", backgroundSelectedImgName: "icon_district_highlighted")
        let food2 = BarButtonItemModel("欢迎程度", category: "排序", backgroundImgName: "icon_sort", backgroundSelectedImgName: "icon_sort_highlighted")
        arrays.append(food)
        arrays.append(food1)
        arrays.append(food2)
        return arrays
    }
}
