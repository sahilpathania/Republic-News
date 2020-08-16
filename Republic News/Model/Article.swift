//
//  Article.swift
//  Republic News
//
//  Created by sahil pathania on 12/08/20.
//  Copyright © 2020 sahil pathania. All rights reserved.
//

import Foundation

//MARK: - Article
struct Article : Decodable{
        var author : String?
        var content : String?
        var description : String?
        var publishedAt : String?
        var source : Source?
        var title : String?
        var url : String?
        var urlToImage : String?
}

