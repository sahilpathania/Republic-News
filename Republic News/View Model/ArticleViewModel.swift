//
//  ArticleViewModel.swift
//  Republic News
//
//  Created by sahil pathania on 12/08/20.
//  Copyright © 2020 sahil pathania. All rights reserved.
//

import Foundation

struct ArticleViewModel {
    private var article : Article?
    init(article : Article?) {
        self.article = article
    }
    /// Return the article image url
    var imageUrl : String {
        return article?.urlToImage ?? ""
    }
    /// Return the title of the article
    var title : String {
        return article?.title ?? ""
    }
    /// Return the description of the article
    var description : String {
        return  article?.description ?? ""
    }
    /// Return the url for the article to get the whole article data
    var url : String {
        return article?.url ?? ""
    }
}
