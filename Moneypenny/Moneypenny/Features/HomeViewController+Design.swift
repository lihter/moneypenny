import SnapKit
import UIKit

extension HomeViewController: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }

    func createViews() {
        scrollView = UIScrollView()
        view.addSubview(scrollView)

        projectView = ProjectListView(presenter: projectListPresenter)
        scrollView.addSubview(projectView)

        bigProjectTitle = Heading6BoldLabel()
        scrollView.addSubview(bigProjectTitle)

        bigProjectListView = BigProjectListView(presenter: bigProjectListPresenter)
        scrollView.addSubview(bigProjectListView)
    }

    func styleViews() {
        view.backgroundColor = .primaryBackground

        bigProjectTitle.text = "Featured"
        bigProjectTitle.textColor = .primaryText

        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
    }

    func defineLayoutForViews() {
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(defaultMargin)
            $0.leading.trailing.bottom.equalToSuperview()
        }

        bigProjectTitle.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(defaultMargin)
        }

        bigProjectListView.snp.makeConstraints {
            $0.top.equalTo(bigProjectTitle.snp.bottom).offset(defaultMargin)
            $0.leading.trailing.equalToSuperview()

            $0.width.equalToSuperview()
        }

        projectView.snp.makeConstraints {
            $0.top.equalTo(bigProjectListView.snp.bottom).offset(CGFloat.gutter(baseValue: 70))
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(defaultMargin)

            $0.width.equalToSuperview()
            $0.height.equalTo(150)
        }
    }

}
