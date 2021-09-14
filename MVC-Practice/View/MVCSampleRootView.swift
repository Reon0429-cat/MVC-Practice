//
//  MVCSampleRootView.swift
//  MVC-Practice
//
//  Created by 大西玲音 on 2021/09/15.
//

import UIKit

// 役割
// 画面の構築と表示
final class MVCSampleRootView: UIView {
    
    @IBOutlet private weak var starButton: UIButton!
    @IBOutlet private weak var navigationButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
    }
    
    private func loadNib() {
        guard let view = UINib(nibName: String(describing: type(of: self)), bundle: nil).instantiate(withOwner: self, options: nil).first as? UIView else {
            return
        }
        view.frame = self.bounds
        self.addSubview(view)
    }
    
}
