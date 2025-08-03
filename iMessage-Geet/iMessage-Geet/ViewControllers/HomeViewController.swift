//  Created by Geetesh Mandaogade on 15/06/25.

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Properties

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRectZero, style: .insetGrouped)
        tableView.separatorStyle = .singleLine
        tableView.backgroundColor = .systemGroupedBackground
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupViewHierarchy()
    }

    // MARK: - Private Helpers

    private func setupViews() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        title = NSLocalizedString("messages_header", comment: "")

        tableView.register(MessageCategoryCell.self, forCellReuseIdentifier: MessageCategoryCell.reuseIdentifier)
        view.addSubview(tableView)
    }

    private func setupViewHierarchy() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension HomeViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return MessageCategoriesMock.sections[section].title
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return MessageCategoriesMock.sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MessageCategoriesMock.sections[section].categories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let messageCategory = MessageCategoriesMock.sections[indexPath.section].categories[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MessageCategoryCell.reuseIdentifier, for: indexPath) as? MessageCategoryCell else {
            return UITableViewCell()
        }

        cell.configure(
            icon: UIImage(systemName: messageCategory.iconName),
            title: messageCategory.title,
            unreadMessagesCount: messageCategory.unreadCount)
        return cell
    }
}
