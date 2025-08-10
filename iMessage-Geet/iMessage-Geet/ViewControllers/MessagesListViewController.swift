//  Created by Geetesh Mandaogade on 09/08/25.

import UIKit

class MessagesListViewController: UIViewController {

    // MARK: - Properties

    private let totalMessagesCount: Int
    private let categoryDescription: String

    private lazy var zeroMessagesStateView: ZeroMessagesStateView = {
        let view = ZeroMessagesStateView()
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - Initializer

    public init(title: String, totalMessagesCount: Int, categoryDescription: String) {
        self.totalMessagesCount = totalMessagesCount
        self.categoryDescription = categoryDescription

        super.init(nibName: nil, bundle: nil)
        self.title = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Overriden Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        stylizeView()
        setupViewHierarchy()
        setupViews()
        setupViewConstraints()
    }

    // MARK: - Private helpers

    private func stylizeView() {
        view.backgroundColor = .systemBackground
    }

    private func setupViewHierarchy() {
        view.addSubview(zeroMessagesStateView)
    }

    private func setupViews() {
        if totalMessagesCount == 0 {
            zeroMessagesStateView.isHidden = false
            zeroMessagesStateView.configure(categoryDescription: categoryDescription)
        }
    }

    private func setupViewConstraints() {
        var constraints: [NSLayoutConstraint] = []
        if totalMessagesCount == 0 {
            constraints.append(zeroMessagesStateView.centerYAnchor.constraint(equalTo: view.centerYAnchor))
            constraints.append(zeroMessagesStateView.centerXAnchor.constraint(equalTo: view.centerXAnchor))

            constraints.append(zeroMessagesStateView.topAnchor.constraint(greaterThanOrEqualTo: view.topAnchor))
            constraints.append(zeroMessagesStateView.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor))
            constraints.append(zeroMessagesStateView.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor))
            constraints.append(zeroMessagesStateView.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor))
        }
        NSLayoutConstraint.activate(constraints)
    }
}
