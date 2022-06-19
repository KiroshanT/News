//
//  BreakingNewsTableViewCell.swift
//  News
//
//  Created by Kiroshan Thayaparan on 6/19/22.
//

import UIKit
import Kingfisher

class BreakingNewsTableViewCell: UITableViewCell {
    
    var data: News! = nil {
        didSet {
            thumbnail.kf.setImage(with: URL(string: data.thumbnail))
            labelTitle.text = data.title
            labelDate.text = data.date
        }
    }
    
    var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    var thumbnail: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .lightGray
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    var dimView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        view.layer.cornerRadius = 10
        return view
    }()
    var labelTitle: UITextView = {
        let label = UITextView()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isScrollEnabled = false
        label.isUserInteractionEnabled = false
        label.textColor = .white
        label.text = "Title"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.backgroundColor = .clear
        return label
    }()
    var labelDate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = "Date"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .right
        label.backgroundColor = .clear
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
        container.addSubview(dimView)
        dimView.addSubview(labelTitle)
        dimView.addSubview(labelDate)
        
        container.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        container.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        container.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        container.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        container.heightAnchor.constraint(equalToConstant: screen_width/3+20).isActive = true
        
        thumbnail.leftAnchor.constraint(equalTo: container.leftAnchor).isActive = true
        thumbnail.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        thumbnail.rightAnchor.constraint(equalTo: container.rightAnchor).isActive = true
        thumbnail.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        
        dimView.leftAnchor.constraint(equalTo: container.leftAnchor).isActive = true
        dimView.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        dimView.rightAnchor.constraint(equalTo: container.rightAnchor).isActive = true
        dimView.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        
        labelTitle.leftAnchor.constraint(equalTo: dimView.leftAnchor, constant: 20).isActive = true
        labelTitle.rightAnchor.constraint(equalTo: dimView.rightAnchor, constant: -20).isActive = true
        labelTitle.topAnchor.constraint(equalTo: dimView.topAnchor, constant: 20).isActive = true
        labelTitle.bottomAnchor.constraint(equalTo: labelDate.topAnchor, constant: 20).isActive = true
        
        labelDate.leftAnchor.constraint(equalTo: dimView.leftAnchor, constant: 25).isActive = true
        labelDate.rightAnchor.constraint(equalTo: dimView.rightAnchor, constant: -25).isActive = true
        labelDate.bottomAnchor.constraint(equalTo: dimView.bottomAnchor, constant: -20).isActive = true
        labelDate.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
}
