//
//  ScrollableImageView.swift
//  ScrollableImageView
//
//  Created by Naohiro Hamada on 2017/04/29.
//  Copyright © 2017年 Naohiro Hamada. All rights reserved.
//

import UIKit

final public class ScrollableImageView: UIScrollView {
    
    fileprivate let imageView: UIImageView = UIImageView()
    
    public var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
            
            updateScale()
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        didLoad()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        didLoad()
    }
    
    private func didLoad() {
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        NSLayoutConstraint.activate([imageView.topAnchor.constraint(equalTo: topAnchor),
                                     imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
                                     imageView.leftAnchor.constraint(equalTo: leftAnchor),
                                     imageView.rightAnchor.constraint(equalTo: rightAnchor)])
        
        delegate = self
    }
    
    private func updateScale() {
        guard let image = imageView.image else {
            fatalError("`updateScale` must be called after image is given.")
        }
        if image.size.width < image.size.height {
            updateScale(bounds.height / image.size.height)
        } else {
            updateScale(bounds.width / image.size.width)
        }
        
        zoom(to: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height), animated: false)
    }
    
    private func updateScale(_ baseScale: CGFloat) {
        minimumZoomScale = baseScale
        maximumZoomScale = baseScale * 4.0
    }
}

extension ScrollableImageView: UIScrollViewDelegate {
    public func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
