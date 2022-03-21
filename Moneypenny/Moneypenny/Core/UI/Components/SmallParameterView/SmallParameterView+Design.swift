import UIKit

extension SmallParameterView: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }

    func createViews() {
        titleLabel = Body4Label()
        addSubview(titleLabel)

        valueLabel = Body1BoldLabel()
        addSubview(valueLabel)
    }

    func styleViews() {
        titleLabel.textColor = .primaryText.withAlphaComponent(0.5)
        valueLabel.textColor = .primaryText
    }

    func defineLayoutForViews() {
        snp.makeConstraints {
            $0.width.equalTo(70)
        }

        titleLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }

        valueLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(CGFloat.gutter(baseValue: 5))
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }

}
