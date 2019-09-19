//
//  SystemColorsViewController.swift
//  DynamicColor
//
//  Created by Cirno MainasuK on 2019-9-19.
//  Copyright © 2019 MainasuK. All rights reserved.
//

import UIKit

final class SystemColorsViewController: UIViewController {

    enum Section: CaseIterable {
        case color
        case gray
        case background
        case groupedBackground
        case label
        case fill
        case separator
    }

    let collectionViewLayout: UICollectionViewCompositionalLayout = {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(80))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)

        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)

        return layout
    }()

    private(set) lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: collectionViewLayout)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        collectionView.alwaysBounceVertical = true
        collectionView.register(SystemColorCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: SystemColorCollectionViewCell.self))
        return collectionView
    }()

    lazy var dataSource: UICollectionViewDiffableDataSource = UICollectionViewDiffableDataSource<Section, SystemColorViewModel>(collectionView: collectionView, cellProvider: { collectionView, indexPath, viewModel -> UICollectionViewCell? in
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: SystemColorCollectionViewCell.self), for: indexPath) as! SystemColorCollectionViewCell
        cell.overrideUserInterfaceStyle = viewModel.style
        cell.contentView.backgroundColor = viewModel.backgroundColor
        cell.titleLabel.text = [viewModel.name, viewModel.style == .light ? "Light" : "Dark"].joined(separator: " - ")
        cell.titleLabel.textColor = viewModel.textColor
        return cell
    })

}

extension SystemColorsViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Color Sheet"

        view.addSubview(collectionView)
        collectionView.dataSource = dataSource

        var snapshot = NSDiffableDataSourceSnapshot<Section, SystemColorViewModel>()

        snapshot.appendSections([.color])
        let colors: [UIColor] = [.systemRed, .systemOrange, .systemYellow, .systemGreen, .systemTeal, .systemBlue, .systemIndigo, .systemPurple, .systemPink]
        let colorItems = colors.flatMap { [SystemColorViewModel(color: $0, style: .light), SystemColorViewModel(color: $0, style: .dark)] }
        snapshot.appendItems(colorItems)

        snapshot.appendSections([.gray])
        let grays: [UIColor] = [.systemGray, .systemGray2, .systemGray3, .systemGray4, .systemGray5, .systemGray6]
        let grayItems = grays.flatMap { [SystemColorViewModel(color: $0, style: .light), SystemColorViewModel(color: $0, style: .dark)] }
        snapshot.appendItems(grayItems)


        snapshot.appendSections([.background])
        let backgrounds: [UIColor] = [.systemBackground, .secondarySystemBackground, .tertiarySystemBackground]
        let backgroundItems = backgrounds.flatMap { [SystemColorViewModel(color: $0, style: .light), SystemColorViewModel(color: $0, style: .dark)] }
        snapshot.appendItems(backgroundItems)

        snapshot.appendSections([.groupedBackground])
        let groupedBackgrounds: [UIColor] = [.systemGroupedBackground, .secondarySystemGroupedBackground, .tertiarySystemGroupedBackground]
        let groupedBackgroundItems = groupedBackgrounds.flatMap { [SystemColorViewModel(color: $0, style: .light), SystemColorViewModel(color: $0, style: .dark)] }
        snapshot.appendItems(groupedBackgroundItems)

        snapshot.appendSections([.label])
        let lables: [UIColor] = [.label, .secondaryLabel, .tertiaryLabel, .quaternaryLabel]
        let labelItems = lables.flatMap { [SystemColorViewModel(color: $0, style: .light), SystemColorViewModel(color: $0, style: .dark)] }
        snapshot.appendItems(labelItems)

        snapshot.appendSections([.fill])
        let fills: [UIColor] = [.systemFill, .secondarySystemFill, .tertiarySystemFill, .quaternarySystemFill]
        let fillItems = fills.flatMap { [SystemColorViewModel(color: $0, style: .light), SystemColorViewModel(color: $0, style: .dark)] }
        snapshot.appendItems(fillItems)

        snapshot.appendSections([.separator])
        let separators: [UIColor] = [.separator, .opaqueSeparator]
        let separatorItems = separators.flatMap { [SystemColorViewModel(color: $0, style: .light), SystemColorViewModel(color: $0, style: .dark)] }
        snapshot.appendItems(separatorItems)

        dataSource.apply(snapshot)
    }

}

struct SystemColorViewModel: Identifiable, Hashable {
    let id: Int
    let name: String
    let backgroundColor: UIColor
    let textColor: UIColor
    let style: UIUserInterfaceStyle

    init(color: UIColor, style: UIUserInterfaceStyle) {
        self.id = color.hash
        self.backgroundColor = color
        self.style = style
        let name: String = {
            guard NSStringFromClass(type(of: color)) == "UIDynamicSystemColor",
            let isDynamic = color.value(forKey: "_isDynamic") as? Bool, isDynamic,
            let systemColorName = color.value(forKey: "systemColorName") as? String else {
                return "Custom"
            }

            return systemColorName
        }()
        self.name = name
        self.textColor = {
            if name.contains("systemGray") {
                return style == .light ? .black : .white
            } else if name.contains("Background") {
                return style == .light ? .black : .white
            } else if name.lowercased().contains("label") {
                return style == .light ? .white: .black
            } else if name.contains("Fill") {
                return .black
            } else if name.lowercased().contains("separator") {
                return style == .light ? .black : .white
            } else {
                return .white
            }
        }()
    }

}

final class SystemColorCollectionViewCell: UICollectionViewCell {

    let titleLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        _init()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        _init()
    }

    private func _init() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
        ])

        titleLabel.numberOfLines = 0
    }

}
