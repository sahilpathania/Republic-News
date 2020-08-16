//
//  NewsListViewModel.swift
//  Republic News
//
//  Created by sahil pathania on 12/08/20.
//  Copyright © 2020 sahil pathania. All rights reserved.
//

import Foundation

struct NewsListViewModel {
    var newsModel : NewsModel?
    init(newsModel : NewsModel) {
        self.newsModel = newsModel
    }
}
extension NewsListViewModel {
    
    /// Return the number of rows in section
    /// - Parameter section: Current section
    func numberOfRowsInSection(_ section : Int) -> Int {
        return newsModel?.articles?.count ?? 0
    }
    /// Return the article at current row index
    /// - Parameter index: current index
    func articleAtRowIndex(_ index : Int) -> ArticleViewModel{
        let article = newsModel?.articles?[index]
        return ArticleViewModel(article: article)
    }
}
