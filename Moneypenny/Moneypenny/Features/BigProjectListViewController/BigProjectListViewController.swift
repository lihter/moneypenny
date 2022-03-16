import Combine
import UIKit

class BigProjectListViewController: UIViewController {

    typealias DataSource = UICollectionViewDiffableDataSource<BigProjectListSection, ProjectViewModel>
    typealias Snapshot = NSDiffableDataSourceSnapshot<BigProjectListSection, ProjectViewModel>

    var collectionView: UICollectionView!
    var presenter: BigProjectListPresenter!
    var dataSource: DataSource!

    private var disposables = Set<AnyCancellable>()

    init(presenter: BigProjectListPresenter) {
        super.init(nibName: nil, bundle: nil)

        self.presenter = presenter
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        buildViews()
        makeDataSource()
        bindViews()
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
                        withReuseIdentifier: BigProjectCollectionViewCell.reuseIdentifier,
                        for: indexPath) as? BigProjectCollectionViewCell
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
