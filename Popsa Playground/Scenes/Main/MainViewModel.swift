//
//  MainViewModel.swift
//  Popsa Playground
//
//  Created by Adam Regan on 16/05/2026.
//

protocol MainViewModelDelegate: AnyObject {}

final class MainViewModel {
    weak var coordinator: MainViewModelDelegate?

}
