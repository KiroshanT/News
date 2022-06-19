//
//  Common.swift
//  News
//
//  Created by Kiroshan Thayaparan on 6/18/22.
//

import UIKit

extension UITextField {
    
    func addBorder(height: CGFloat, color: UIColor) {
        let borderView = UIView()
        borderView.backgroundColor = color
        borderView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(borderView)
        NSLayoutConstraint.activate(
            [
                borderView.leadingAnchor.constraint(equalTo: leadingAnchor),
                borderView.trailingAnchor.constraint(equalTo: trailingAnchor),
                borderView.bottomAnchor.constraint(equalTo: bottomAnchor),
                borderView.heightAnchor.constraint(equalToConstant: height)
            ]
        )
    }
}

extension UIView {
    
    func setHeight(_ height: CGFloat) {
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func addCornerRadius(_ value: CGFloat? = 6.0,
                         _ borderWidth: CGFloat? = 0.0,
                         _ borderColor: UIColor? = .lightGray) {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = value!
        self.layer.borderWidth = borderWidth!
        self.layer.borderColor = borderColor?.cgColor
    }
    
    func applyDropShaddow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
    }
    
    class func instantiateFromNib<T: UIView>(viewType: T.Type) -> T {
        return Bundle.main.loadNibNamed(String(describing: viewType), owner: nil, options: nil)?.first as! T
    }
    
    class func instantiateFromNib() -> Self {
        return instantiateFromNib(viewType: self)
    }
}

extension UIViewController{
    
    func alert(message: String, title: String = "", okBtnCallback: (()->Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "Okay!", style: .default) { action in
            okBtnCallback?()
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func navigateTo(_ controller: UIViewController) {
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func popNavigation() {
        navigationController?.popViewController(animated: true)
    }
}
