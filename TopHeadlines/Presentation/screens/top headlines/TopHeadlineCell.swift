//
//  TopHeadlineCell.swift
//  TopHeadlines
//
//  Created by waheedCodes on 20/08/2022.
//

import UIKit
import Kingfisher

class TopHeadlineCell: UITableViewCell {

    private let radius: CGFloat = 8
    private lazy var placeholderImage = UIImage(named: "noHeadlineThumbnail")

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var backdropImageView: UIImageView!
    @IBOutlet weak var visualEffectView: UIVisualEffectView!

    override func awakeFromNib() {
        super.awakeFromNib()
        decorateView()
    }

    private func decorateView() {
        backgroundView = UIView()
        backgroundView?.backgroundColor = .systemBackground

        selectedBackgroundView = UIView()
        selectedBackgroundView?.backgroundColor = .secondarySystemBackground

        titleLabel.textColor = .systemGray6
        authorLabel.textColor = .systemGray6
        decorateBackdropImageView()
        decorateVisualEffectView()
    }

    private func decorateBackdropImageView() {
        backdropImageView.backgroundColor = .tertiarySystemBackground
        backdropImageView.layer.cornerRadius = radius
        backdropImageView.layer.masksToBounds = true
    }

    private func decorateVisualEffectView() {
        visualEffectView.layer.cornerRadius = radius
        visualEffectView.layer.masksToBounds = true
    }

    // MARK: - Configure cell

    func configure(with headline: TopHeadlineItem) {
        titleLabel.text = headline.title
        authorLabel.text = headline.author
        self.handleBackdropImageFetch(with: headline.imageURL)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.resetUIElements()
    }

    private func resetUIElements() {
        titleLabel.text = nil
        authorLabel.text = nil

        backdropImageView.kf.cancelDownloadTask()
        backdropImageView.image = nil
    }

    private func handleBackdropImageFetch(with imageURL: URL?) {
        let options: KingfisherOptionsInfo = [
            .transition(.fade(0.5))
        ]

        if let imageURL = imageURL  {
            self.backdropImageView
                .kf.setImage(
                    with: imageURL,
                    placeholder: placeholderImage,
                    options: options)
        } else {
            self.backdropImageView.image = placeholderImage
        }
    }
}
