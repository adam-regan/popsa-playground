//
//  CreationViewModel.swift
//  Popsa Playground
//
//  Created by Adam Regan on 16/05/2026.
//

protocol CreationViewModelDelegate: AnyObject {
    func viewModelCreateOrnamentDidTap()
}

final class CreationViewModel {
    weak var coordinator: CreationViewModelDelegate?

    func createOrnamentTapped() {
        coordinator?.viewModelCreateOrnamentDidTap()
    }
}
