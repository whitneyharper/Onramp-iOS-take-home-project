//
//  FavoriteCell.swift
//  RandomQuoteApp
//
//  Created by Whitney Harper on 1/6/23.
//

import UIKit

class FavoriteCell: UITableViewCell {

   var label = UILabel()
   var customImageView = UIImageView()

   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
      super.init(style: style, reuseIdentifier: reuseIdentifier)
      setupUI()
      setupLayout()
   }

   required init?(coder: NSCoder) {
      fatalError("Please use this class from code.")
   }

   private func setupUI() {

       label.adjustsFontForContentSizeCategory = true
       label.contentMode = .left
       label.font = UIFont.preferredFont(forTextStyle: .subheadline)
       label.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 751), for: .vertical)
       label.setContentHuggingPriority(UILayoutPriority(rawValue: 252), for: .vertical)
       label.text = ""
       label.textAlignment = .natural
       label.translatesAutoresizingMaskIntoConstraints = false
       
       customImageView.clipsToBounds = true
       customImageView.contentMode = .scaleAspectFit
       customImageView.image = UIImage(systemName: "chevron.right.circle")
       customImageView.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .horizontal)
       customImageView.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .vertical)
       customImageView.translatesAutoresizingMaskIntoConstraints = false
       
       contentView.clipsToBounds = true
       contentView.contentMode = .center
       contentView.insetsLayoutMarginsFromSafeArea = false
       contentView.isMultipleTouchEnabled = true
       contentView.preservesSuperviewLayoutMargins = true
       
       contentView.addSubview(label)
       contentView.addSubview(customImageView)
       
       clipsToBounds = true
       preservesSuperviewLayoutMargins = true
       tintColor = UIColor.label
   }

   private func setupLayout() {
       NSLayoutConstraint.activate([
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
        customImageView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor, constant: 2),
        contentView.layoutMarginsGuide.trailingAnchor.constraint(equalTo: customImageView.trailingAnchor, constant: 16),
        contentView.layoutMarginsGuide.bottomAnchor.constraint(equalTo: customImageView.bottomAnchor, constant: 3),
        customImageView.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 105),
        label.topAnchor.constraint(equalTo: contentView.topAnchor),
        label.widthAnchor.constraint(greaterThanOrEqualToConstant: 0),
       ])
   }
}
