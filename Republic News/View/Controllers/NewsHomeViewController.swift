//
//  NewsHomeViewController.swift
//  Republic News
//
//  Created by sahil pathania on 12/08/20.
//  Copyright © 2020 sahil pathania. All rights reserved.
//

import UIKit

class NewsHomeViewController: UIViewController {
    
    //MARK:- Outlet
    @IBOutlet weak var collectionView : UICollectionView!
    
    //MARK:- Variable declaration
    var newsListViewModel : NewsListViewModel?
    var countryCode = ""
    
    //MARK:- Class instantiate
    static func instantiate() -> NewsHomeViewController{
        return UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "NewsHomeViewController") as! NewsHomeViewController
    }
    
    //MARK:- Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(NewsCardCollectionCell.nib(), forCellWithReuseIdentifier: NewsCardCollectionCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        callNewsApi()
    }
}
extension NewsHomeViewController : UICollectionViewDelegate , UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsListViewModel?.numberOfRowsInSection(section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCardCollectionCell.identifier, for: indexPath) as?
            NewsCardCollectionCell else { return UICollectionViewCell()}
        if let articleViewModel = newsListViewModel?.articleAtRowIndex(indexPath.row) {
            cell.configure(with: articleViewModel)
        }
        cell.knowMoreBtn.tag = indexPath.row
        cell.delegate = self
        return cell
    }
}
extension NewsHomeViewController : KnowMoreButtonProtocol {
    
    /// Know more button action handler called via protocol
    /// - Parameter index: current index of collection view
    func knowMoreBtnClicked(index: Int) {
        let newsDetailVC = NewsDetailViewController.instantiate()
        if let articleViewModel = newsListViewModel?.articleAtRowIndex(index) {
            newsDetailVC.url = articleViewModel.url
            newsDetailVC.modalPresentationStyle = .fullScreen
            self.present(newsDetailVC, animated: true, completion: nil)
        }
    }
}
extension NewsHomeViewController{
    /// Hit News API and get the data and reload collection view.
    func callNewsApi() {
        ApiManager.sharedInstance.callNewsApi(countryCode: countryCode, success: { (newsModel) in
            print("success")
            self.newsListViewModel = NewsListViewModel(newsModel: newsModel)
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }) { (fail) in
            print("fail")
        }
    }
}

