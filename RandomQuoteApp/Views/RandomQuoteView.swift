//
//  RandomQuoteView.swift
//  RandomQuoteApp
//
//  Created by Whitney Harper on 1/5/23.
//

import UIKit

class RandomQuoteView: UIView {
    
    var headingLabel = UILabel()
    var quoteLabel = UILabel()
    var authorLabel = UILabel()
    var quoteView = UIView()
    var quoteButton = UIButton(type: .custom)
    var saveButton = UIButton(type: .custom)
    var stackView = UIStackView()
    var randomQuoteViewController: RandomQuoteViewController?
   

    override init(frame: CGRect) {
            super.init(frame: frame)
            setupUI()
            setupLayout()
        }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
        setupLayout()
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
          super.traitCollectionDidChange(previousTraitCollection)

          if traitCollection.verticalSizeClass == .regular && traitCollection.horizontalSizeClass == .regular {
             authorLabel.font = UIFont.preferredFont(forTextStyle: .title1)
              quoteLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
          }
       }

       private func setupUI() {
           
           self.backgroundColor = UIColor(red: 0.80784313725490198, green: 0.84313725490196079, blue: 0.94901960784313721, alpha: 1)
           
           headingLabel.adjustsFontForContentSizeCategory = true
           headingLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
           headingLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .horizontal)
           headingLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .vertical)
           headingLabel.text = "Dear Self, "
           headingLabel.textColor = UIColor(red: 0.28627450980392155, green: 0.32941176470588235, blue: 0.45098039215686275, alpha: 1)
           headingLabel.translatesAutoresizingMaskIntoConstraints = false
           
           quoteLabel.adjustsFontForContentSizeCategory = true
           quoteLabel.font = UIFont.preferredFont(forTextStyle: .body)
           quoteLabel.textColor = UIColor.black
           quoteLabel.minimumScaleFactor = 0.5
           quoteLabel.numberOfLines = 6
           quoteLabel.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 749), for: .vertical)
           quoteLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .horizontal)
           quoteLabel.text = ""
           quoteLabel.translatesAutoresizingMaskIntoConstraints = false
           
           authorLabel.adjustsFontForContentSizeCategory = true
           authorLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
           authorLabel.textColor = UIColor.black
           authorLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .horizontal)
           authorLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .vertical)
           authorLabel.text = ""
           authorLabel.textAlignment = .right
           authorLabel.translatesAutoresizingMaskIntoConstraints = false
           
           quoteView.addSubview(quoteLabel)
           quoteView.addSubview(authorLabel)
           quoteView.backgroundColor = UIColor.white
           quoteView.translatesAutoresizingMaskIntoConstraints = false
           quoteView.setValue(10, forKeyPath: "layer.cornerRadius")
           quoteView.setValue(true, forKeyPath: "layer.masksToBounds")
           
           saveButton.contentHorizontalAlignment = .fill
           saveButton.contentMode = .scaleAspectFill
           saveButton.contentVerticalAlignment = .fill
           saveButton.tintColor = UIColor(red: 0.28627450980392155, green: 0.32941176470588235, blue: 0.45098039215686275, alpha: 1)
           saveButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
           saveButton.titleLabel?.lineBreakMode = .byTruncatingMiddle
           saveButton.translatesAutoresizingMaskIntoConstraints = false
           saveButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
           saveButton.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 33).applying(UIImage.SymbolConfiguration(scale: .default)).applying(UIImage.SymbolConfiguration(weight: .regular)), forImageIn: .normal)
           saveButton.addTarget(nil, action: #selector(randomQuoteViewController?.favoriteButtonPressed(_:)), for: .touchUpInside)

           quoteButton.contentHorizontalAlignment = .fill
           quoteButton.contentMode = .scaleAspectFill
           quoteButton.contentVerticalAlignment = .fill
       
           quoteButton.tintColor = UIColor(red: 0.28627450980392155, green: 0.32941176470588235, blue: 0.45098039215686275, alpha: 1)
           quoteButton.titleLabel?.lineBreakMode = .byTruncatingMiddle
           quoteButton.translatesAutoresizingMaskIntoConstraints = false
           quoteButton.setImage(UIImage(systemName: "shuffle"), for: .normal)
           quoteButton.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 33).applying(UIImage.SymbolConfiguration(scale: .default)).applying(UIImage.SymbolConfiguration(weight: .regular)), forImageIn: .normal)
           quoteButton.addTarget(nil, action: #selector(randomQuoteViewController?.randomButtonPressed(_:)), for: .touchUpInside)
           
           stackView.addArrangedSubview(quoteButton)
           stackView.addArrangedSubview(saveButton)
           stackView.contentMode = .scaleAspectFill
           stackView.distribution = .equalSpacing
           stackView.spacing = 94
           stackView.translatesAutoresizingMaskIntoConstraints = false
           
           addSubview(headingLabel)
           addSubview(quoteView)
           addSubview(stackView)
       }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
          quoteView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
          headingLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
          headingLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30),
          quoteView.topAnchor.constraint(equalTo: headingLabel.bottomAnchor, constant: 39),
          self.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: quoteView.trailingAnchor, constant: 20),
          quoteView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
          quoteView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
          stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
          quoteView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 161),
          stackView.topAnchor.constraint(equalTo: quoteView.bottomAnchor, constant: 40),
          self.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: headingLabel.trailingAnchor, constant: 20),

          stackView.heightAnchor.constraint(equalToConstant: 50),

          saveButton.widthAnchor.constraint(equalToConstant: 60),
          saveButton.heightAnchor.constraint(equalToConstant: 50),

          quoteButton.heightAnchor.constraint(equalToConstant: 50),
          quoteButton.widthAnchor.constraint(equalToConstant: 60),

          quoteView.bottomAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 20),
          quoteView.trailingAnchor.constraint(equalTo: authorLabel.trailingAnchor, constant: 20),
          quoteLabel.leadingAnchor.constraint(equalTo: quoteView.leadingAnchor, constant: 10),
          authorLabel.leadingAnchor.constraint(greaterThanOrEqualTo: quoteView.leadingAnchor, constant: 40),
          quoteView.trailingAnchor.constraint(greaterThanOrEqualTo: quoteLabel.trailingAnchor, constant: 10),
          quoteLabel.topAnchor.constraint(equalTo: quoteView.topAnchor, constant: 20),
          quoteView.heightAnchor.constraint(greaterThanOrEqualToConstant: 0),
          authorLabel.topAnchor.constraint(equalTo: quoteLabel.bottomAnchor, constant: 30),

          authorLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 0),

          quoteLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0),
        ])
    }
}
