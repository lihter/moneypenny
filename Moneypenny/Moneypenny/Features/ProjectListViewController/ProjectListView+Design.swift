import UIKit
import SnapKit

extension ProjectListView: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }

    func createViews() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: makeCollectionViewLayout())
        collectionView.register(
            SmallProjectCollectionViewCell.self,
            forCellWithReuseIdentifier: SmallProjectCollectionViewCell.reuseIdentifier)
        addSubview(collectionView)
    }

    func styleViews() {
        collectionView.showsHorizontalScrollIndicator = false
    }

    func defineLayoutForViews() {
        collectionView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(160)
        }
    }

    private func makeCollectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = .gutter(baseValue: 20)
        layout.sectionInset = .insets(left: defaultMargin, right: defaultMargin)
        layout.itemSize = CGSize(width: 150, height: 150)
        return layout
    }

}
