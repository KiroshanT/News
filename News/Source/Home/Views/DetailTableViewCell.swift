//
//  DetailTableViewCell.swift
//  News
//
//  Created by Kiroshan Thayaparan on 6/18/22.
//

import UIKit
import Kingfisher

class DetailTableViewCell: UITableViewCell {
    
    var data: News! = nil {
        didSet {
            thumbnail.kf.setImage(with: URL(string: data.thumbnail))
            labelDate.text = data.date
            textViewTitle.text = data.title
            textViewDescription.text = data.description
            textViewContent.text = data.content
        }
    }
    
    private var thumbnail: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .lightGray
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    private var labelDate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Date"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.backgroundColor = .white
        label.textAlignment = .right
        return label
    }()
    private var textViewTitle: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isUserInteractionEnabled = false
        textView.isScrollEnabled = false
        textView.textColor = .black
        textView.text = "Title"
        textView.font = UIFont.boldSystemFont(ofSize: 16)
        textView.backgroundColor = .white
        return textView
    }()
    private var textViewDescription: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isUserInteractionEnabled = false
        textView.isScrollEnabled = false
        textView.textColor = .gray
        textView.text = "Description"
        textView.font = UIFont.boldSystemFont(ofSize: 14)
        textView.backgroundColor = .white
        return textView
    }()
    private var textViewContent: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isUserInteractionEnabled = false
        textView.isScrollEnabled = false
        textView.textColor = .gray
        textView.text = "Content"
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.backgroundColor = .white
        return textView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.isUserInteractionEnabled = true
        commonInit(view: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit(view: UIView) {
        view.addSubview(thumbnail)
        view.addSubview(labelDate)
        view.addSubview(textViewTitle)
        view.addSubview(textViewDescription)
        view.addSubview(textViewContent)
        
        thumbnail.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        thumbnail.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        thumbnail.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        thumbnail.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2).isActive = true
        
        labelDate.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        labelDate.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        labelDate.topAnchor.constraint(equalTo: thumbnail.bottomAnchor, constant: 20).isActive = true
        labelDate.bottomAnchor.constraint(equalTo: textViewTitle.topAnchor, constant: -20).isActive = true

        textViewTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        textViewTitle.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        textViewTitle.topAnchor.constraint(equalTo: labelDate.bottomAnchor, constant: 20).isActive = true
        textViewTitle.bottomAnchor.constraint(equalTo: textViewDescription.topAnchor).isActive = true
        
        textViewDescription.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        textViewDescription.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        textViewDescription.topAnchor.constraint(equalTo: textViewTitle.bottomAnchor, constant: 20).isActive = true
        textViewDescription.bottomAnchor.constraint(equalTo: textViewContent.topAnchor).isActive = true
        
        textViewContent.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        textViewContent.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        textViewContent.topAnchor.constraint(equalTo: textViewDescription.bottomAnchor, constant: 20).isActive = true
        textViewContent.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
    }
}
