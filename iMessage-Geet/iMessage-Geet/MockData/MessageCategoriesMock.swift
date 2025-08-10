//  Created by Geetesh Mandaogade on 03/08/25.

import UIKit

enum MessageCategoryType: Int {
    case allMessages
    case knownSenders
    case unknownSenders
    case unread

    case allTransactions
    case finance
    case orders
    case reminders
    case promotions

    case junk
    case recentlyDeleted
}

struct MessageCategory {
    let type: MessageCategoryType
    let title: String
    let iconName: String
    let unreadCount: Int?
    let totalMessagesCount: Int
    let categoryDescription: String
}

struct MessageSection {
    let title: String?
    let categories: [MessageCategory]
}

class MessageCategoriesMock {

    static let categories: [MessageCategory] = [
        MessageCategory(type: .allMessages,
                        title: NSLocalizedString("all_messages_title", comment: ""),
                        iconName: "bubble",
                        unreadCount: 7,
                        totalMessagesCount: 0,
                        categoryDescription: NSLocalizedString("zero_state_subtitle_all_messages", comment: "")),

        MessageCategory(type: .knownSenders,
                        title: NSLocalizedString("known_senders_title", comment: ""),
                        iconName: "person.circle",
                        unreadCount: 1,
                        totalMessagesCount: 0,
                        categoryDescription: NSLocalizedString("zero_state_subtitle_known_senders", comment: "")),

        MessageCategory(type: .unknownSenders,
                        title: NSLocalizedString("unknown_senders_title", comment: ""),
                        iconName: "person.crop.circle.badge.questionmark",
                        unreadCount: 7,
                        totalMessagesCount: 0,
                        categoryDescription: NSLocalizedString("zero_state_subtitle_unknown_senders", comment: "")),

        MessageCategory(type: .unread,
                        title: NSLocalizedString("unread_messages_title", comment: ""),
                        iconName: "exclamationmark.bubble",
                        unreadCount: 3,
                        totalMessagesCount: 0,
                        categoryDescription: NSLocalizedString("zero_state_subtitle_unread_messages", comment: "")),

        MessageCategory(type: .allTransactions,
                        title: NSLocalizedString("all_transactions_title", comment: ""),
                        iconName: "arrow.left.arrow.right",
                        unreadCount: 4,
                        totalMessagesCount: 0,
                        categoryDescription: NSLocalizedString("zero_state_subtitle_all_transactions", comment: "")),

        MessageCategory(type: .finance,
                        title: NSLocalizedString("finance_title", comment: ""),
                        iconName: "creditcard",
                        unreadCount: 1,
                        totalMessagesCount: 0,
                        categoryDescription: NSLocalizedString("zero_state_subtitle_finance", comment: "")),

        MessageCategory(type: .orders,
                        title: NSLocalizedString("orders_title", comment: ""),
                        iconName: "shippingbox",
                        unreadCount: 3,
                        totalMessagesCount: 0,
                        categoryDescription: NSLocalizedString("zero_state_subtitle_orders", comment: "")),

        MessageCategory(type: .reminders,
                        title: NSLocalizedString("reminders_title", comment: ""),
                        iconName: "calendar.badge.clock",
                        unreadCount: 4,
                        totalMessagesCount: 0,
                        categoryDescription: NSLocalizedString("zero_state_subtitle_reminders", comment: "")),

        MessageCategory(type: .promotions,
                        title: NSLocalizedString("promotions_title", comment: ""),
                        iconName: "megaphone",
                        unreadCount: 4,
                        totalMessagesCount: 0,
                        categoryDescription: NSLocalizedString("zero_state_subtitle_promotions", comment: "")),

        MessageCategory(type: .junk,
                        title: NSLocalizedString("junk_title", comment: ""),
                        iconName: "xmark.bin",
                        unreadCount: 4,
                        totalMessagesCount: 0,
                        categoryDescription: NSLocalizedString("zero_state_subtitle_junk", comment: "")),

        MessageCategory(type: .recentlyDeleted,
                        title: NSLocalizedString("recently_deleted_title", comment: ""),
                        iconName: "trash",
                        unreadCount: 4,
                        totalMessagesCount: 0,
                        categoryDescription: NSLocalizedString("zero_state_subtitle_deleted", comment: "")),
    ]

    static let sections: [MessageSection] = [
        MessageSection(title: nil, categories: [
             categories[0],
             categories[1],
             categories[2],
             categories[3]
        ]),
        MessageSection(title: NSLocalizedString("filtered_by_sms_filter_header", comment: ""), categories: [
            categories[4],
            categories[5],
            categories[6],
            categories[7],
            categories[8],
        ]),
        MessageSection(title: nil, categories: [
            categories[9],
            categories[10],
        ]),
    ]
}
