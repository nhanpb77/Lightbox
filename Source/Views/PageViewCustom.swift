//
//  PageViewCustom.swift
//  Lightbox-iOS
//
//  Created by Nhân Phùng on 9/8/24.
//  Copyright © 2024 Hyper Interaktiv AS. All rights reserved.
//

import Foundation
import UIKit

class PageViewCustom: PageView {
    var contentView: UIView?
    init(contentView: UIView, image: LightboxImage) {
        self.contentView = contentView
        super.init(image: image, frame: .zero)
        if let _ = self.contentView {
            addSubview(self.contentView!)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let _ = contentView {
            self.contentView!.frame = bounds
        }
    }
    
    func updateCustomView(image: LightboxImage, contentView: UIView) {
        self.image = image
        if let _ = self.contentView {
            self.contentView!.removeFromSuperview()
        }
        self.contentView = contentView
        if let _ = self.contentView {
            addSubview(self.contentView!)
        }
    }
}
