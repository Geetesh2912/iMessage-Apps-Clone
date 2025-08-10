//  Created by Geetesh Mandaogade on 02/08/25.

import UIKit

class MessageCategoryView: UIView {

    // MARK: - Properties

    private lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        return iconImageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var arrowImageView: UIImageView = {
        let arrowImageView = UIImageView()
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        arrowImageView.image = UIImage(systemName: "greaterthan")
        arrowImageView.tintColor = .gray
        return arrowImageView
    }()

    private lazy var unreadMessagesLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Initializer

    public init() {
        super.init(frame: CGRectZero)

        setupViewHierarchy()
        setupViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public APIs

    func configureView(with iconImage: UIImage?,
                       title: String,
                       unreadMessagesCount: Int?) {
        if let iconImage {
            iconImageView.image = iconImage
        }

        if let unreadMessagesCount {
            unreadMessagesLabel.text = String(unreadMessagesCount)
        }

        titleLabel.text = title
    }

    // MARK: - Private Helpers

    private func setupViewConstraints() {
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: SpacingConstants.spacingOneX),
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageView.widthAnchor.constraint(
                equalToConstant: SpacingConstants.spacingOneX + SpacingConstants.spacingQuarterX),
            iconImageView.heightAnchor.constraint(
                equalToConstant: SpacingConstants.spacingOneX + SpacingConstants.spacingQuarterX),

            titleLabel.leadingAnchor.constraint(
                equalTo: iconImageView.trailingAnchor,
                constant: SpacingConstants.spacingOneX - SpacingConstants.spacingQuarterX),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),

            unreadMessagesLabel.leadingAnchor.constraint(
                greaterThanOrEqualTo: titleLabel.trailingAnchor,
                constant: SpacingConstants.spacingHalfX),
            unreadMessagesLabel.trailingAnchor.constraint(
                equalTo: arrowImageView.leadingAnchor,
                constant: -SpacingConstants.spacingHalfX),
            unreadMessagesLabel.centerYAnchor.constraint(equalTo: centerYAnchor),

            arrowImageView.leadingAnchor.constraint(
                equalTo: unreadMessagesLabel.trailingAnchor,
                constant: SpacingConstants.spacingHalfX),
            arrowImageView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: SpacingConstants.spacingQuarterX - SpacingConstants.spacingOneAndHalfX),
            arrowImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            arrowImageView.widthAnchor.constraint(
                equalToConstant: SpacingConstants.spacingHalfX + (SpacingConstants.spacingQuarterX/2)),
            arrowImageView.heightAnchor.constraint(
                equalToConstant: SpacingConstants.spacingOneX + SpacingConstants.spacingQuarterX),
        ])
    }

    private func setupViewHierarchy() {
        addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(unreadMessagesLabel)
        addSubview(arrowImageView)
    }
}
