//
//  CreationViewController.swift
//  Popsa Playground
//
//  Created by Adam Regan on 16/05/2026.
//

import UIKit

class CreationViewController: UIViewController {
    private var viewModel: CreationViewModel

    init(viewModel: CreationViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Creation Entry Point"
        label.textColor = .black
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private func makeOrnamentButton() -> UIButton {
        var config = UIButton.Configuration.filled()
        config.title = "Create Ornament"
        config.baseBackgroundColor = .systemGreen
        config.baseForegroundColor = .white
        config.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12)
        config.cornerStyle = .small
        return UIButton(configuration: config, primaryAction: UIAction { [weak self] _ in
            self?.createOrnamentTapped()
        })
    }

    private lazy var gridStack: UIStackView = {
        let rows = (0 ..< 3).map { _ -> UIStackView in
            let row = UIStackView(arrangedSubviews: [makeOrnamentButton(), makeOrnamentButton()])

            row.axis = .horizontal

            row.spacing = 8

            row.distribution = .fillEqually

            return row
        }

        let stack = UIStackView(arrangedSubviews: rows)
        stack.axis = .vertical
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false

        return stack

    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(titleLabel)
        view.addSubview(gridStack)

        NSLayoutConstraint.activate(
            [
                titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                titleLabel.topAnchor
                    .constraint(
                        equalTo: view.safeAreaLayoutGuide.topAnchor
                    ),
                gridStack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),

                gridStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),

                gridStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
            ]
        )
    }

    private func createOrnamentTapped() {
        viewModel.createOrnamentTapped()
    }
}

#Preview {
    CreationViewController(viewModel: CreationViewModel())
}
