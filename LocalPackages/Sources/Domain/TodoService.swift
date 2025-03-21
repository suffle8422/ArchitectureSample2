//
//  TodoService.swift
//  ArchitectureSample2
//
//  Created by ionishi on 2025/03/21.
//

import Foundation
import Core
import Infrastructure

actor TodoService: TodoServiceProtocol {
    private let todoRepository: any TodoRepositoryProtocol

    init(todoRepository: any TodoRepositoryProtocol) {
        self.todoRepository = todoRepository
    }

    func fetch() async -> [TodoDTO] {
        await todoRepository.fetch()
    }

    func insert(dto: TodoDTO) async {
        await todoRepository.insert(dto: dto)
    }

    func delete(id: UUID) async {
        await todoRepository.delete(id: id)
    }

    func update(dto: TodoDTO) async {
        await todoRepository.update(dto: dto)
    }
}
