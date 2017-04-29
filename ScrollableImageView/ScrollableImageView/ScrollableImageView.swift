//
//  ScrollableImageView.swift
//  ScrollableImageView
//
//  Created by Naohiro Hamada on 2017/04/29.
//  Copyright © 2017年 Naohiro Hamada. All rights reserved.
//

/*
 * 参考
 * https://www.raywenderlich.com/122139/uiscrollview-tutorial
 * http://qiita.com/shift_option_k/items/eea52a662ae64258fb6f
 */


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
    
    private var imageViewConstraint: (top: NSLayoutConstraint, bottom: NSLayoutConstraint, left: NSLayoutConstraint, right: NSLayoutConstraint)! = nil
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        didLoad()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        didLoad()
    }
    
    private func didLoad() {
        translatesAutoresizingMaskIntoConstraints = false
        contentMode = .center
        
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        imageViewConstraint = (imageView.topAnchor.constraint(equalTo: topAnchor),
                               imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
                               imageView.leftAnchor.constraint(equalTo: leftAnchor),
                               imageView.rightAnchor.constraint(equalTo: rightAnchor))
        NSLayoutConstraint.activate([imageViewConstraint.top,
                                     imageViewConstraint.bottom,
                                     imageViewConstraint.left,
                                     imageViewConstraint.right,])
        
        bouncesZoom = true
        
        delegate = self
    }
    
    // MARK:- ImageViewに画像をセットした後に、最小と最大のズーム倍率の更新処理
    private func updateScale() {
        guard let image = imageView.image else {
            fatalError("`updateScale` must be called after image is given.")
        }
        
        // 画像とself.boundsとの比率から最小の比率をとる
        // aspectFit的に見せるため
        let widthScale = bounds.width / image.size.width
        let heightScale = bounds.height / image.size.height
        let minScale = min(widthScale, heightScale)
        minimumZoomScale = minScale
        maximumZoomScale = minScale * 4
        zoomScale = minScale
    }
    
    // MARK:- ImageViewのAutoLayout制約の更新処理
    fileprivate func updateConstraints(with size: CGSize) {
        let offset: (x: CGFloat, y: CGFloat) = (frameOriginOffsetForX(size.width),
                                                frameOriginOffsetForY(size.height))
        imageViewConstraint.left.constant = offset.x
        imageViewConstraint.right.constant = offset.x
        imageViewConstraint.top.constant = offset.y
        imageViewConstraint.bottom.constant = offset.y
        
        layoutIfNeeded()
    }
    
    private func frameOriginOffsetForX(_ targetWidth: CGFloat) -> CGFloat {
        guard let image = imageView.image else {
            fatalError("Image is nil.")
        }
        return max(0, (targetWidth - image.size.width * zoomScale) / 2)
    }
    
    private func frameOriginOffsetForY(_ targetHeight: CGFloat) -> CGFloat {
        guard let image = imageView.image else {
            fatalError("Image is nil.")
        }
        return max(0, (targetHeight - image.size.height * zoomScale) / 2)
    }
}

extension ScrollableImageView: UIScrollViewDelegate {
    public func scrollViewDidZoom(_ scrollView: UIScrollView) {
        updateConstraints(with: scrollView.bounds.size)
    }
    
    public func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
