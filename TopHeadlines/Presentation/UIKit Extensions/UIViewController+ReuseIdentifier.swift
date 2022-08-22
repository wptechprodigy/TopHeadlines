//
//  UIViewController+ReuseIdentifier.swift
//  TopHeadlines
//
//  Created by waheedCodes on 21/08/2022.
//

import UIKit

extension UIViewController {

    // MARK: - ReuseIdentifier

    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
