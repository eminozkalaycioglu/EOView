//
//  EOView.swift
//  EOView
//
//  Created by Emin Özkalaycıoğlu on 13.12.2022.
//

import UIKit

@IBDesignable
public class EOView: UIView {
    
    //MARK: Public properties
    public override var backgroundColor: UIColor? {
        get {
            return self.shadowView.backgroundColor
        } set {
            self.shadowView.backgroundColor = newValue
        }
    }
    
    @IBInspectable
    public var shadowColor: UIColor = .black {
        didSet {
            self.shadowView.layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable
    public var shadowOffset: CGSize = .init(width: 0, height: 0) {
        didSet {
            self.shadowView.layer.shadowOffset = shadowOffset
        }
    }
    
    @IBInspectable
    public var shadowRadius: CGFloat = .zero {
        didSet {
            self.shadowView.layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable
    public var shadowOpacity: CGFloat = 1 {
        didSet {
            self.shadowView.layer.shadowOpacity = Float(shadowOpacity)
        }
    }
    
    @IBInspectable
    public var cornerRadius: CGFloat = 8 {
        didSet {
            self.shadowView.layer.cornerRadius = cornerRadius
            self.layer.cornerRadius = cornerRadius
        }
    }
      
    //MARK: Set - private, Get - internal properties
    private(set) lazy var shadowView: UIView = {
        let shadowView = UIView()
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        shadowView.layer.masksToBounds = false
        return shadowView
    }()
    
    private(set) var isShadowViewAdded: Bool = false
    
    //MARK: Lifecycle methods
    public override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.layer.masksToBounds = true
        guard !isShadowViewAdded else { return }
        self.superview?.insertSubview(shadowView, belowSubview: self)
        self.isShadowViewAdded = true
        shadowView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        shadowView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        shadowView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        shadowView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
}
