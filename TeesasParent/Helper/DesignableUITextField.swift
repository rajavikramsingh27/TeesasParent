//
//  File.swift
//  miniMealtimes
//
//  Created by Ayush Pathak on 14/11/19.
//  Copyright © 2019 Appentus Technologies Pvt. Ltd. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class DesignableUITextField: UITextField {
    
    // Provides left padding for images
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += leftPadding
        return textRect
    }
    
    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var right_img: UIImage? {
        didSet {
            updateView_right()
        }
    }
    @IBInspectable var leftPadding: CGFloat = 0
    @IBInspectable var color: UIColor = UIColor.lightGray {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        if let image = leftImage {
            leftViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: -5, width: 30, height: 30))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
            imageView.tintColor = color
            
            let view = UIView()
            view.addSubview(imageView)
            view.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
            leftView = view
            
        } else {
            leftViewMode = UITextField.ViewMode.never
            leftView = nil
        }
        
        // Placeholder text color
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: color])
    }
    
    
    @IBInspectable var cornerRadius: CGFloat = 0
    @IBInspectable var fillColor: UIColor = UIColor.lightGray
    @IBInspectable var shadow_opacity: CGFloat = 0.35
    @IBInspectable var shadow_radius: CGFloat = 2.0
    let containerView = UIView()

    private var shadowLayer: CAShapeLayer!

    override func layoutSubviews() {
        super.layoutSubviews()
        
        if shadowLayer == nil {
            if shadow_radius != 0{
                shadowLayer = CAShapeLayer()
                
                shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
                shadowLayer.fillColor = UIColor.white.cgColor
                
                shadowLayer.shadowColor = fillColor.cgColor
                shadowLayer.shadowPath = shadowLayer.path
                shadowLayer.shadowOffset = CGSize(width: 0.0, height: 3.0)
                shadowLayer.shadowOpacity = Float(shadow_opacity)
                shadowLayer.shadowRadius = shadow_radius
                
                layer.insertSublayer(shadowLayer, at: 0)
                
            }
           
            
        }
        
    }
    
    func addShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
        
    }
    @IBInspectable var border_colot: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = border_colot.cgColor
        }
    }
    @IBInspectable var border_width: CGFloat = 0{
        didSet{
            self.layer.borderWidth = border_width
        }
    }
    @IBInspectable var corner_radius: CGFloat = 0{
        didSet{
            self.layer.cornerRadius = corner_radius
            self.layer.masksToBounds = true
        }
    }
    
    @IBInspectable var padding_left_text: CGFloat = 0.0
    @IBInspectable var padding_right_text: CGFloat = 0.0

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: padding_left_text, bottom: 0, right: padding_right_text))
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: padding_left_text, bottom: 0, right: padding_right_text))
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: padding_left_text, bottom: 0, right: padding_right_text))
    }
    
    @IBInspectable var placeholder_colot : UIColor = .black{
        didSet{
            self.attributedPlaceholder = NSAttributedString(string: placeholder ?? "",
                                                                   attributes: [NSAttributedString.Key.foregroundColor: placeholder_colot])
        }
    }
    
    
    @IBInspectable var right_padding: CGFloat = 0

    //Padding images on Right
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.rightViewRect(forBounds: bounds)
        textRect.origin.x -= right_padding
        return textRect
    }
    func updateView_right(){
        rightViewMode = UITextField.ViewMode.never
        rightView = nil
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: -10, y: 0, width: 20, height: 20)
        
        button.setImage(right_img, for: .normal)
        
        button.setTitleColor(UIColor.clear, for: .normal)
        
        rightViewMode = UITextField.ViewMode.always
        let view = UIView()
                   view.addSubview(button)
                   view.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
                   rightView = view
    }
    
   
}

extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
