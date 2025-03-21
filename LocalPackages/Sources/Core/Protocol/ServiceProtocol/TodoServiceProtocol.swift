//
//  TodoServiceProtocol.swift
//  ArchitectureSample2
//
//  Created by ionishi on 2025/03/21.
//

import Foundation

package protocol TodoServiceProtocol: Actor {
    func fetch() async -> [TodoDTO]
    func insert(dto: TodoDTO) async
    func delete(id: UUID) async
    func update(dto: TodoDTO) async
}

package actor MockTodoService: TodoServiceProtocol {
    private var todoStack = [TodoDTO]()

    package init() {}

    package func fetch() async -> [TodoDTO] {
        debugPrint("TodoService fetch")
        return todoStack
    }

    package func insert(dto: TodoDTO) async {
        todoStack.append(dto)
    }

    package func delete(id: UUID) async {
        todoStack = todoStack.filter { $0.id != id }
    }

    package func update(dto: TodoDTO) async {
        guard let index = todoStack.firstIndex(where: { $0.id == dto.id }) else { return }
        todoStack[index] = dto
    }
}
