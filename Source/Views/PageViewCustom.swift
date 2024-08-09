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
    var customView: UIView
    init(customView: UIView, image: LightboxImage) {
        self.customView = customView
        super.init(image: image, frame: .zero)
        addSubview(self.customView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.customView.frame = bounds
    }
}
