//
//  UIFont.swift
//  FluentInDesignPatterns
//
//  Created by Sergey on 6/6/21.
//

import UIKit

extension UIFont {
    
    func rounded() -> UIFont {
        guard let descriptor = fontDescriptor.withDesign(.rounded) else {
            return self
        }

        return UIFont(descriptor: descriptor, size: pointSize)
    }
}
