//
//  NewsTableViewCell.swift
//  News
//
//  Created by Kiroshan Thayaparan on 6/18/22.
//

import UIKit
import Kingfisher

class NewsTableViewCell: UITableViewCell {
    
    var data: News! = nil {
        didSet {
            thumbnail.kf.setImage(with: URL(string: data.thumbnail))
            labelTitle.text = data.title
            labelDescription.text = data.description
            labelDate.text = data.date
        }
    }
    
    private var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
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
    
    private var labelTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Title"
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 3
        return label
    }()
    
    private var labelDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        label.text = "Description"
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 2
        return label
    }()
    
    private var labelDate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Date"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .right
        return label
    }()
    
    let screen_width = UIScreen.main.bounds.width
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.isUserInteractionEnabled = true
        commonInit(view: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit(view: UIView) {
        
        view.addSubview(container)
        container.addSubview(thumbnail)
        container.addSubview(labelTitle)
        container.addSubview(labelDescription)
        container.addSubview(labelDate)
        
        container.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        container.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        container.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        container.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        container.heightAnchor.constraint(equalToConstant: screen_width/3+20).isActive = true
        
        thumbnail.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 10).isActive = true
        thumbnail.topAnchor.constraint(equalTo: container.topAnchor, constant: 10).isActive = true
        thumbnail.widthAnchor.constraint(equalToConstant: screen_width/3).isActive = true
        thumbnail.heightAnchor.constraint(equalToConstant: screen_width/3).isActive = true
        
        labelTitle.leftAnchor.constraint(equalTo: thumbnail.rightAnchor, constant: 10).isActive = true
        labelTitle.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -10).isActive = true
        labelTitle.topAnchor.constraint(equalTo: container.topAnchor, constant: 10).isActive = true
        labelTitle.heightAnchor.constraint(equalToConstant: screen_width/6).isActive = true
        
        labelDescription.leftAnchor.constraint(equalTo: thumbnail.rightAnchor, constant: 10).isActive = true
        labelDescription.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -10).isActive = true
        labelDescription.topAnchor.constraint(equalTo: labelTitle.bottomAnchor).isActive = true
        labelDescription.heightAnchor.constraint(equalToConstant: screen_width/6-20).isActive = true
        
        labelDate.leftAnchor.constraint(equalTo: thumbnail.rightAnchor, constant: 10).isActive = true
        labelDate.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -10).isActive = true
        labelDate.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -10).isActive = true
        labelDate.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
}
