//
//  Fonts.swift
//  expensesApp
//
//  Created by Lautaro Pinto on 24/06/2021.
//

import UIKit

internal extension UIFont {
    @nonobjc class var worksansRegular: UIFont {
        guard let customFont = UIFont(name: "WorkSans-Regular", size: UIFont.labelFontSize) else {
            return UIFont.systemFont(ofSize: UIFont.labelFontSize)
        }
        
        return customFont
    }
    
    @nonobjc class var worksansItalic: UIFont {
        guard let customFont = UIFont(name: "WorkSans-Italic", size: UIFont.labelFontSize) else {
            return UIFont.systemFont(ofSize: UIFont.labelFontSize)
        }
        
        return customFont
    }
    
    @nonobjc class var worksansMedium: UIFont {
        guard let customFont = UIFont(name: "WorkSans-Regular_Medium", size: UIFont.labelFontSize) else {
            return UIFont.systemFont(ofSize: UIFont.labelFontSize)
        }
        
        return customFont
    }
    
    @nonobjc class var worksansSemibold: UIFont {
        guard let customFont = UIFont(name: "WorkSans-Regular_SemiBold", size: UIFont.labelFontSize) else {
            return UIFont.systemFont(ofSize: UIFont.labelFontSize)
        }
        
        return customFont
    }
    
    @nonobjc class var worksansBold: UIFont {
        guard let customFont = UIFont(name: "WorkSans-Regular_Bold", size: UIFont.labelFontSize) else {
            return UIFont.systemFont(ofSize: UIFont.labelFontSize)
        }
        
        return customFont
    }

    
}
