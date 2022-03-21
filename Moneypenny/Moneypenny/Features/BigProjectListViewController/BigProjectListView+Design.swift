import UIKit
import SnapKit

extension BigProjectListView: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }

    func createViews() {
        collectionView = DynamicCollectionView(frame: .zero, collectionViewLayout: makeCollectionViewLayout())
        collectionView.register(
            BigProjectCollectionViewCell.self,
            forCellWithReuseIdentifier: BigProjectCollectionViewCell.reuseIdentifier)
        addSubview(collectionView)
    }

    func styleViews() {
        collectionView.setContentOffset(CGPoint(x: 20, y: 0), animated: false)
        collectionView.showsVerticalScrollIndicator = false
    }

    func defineLayoutForViews() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    private func makeCollectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.sectionInset = .insets(left: 20, right: 20)
        layout.itemSize = CGSize(width: 330, height: 150)
        return layout
    }

}
