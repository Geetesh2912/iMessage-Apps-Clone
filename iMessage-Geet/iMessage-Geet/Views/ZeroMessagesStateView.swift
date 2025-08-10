//  Created by Geetesh Mandaogade on 09/08/25.

import UIKit

class ZeroMessagesStateView: UIView {

    // MARK: - Properties

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont(
            name: "HelveticaNeue-Medium",
            size: SpacingConstants.spacingOneX + SpacingConstants.spacingQuarterX)
        label.text = NSLocalizedString("zero_state_title_no_messages", comment: "")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(
            ofSize: SpacingConstants.spacingOneX - (SpacingConstants.spacingQuarterX / 2))
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "bubble.fill")
        imageView.tintColor = .gray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()


    // MARK: - Overriden Methods

    public override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private helpers

    private func setupView() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)

        var constraints: [NSLayoutConstraint] = []
        constraints.append(titleLabel.topAnchor.constraint(
            equalTo: imageView.bottomAnchor,
            constant: SpacingConstants.spacingHalfX))
        constraints.append(subtitleLabel.topAnchor.constraint(
            equalTo: titleLabel.bottomAnchor,
            constant: SpacingConstants.spacingQuarterX))

        constraints.append(imageView.widthAnchor.constraint(
            equalToConstant: SpacingConstants.spacingOneAndHalfX + SpacingConstants.spacingTwoX))
        constraints.append(imageView.heightAnchor.constraint(equalToConstant: SpacingConstants.spacingThreeX))

        constraints.append(imageView.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor))
        constraints.append(titleLabel.centerXAnchor.constraint(equalTo: subtitleLabel.centerXAnchor))
        constraints.append(imageView.centerXAnchor.constraint(equalTo: centerXAnchor))

        constraints.append(imageView.leadingAnchor.constraint(
            greaterThanOrEqualTo: leadingAnchor,
            constant: SpacingConstants.spacingOneX))
        constraints.append(titleLabel.leadingAnchor.constraint(
            greaterThanOrEqualTo: leadingAnchor,
            constant: SpacingConstants.spacingOneX))
        constraints.append(subtitleLabel.leadingAnchor.constraint(
            greaterThanOrEqualTo: leadingAnchor,
            constant: SpacingConstants.spacingOneX))
        constraints.append(imageView.trailingAnchor.constraint(
            lessThanOrEqualTo: trailingAnchor,
            constant: -SpacingConstants.spacingOneX))
        constraints.append(titleLabel.trailingAnchor.constraint(
            lessThanOrEqualTo: trailingAnchor,
            constant: -SpacingConstants.spacingOneX))
        constraints.append(subtitleLabel.trailingAnchor.constraint(
            lessThanOrEqualTo: trailingAnchor,
            constant: -SpacingConstants.spacingOneX))
        NSLayoutConstraint.activate(constraints)
    }

    // MARK: - Public functions

    public func configure(categoryDescription: String) {
        subtitleLabel.text = categoryDescription
    }
}
