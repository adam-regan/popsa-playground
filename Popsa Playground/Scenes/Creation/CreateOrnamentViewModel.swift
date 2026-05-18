//
//  CreateOrnamentViewModel.swift
//  Popsa Playground
//
//  Created by Adam Regan on 16/05/2026.
//

protocol CreateOrnamentViewModelDelegate: AnyObject {
    func viewModelItemCreated()
}

final class CreateOrnamentViewModel {
    weak var coordinator: CreateOrnamentViewModelDelegate?

    func finishOrnamentTapped() {
        coordinator?.viewModelItemCreated()
    }
}
