//
//  UITableViewCell+Dequeue.swift
//  TopHeadlines
//
//  Created by waheedCodes on 20/08/2022.
//

import UIKit

extension UITableView {

    func dequeue<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        let cell = dequeueReusableCell(
            withIdentifier: T.reuseIdentifier,
            for: indexPath
        )

        return cell as! T
    }
}
