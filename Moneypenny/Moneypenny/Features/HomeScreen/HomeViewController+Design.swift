import UIKit
import SnapKit

extension HomeViewController: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }

    func createViews() {
        testLabel = Heading6BoldLabel()
        view.addSubview(testLabel)

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: makeCollectionViewLayout())
        collectionView.register(
            SmallProjectCollectionViewCell.self,
            forCellWithReuseIdentifier: SmallProjectCollectionViewCell.reuseIdentifier)
        view.addSubview(collectionView)
    }

    func styleViews() {
        view.backgroundColor = .white

        testLabel.text = "Featured"

        collectionView.setContentOffset(CGPoint(x: 20, y: 0), animated: false)
        collectionView.showsHorizontalScrollIndicator = false
    }

    func defineLayoutForViews() {
        testLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
        }

        collectionView.snp.makeConstraints {
            $0.top.equalTo(testLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(160)
        }
    }

    private func makeCollectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        layout.sectionInset = .insets(left: 20, right: 20)
        layout.itemSize = CGSize(width: 150, height: 150)
        return layout
    }

}
