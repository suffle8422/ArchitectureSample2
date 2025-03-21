//
//  TodoRepositoryProtocol.swift
//  ArchitectureSample2
//
//  Created by ionishi on 2025/03/21.
//

import Foundation

package protocol TodoRepositoryProtocol: Actor {
    func fetch() async -> [TodoDTO]
    func insert(dto: TodoDTO) async
    func delete(id: UUID) async
    func update(dto: TodoDTO) async
}
