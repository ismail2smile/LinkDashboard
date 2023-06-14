//
//  UIView+Extension.swift
//  DashboardAPP
//
//  Created by SPURGE on 13/06/23.
//

import UIKit
@IBDesignable
class DesignableView: UIView {
}

@IBDesignable
class DesignableButton: UIButton {
}

@IBDesignable
class DesignableLabel: UILabel {
}

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }

    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
    
    // MARK: - Load form nib
    
    static var nib: UINib {
      return UINib(nibName: nibName, bundle: nibBundle)
    }
    static var nibName: String {
      return String(describing: self)
    }
    static var nibBundle: Bundle? {
      return Bundle(for: Self.self)
    }
    static func loadFromNib() -> Self {
      guard let view = nib.instantiate(
        withOwner: nil,
        options: nil
      ).first as? Self else {
         fatalError( "The nib \(nib) expected its root view to be of type \(self)"
         )
      }
      return view
    }
}

extension UILabel{
    func setFigFontReqular(size: CGFloat){
        self.font = UIFont(name: "Figtree-Regular", size: size)
    }
}


