//
//  RandomQuoteView.swift
//  RandomQuoteApp
//
//  Created by Whitney Harper on 1/5/23.
//

import UIKit

class RandomQuoteView: UIView {
    
    var imageView = UIImageView()
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
           
           imageView.clipsToBounds = true
           imageView.contentMode = .scaleAspectFill
           imageView.image = UIImage(named: "vintage1x")
           imageView.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .horizontal)
           imageView.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .vertical)
           imageView.translatesAutoresizingMaskIntoConstraints = false
           
           headingLabel.adjustsFontForContentSizeCategory = true
           headingLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
           headingLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .horizontal)
           headingLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .vertical)
           headingLabel.text = "Dear Self, "
           headingLabel.translatesAutoresizingMaskIntoConstraints = false
           
           quoteLabel.adjustsFontForContentSizeCategory = true
           quoteLabel.font = UIFont.preferredFont(forTextStyle: .body)
           quoteLabel.minimumScaleFactor = 0.5
           quoteLabel.numberOfLines = 6
           quoteLabel.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 749), for: .vertical)
           quoteLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .horizontal)
           quoteLabel.text = ""
           quoteLabel.translatesAutoresizingMaskIntoConstraints = false
           
           authorLabel.adjustsFontForContentSizeCategory = true
           authorLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
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
           saveButton.tintColor = UIColor(red: 0.34901960780000002, green: 0.2784313725, blue: 0.21176470589999999, alpha: 1)
           saveButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
           saveButton.titleLabel?.lineBreakMode = .byTruncatingMiddle
           saveButton.translatesAutoresizingMaskIntoConstraints = false
           saveButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
           saveButton.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 33).applying(UIImage.SymbolConfiguration(scale: .default)).applying(UIImage.SymbolConfiguration(weight: .regular)), forImageIn: .normal)
           saveButton.addTarget(nil, action: #selector(randomQuoteViewController?.favoriteButtonPressed(_:)), for: .touchUpInside)

           quoteButton.contentHorizontalAlignment = .fill
           quoteButton.contentMode = .scaleAspectFill
           quoteButton.contentVerticalAlignment = .fill
       
           quoteButton.tintColor = UIColor(red: 0.34901960780000002, green: 0.2784313725, blue: 0.21176470589999999, alpha: 1)
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
           
           addSubview(imageView)
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
          self.bottomAnchor.constraint(equalTo: imageView.bottomAnchor),
          imageView.topAnchor.constraint(equalTo: self.topAnchor),
          self.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: quoteView.trailingAnchor, constant: 20),
          quoteView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
          quoteView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
          imageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
          stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
          quoteView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 161),
          stackView.topAnchor.constraint(equalTo: quoteView.bottomAnchor, constant: 40),
          imageView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
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
