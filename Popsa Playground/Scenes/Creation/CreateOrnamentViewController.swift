//
//  CreateOrnamentViewController.swift
//  Popsa Playground
//
//  Created by Adam Regan on 16/05/2026.
//

import UIKit

class CreateOrnamentViewController: UIViewController {
    private var viewModel: CreateOrnamentViewModel

    init(viewModel: CreateOrnamentViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Make an Ornament"
        label.textColor = .black
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var finishOrnamentButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "Finish Ornament"
        config.baseBackgroundColor = .systemGreen
        config.baseForegroundColor = .white
        config.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12)
        config.cornerStyle = .small
        
        let button = UIButton(configuration: config, primaryAction: UIAction { [weak self] _ in
            self?.finishOrnamentTapped()
        })
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(titleLabel)
        view.addSubview(finishOrnamentButton)

        NSLayoutConstraint.activate(
            [
                titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                titleLabel.topAnchor
                    .constraint(
                        equalTo: view.safeAreaLayoutGuide.topAnchor
                    ),
                finishOrnamentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                finishOrnamentButton.topAnchor
                    .constraint(
                        equalTo: titleLabel.bottomAnchor, constant: 16
                    ),
            ]
        )
    }

    private func finishOrnamentTapped() {
        viewModel.finishOrnamentTapped()
    }
}

#Preview {
    CreateOrnamentViewController(viewModel: CreateOrnamentViewModel())
}
