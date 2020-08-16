//
//  NewsModel.swift
//  Republic News
//
//  Created by sahil pathania on 12/08/20.
//  Copyright © 2020 sahil pathania. All rights reserved.
//

import Foundation

//MARK: - NewsModel
struct NewsModel : Decodable{
        var articles : [Article]?
        var status : String?
        var totalResults : Int?
}
