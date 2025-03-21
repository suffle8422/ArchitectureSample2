//
//  TodoDTO.swift
//  ArchitectureSample
//
//  Created by ionishi on 2024/12/03.
//

import Foundation

/// SwiftDataの永続化ModelであるTodoModelの情報ををRepository外で扱うためのDTO
package struct TodoDTO: Sendable, Hashable {
    package let id: UUID
    package let title: String
    package let detail: String
    package let isFinish: Bool

    package init(id: UUID, title: String, detail: String, isFinish: Bool) {
        self.id = id
        self.title = title
        self.detail = detail
        self.isFinish = isFinish
    }
}
