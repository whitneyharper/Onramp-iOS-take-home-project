//
//  FavoriteQuoteView.swift
//  RandomQuoteApp
//
//  Created by Whitney Harper on 1/6/23.
//

import UIKit

class FavoriteQuoteView: UIView {
    var imageView = UIImageView()
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
       
       imageView.clipsToBounds = true
       imageView.image = UIImage(named: "vintage1x")
       imageView.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .horizontal)
       imageView.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .vertical)
       imageView.translatesAutoresizingMaskIntoConstraints = false
       
       quoteLabel.adjustsFontForContentSizeCategory = true
       quoteLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
       quoteLabel.minimumScaleFactor = 0.5
       quoteLabel.numberOfLines = 6
       quoteLabel.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 749), for: .vertical)
       quoteLabel.setContentHuggingPriority(.required, for: .vertical)
       quoteLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .horizontal)
       quoteLabel.text = ""
       quoteLabel.textAlignment = .center
       quoteLabel.translatesAutoresizingMaskIntoConstraints = false
       
       authorLabel.adjustsFontForContentSizeCategory = true
       authorLabel.font = UIFont.preferredFont(forTextStyle: .title2)
       authorLabel.minimumScaleFactor = 0.5
       authorLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .horizontal)
       authorLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .vertical)
       authorLabel.text = ""
       authorLabel.textAlignment = .center
       authorLabel.translatesAutoresizingMaskIntoConstraints = false
       
       addSubview(imageView)
       addSubview(quoteLabel)
       addSubview(authorLabel)
   }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            self.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            quoteLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            quoteLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            authorLabel.topAnchor.constraint(equalTo: quoteLabel.bottomAnchor, constant: 25),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.bottomAnchor.constraint(equalTo: imageView.bottomAnchor),
            self.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: authorLabel.trailingAnchor, constant: 24),
            self.trailingAnchor.constraint(greaterThanOrEqualTo: quoteLabel.trailingAnchor, constant: 24),
            authorLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 71),
            quoteLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),

            authorLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 0),

            quoteLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0),
        ])
    }
}
