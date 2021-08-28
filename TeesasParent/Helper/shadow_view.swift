//
//  shadow_view.swift
//  miniMealtimes
//
//  Created by Ayush Pathak on 14/11/19.
//  Copyright © 2019 Appentus Technologies Pvt. Ltd. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class shadow_view: UIView {

    @IBInspectable var image: UIImage? = nil {
        didSet {
            imageLayer.contents = image?.cgImage
            shadowLayer.shadowPath = (image == nil) ? nil : shapeAsPath }}
    
    var imageLayer: CALayer = CALayer()
    var shadowLayer: CALayer = CALayer()
    
    var shape: UIBezierPath {
        return UIBezierPath(roundedRect: bounds, cornerRadius:50) }
    
    var shapeAsPath: CGPath {
        return shape.cgPath }
    
    var shapeAsMask: CAShapeLayer {
        let s = CAShapeLayer()
        s.path = shapeAsPath
        return s }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        clipsToBounds = false
        backgroundColor = .clear
        
        self.layer.addSublayer(shadowLayer)
        self.layer.addSublayer(imageLayer) // (in that order)
        
        imageLayer.frame = bounds
        imageLayer.contentsGravity = .resizeAspectFill // (as preferred)
        
        imageLayer.mask = shapeAsMask
        shadowLayer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        shadowLayer.shadowPath = (image == nil) ? nil : shapeAsPath
        shadowLayer.shadowOpacity = 0.35 // etc ...
        shadowLayer.shadowRadius = 2.0
    }

}

class shadow_img: UIView {
    
    @IBInspectable var image: UIImage? = nil {
        didSet {
            imageLayer.contents = image?.cgImage
            shadowLayer.shadowPath = (image == nil) ? nil : shapeAsPath }}
    
    var imageLayer: CALayer = CALayer()
    var shadowLayer: CALayer = CALayer()
    @IBInspectable var cornr_radius : CGFloat = 0
    var shape: UIBezierPath {
        return UIBezierPath(roundedRect: bounds, cornerRadius:cornr_radius) }
    
    var shapeAsPath: CGPath {
        return shape.cgPath }
    
    var shapeAsMask: CAShapeLayer {
        let s = CAShapeLayer()
        s.path = shapeAsPath
        return s }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        clipsToBounds = false
        backgroundColor = .clear
        
        self.layer.addSublayer(shadowLayer)
        self.layer.addSublayer(imageLayer) // (in that order)
        
        imageLayer.frame = bounds
        imageLayer.contentsGravity = .resizeAspectFill // (as preferred)
        
        imageLayer.mask = shapeAsMask
        shadowLayer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        shadowLayer.shadowPath = (image == nil) ? nil : shapeAsPath
        shadowLayer.shadowOpacity = 0.35 // etc ...
        shadowLayer.shadowRadius = 2.0
    }
    
}
@IBDesignable
class shadow_uiview:UIView{
    @IBInspectable var colot: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = colot.cgColor
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
    @IBInspectable var shadowColor: UIColor? {
        set {
            layer.shadowColor = newValue!.cgColor
        }
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            else {
                return nil
            }
        }
    }
    
    
    /* The opacity of the shadow. Defaults to 0. Specifying a value outside the
     * [0,1] range will give undefined results. Animatable. */
    @IBInspectable var shadowOpacity: CGFloat {
        set {
            layer.shadowOpacity = Float(newValue)
        }
        get {
            return CGFloat(layer.shadowOpacity)
        }
    }
    
    /* The shadow offset. Defaults to (0, -3). Animatable. */
    @IBInspectable var shadowOffset: CGPoint {
        set {
            layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        }
        get {
            return CGPoint(x: layer.shadowOffset.width, y:layer.shadowOffset.height)
        }
    }
    
    /* The blur radius used to create the shadow. Defaults to 3. Animatable. */
    @IBInspectable var shadowRadius: CGFloat {
        set {
            layer.shadowRadius = newValue
        }
        get {
            return layer.shadowRadius
        }
    }
    
    
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
}

