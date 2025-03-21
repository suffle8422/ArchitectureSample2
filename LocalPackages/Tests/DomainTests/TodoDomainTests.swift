//
//  TodoDomainTests.swift
//  ArchitectureSample2
//
//  Created by ionishi on 2025/03/21.
//

import Foundation
import Testing
@testable import Core
@testable import Infrastructure
@testable import Domain

actor TodoServiceTests {
    private let todoRepository = TodoRepository(modelContainer: ModelContainerManagerForTests().modelContainer)
    private let todoService: any TodoServiceProtocol

    init() {
        todoService = TodoService(todoRepository: todoRepository)
    }

    deinit {}

    @Test
    func fetch() async {
        await todoService.setTestTodos()
        let fetchedTodos = await todoService.fetch()
        #expect(fetchedTodos.count == 10)
    }

    @Test
    func insert() async {
        let todosBeforeInserting = await todoService.fetch()
        #expect(todosBeforeInserting.count == 0)

        let todo = TodoDTO(
            id: UUID(),
            title: "タイトル1",
            detail: "詳細1",
            isFinish: false
        )
        await todoService.insert(dto: todo)

        let todosAfterInserting = await todoService.fetch()
        #expect(todosAfterInserting.count == 1)
    }

    @Test
    func update() async throws {
        let id = UUID()
        let todo1 = TodoDTO(
            id: id,
            title: "タイトル1",
            detail: "詳細1",
            isFinish: false
        )
        await todoService.insert(dto: todo1)

        let todosBeforeUpdating = await todoService.fetch()
        #expect(todosBeforeUpdating.count == 1)

        let todo2 = TodoDTO(
            id: id,
            title: "タイトル2",
            detail: "詳細2",
            isFinish: false
        )
        await todoService.update(dto: todo2)

        let todosAfterUpdating = await todoService.fetch()
        #expect(todosAfterUpdating.count == 1, "update後もTODOが1件")

        let targetTodo = try #require(todosAfterUpdating.first)
        #expect(targetTodo.title == "タイトル2", "タイトルが更新されている")
        #expect(targetTodo.detail == "詳細2", "詳細が更新されている")
    }

    @Test
    func delete() async {
        let id = UUID()
        let todo = TodoDTO(
            id: id,
            title: "タイトル1",
            detail: "詳細1",
            isFinish: false
        )
        await todoService.insert(dto: todo)

        let todosBeforeDeleting = await todoService.fetch()
        #expect(todosBeforeDeleting.count == 1, "delete前はTODOが1件")

        await todoService.delete(id: id)

        let todosAfterDeleting = await todoService.fetch()
        #expect(todosAfterDeleting.count == 0, "delete後はTODOが0件")
    }
}

private extension TodoServiceProtocol {
    func setTestTodos() async {
        for index in 1...10 {
            let todo = TodoDTO(
                id: UUID(),
                title: "タイトル\(index)",
                detail: "詳細\(index)",
                isFinish: false
            )
            await insert(dto: todo)
        }
    }
}
