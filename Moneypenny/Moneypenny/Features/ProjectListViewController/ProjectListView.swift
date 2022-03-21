import Combine
import UIKit

class ProjectListView: UIView {

    typealias DataSource = UICollectionViewDiffableDataSource<ProjectListSection, ProjectViewModel>
    typealias Snapshot = NSDiffableDataSourceSnapshot<ProjectListSection, ProjectViewModel>

    var collectionView: UICollectionView!
    var presenter: ProjectListPresenter!
    var dataSource: DataSource!

    let defaultMargin: CGFloat = .gutter(baseValue: 30)

    private var disposables = Set<AnyCancellable>()

    init(presenter: ProjectListPresenter) {
        super.init(frame: .zero)

        self.presenter = presenter

        buildViews()
        makeDataSource()
        bindViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func bindViews() {
        presenter
            .viewModels
            .sink { [weak self] model in
                self?.applySnapshot(with: model)
            }
            .store(in: &disposables)
    }

    private func makeDataSource() {
        dataSource = DataSource(
            collectionView: collectionView,
            cellProvider: { (collectionView, indexPath, data) -> UICollectionViewCell? in
                guard
                    let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: SmallProjectCollectionViewCell.reuseIdentifier,
                        for: indexPath) as? SmallProjectCollectionViewCell
                else {
                    return UICollectionViewCell()
                }

                cell.set(data)
                return cell
            })
    }

    func applySnapshot(with data: [ProjectViewModel], animatingDifferences: Bool = true) {
        var snapshot = Snapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(data)
        dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
    }

}
