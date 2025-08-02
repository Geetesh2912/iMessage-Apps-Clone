//  Created by Geetesh Mandaogade on 02/08/25.

import Foundation
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
        return arrowImageView
    }()

    private lazy var unreadMessagesLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
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

    func configureView(with iconImage: UIImage,
                       title: String,
                       unreadMessagesCount: Int?) {
        iconImageView.image = iconImage
        titleLabel.text = title
        if let unreadMessagesCount {
            unreadMessagesLabel.text = String(unreadMessagesCount)
        }
    }

    // MARK: - Private Helpers

    private func setupViewConstraints() {
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 30),
            iconImageView.heightAnchor.constraint(equalToConstant: 20),

            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 12),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),

            unreadMessagesLabel.leadingAnchor.constraint(greaterThanOrEqualTo: titleLabel.trailingAnchor, constant: 8),
            unreadMessagesLabel.trailingAnchor.constraint(equalTo: arrowImageView.leadingAnchor, constant: -8),
            unreadMessagesLabel.centerYAnchor.constraint(equalTo: centerYAnchor),

            arrowImageView.leadingAnchor.constraint(equalTo: unreadMessagesLabel.trailingAnchor, constant: 8),
            arrowImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            arrowImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            arrowImageView.widthAnchor.constraint(equalToConstant: 10),
            arrowImageView.heightAnchor.constraint(equalToConstant: 20),

        ])
    }

    private func setupViewHierarchy() {
        addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(unreadMessagesLabel)
        addSubview(arrowImageView)
    }
}
