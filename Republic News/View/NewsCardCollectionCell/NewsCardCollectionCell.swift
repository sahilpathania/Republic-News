//
//  NewsCardCollectionCell.swift
//  Republic News
//
//  Created by sahil pathania on 12/08/20.
//  Copyright © 2020 sahil pathania. All rights reserved.
//

import UIKit
protocol KnowMoreButtonProtocol {
    func knowMoreBtnClicked(index : Int)
}
class NewsCardCollectionCell: UICollectionViewCell {

    @IBOutlet weak var newsImgView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var bottomNewsImgView: UIImageView!
    @IBOutlet weak var knowMoreBtn: UIButton!
    
    static let identifier = "NewsCardCollectionCell"
    var delegate : KnowMoreButtonProtocol? = nil
    static func nib() -> UINib {
        return UINib(nibName: "NewsCardCollectionCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 8
    }
    
    func configure(with articleViewModel: ArticleViewModel) {
        let url = articleViewModel.imageUrl
        DispatchQueue.main.async {
            self.newsImgView.imageFromURL(urlString: url)
            self.bottomNewsImgView.imageFromURL(urlString: url)
        }
        titleLbl.text = articleViewModel.title
        descriptionLbl.text = articleViewModel.description
        
    }
    @IBAction func knowMoreBtnClicked(_ sender: Any) {
        if let index = (sender as? UIButton)?.tag {
            delegate?.knowMoreBtnClicked(index: index)
        }
    }
}
