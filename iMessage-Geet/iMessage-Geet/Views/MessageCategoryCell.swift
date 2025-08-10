//  Created by Geetesh Mandaogade on 02/08/25.

import UIKit

class MessageCategoryCell: UITableViewCell {

    // MARK: - Properties

    static let reuseIdentifier = "MessageCategoryCell"
    private lazy var messageCategoryView = MessageCategoryView()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Helpers

    private func setupView() {
        contentView.addSubview(messageCategoryView)
        messageCategoryView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            messageCategoryView.topAnchor.constraint(equalTo: contentView.topAnchor),
            messageCategoryView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            messageCategoryView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            messageCategoryView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }

    // MARK: - Public API

    func configure(icon: UIImage?,
                   title: String,
                   unreadMessagesCount: Int?) {
        messageCategoryView.configureView(
            with: icon,
            title: title,
            unreadMessagesCount: unreadMessagesCount)
    }
}
