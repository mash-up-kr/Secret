//
//  GradientSearchBar.swift
//  YakGGUK
//
//  Created by juhee on 06/12/2018.
//  Copyright © 2018 team1. All rights reserved.
//

import UIKit

class HintSearchBar: UISearchBar {
    
    @IBInspectable var preferredTextColor: UIColor!
    @IBInspectable var preferredHintColor: UIColor!

    init(frame: CGRect, textColor: UIColor, hintColor: UIColor) {
        super.init(frame: frame)
        
        self.frame = frame
        preferredTextColor = textColor
        preferredHintColor = hintColor
        searchBarStyle = .prominent
        isTranslucent = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func indexOfSearchFieldInSubviews() -> Int! {
        var index: Int!
        let searchBarView: UIView = subviews[0]
        
        for indexLoop in 0..<searchBarView.subviews.count where searchBarView.subviews[indexLoop] is UITextField {
            index = indexLoop
            break
        }
        
        return index
    }
    
    override func draw(_ rect: CGRect) {
        if let index = indexOfSearchFieldInSubviews(), let searchField: UITextField = subviews[0].subviews[index] as? UITextField {
            searchField.textColor = preferredTextColor
            searchField.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "", attributes:[NSAttributedString.Key.foregroundColor: preferredHintColor])
            searchField.backgroundColor = UIColor.clear
            let searchImage = UIImage(named: "icSearch")
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
            imageView.image = searchImage
            searchField.leftViewMode = .always
            searchField.leftView = imageView
        }
        setImage(UIImage(named: "icX"), for: .clear, state: .normal)
        setImage(UIImage(named: "icSearch"), for: .search, state: .normal)
        
        super.draw(rect)
    }
}