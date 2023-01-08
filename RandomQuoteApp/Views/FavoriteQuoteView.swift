//
//  FavoriteQuoteView.swift
//  RandomQuoteApp
//
//  Created by Whitney Harper on 1/6/23.
//

import UIKit

class FavoriteQuoteView: UIView {
    
    var quoteLabel = UILabel()
    var authorLabel = UILabel()
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupLayout()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
          super.traitCollectionDidChange(previousTraitCollection)

          if traitCollection.verticalSizeClass == .regular && traitCollection.horizontalSizeClass == .regular {
             authorLabel.font = UIFont.preferredFont(forTextStyle: .title1)
          }
       }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
        setupLayout()
    }

   private func setupUI() {
       
       self.backgroundColor = UIColor(red: 0.80784313725490198, green: 0.84313725490196079, blue: 0.94901960784313721, alpha: 1)
       
       quoteLabel.adjustsFontForContentSizeCategory = true
       quoteLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
       quoteLabel.minimumScaleFactor = 0.5
       quoteLabel.numberOfLines = 6
       quoteLabel.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 749), for: .vertical)
       quoteLabel.setContentHuggingPriority(.required, for: .vertical)
       quoteLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .horizontal)
       quoteLabel.text = ""
       quoteLabel.textAlignment = .center
       quoteLabel.textColor = UIColor(red: 0.28627450980392155, green: 0.32941176470588235, blue: 0.45098039215686275, alpha: 1)
       quoteLabel.translatesAutoresizingMaskIntoConstraints = false
       
       authorLabel.adjustsFontForContentSizeCategory = true
       authorLabel.font = UIFont.preferredFont(forTextStyle: .title2)
       authorLabel.minimumScaleFactor = 0.5
       authorLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .horizontal)
       authorLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .vertical)
       authorLabel.text = ""
       authorLabel.textAlignment = .center
       authorLabel.textColor = UIColor(red: 0.28627450980392155, green: 0.32941176470588235, blue: 0.45098039215686275, alpha: 1)
       authorLabel.translatesAutoresizingMaskIntoConstraints = false
       
       addSubview(quoteLabel)
       addSubview(authorLabel)
   }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            quoteLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            quoteLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            authorLabel.topAnchor.constraint(equalTo: quoteLabel.bottomAnchor, constant: 25),
            self.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: authorLabel.trailingAnchor, constant: 24),
            self.trailingAnchor.constraint(greaterThanOrEqualTo: quoteLabel.trailingAnchor, constant: 24),
            authorLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 71),
            quoteLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),

            authorLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 0),

            quoteLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0),
        ])
    }
}
