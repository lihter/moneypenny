import UIKit

extension UIFont {

    public static let heading1: UIFont = .regular(size: 60)
    public static let heading2: UIFont = .regular(size: 48)
    public static let heading3: UIFont = .regular(size: 43)
    public static let heading4: UIFont = .regular(size: 40)
    public static let heading5: UIFont = .regular(size: 38)
    public static let heading6: UIFont = .regular(size: 36)
    public static let heading6Bold: UIFont = .bold(size: 36)
    public static let heading7: UIFont = .regular(size: 32)
    public static let heading8: UIFont = .regular(size: 30)
    public static let heading9: UIFont = .regular(size: 26)
    public static let heading10: UIFont = .regular(size: 24)
    public static let heading10Bold: UIFont = .bold(size: 24)
    public static let heading11: UIFont = .regular(size: 20)

    public static let body1: UIFont = .regular(size: 18)
    public static let body1Medium: UIFont = .medium(size: 18)
    public static let body1Bold: UIFont = .bold(size: 18)
    public static let body2: UIFont = .regular(size: 16)
    public static let body2Medium: UIFont = .medium(size: 16)
    public static let body2Bold: UIFont = .bold(size: 16)
    public static let body3: UIFont = .regular(size: 14)
    public static let body3Medium: UIFont = .medium(size: 14)
    public static let body3Bold: UIFont = .bold(size: 14)
    public static let body4: UIFont = .regular(size: 12)
    public static let body4Medium: UIFont = .medium(size: 12)
    public static let body4Bold: UIFont = .bold(size: 12)
    public static let body5Medium: UIFont = .medium(size: 10)
    public static let body5Bold: UIFont = .bold(size: 10)
    public static let body6Medium: UIFont = .medium(size: 11)

    private static func regular(size: CGFloat = 12) -> UIFont {
        UIFont(with: .regular, size: size)
    }

    private static func bold(size: CGFloat = 12) -> UIFont {
        UIFont(with: .bold, size: size)
    }

    private static func medium(size: CGFloat = 12) -> UIFont {
        UIFont(with: .medium, size: size)
    }

    private static func italic(size: CGFloat = 12) -> UIFont {
        UIFont(with: .italic, size: size)
    }

    convenience init(with bundleFont: BundleFont, size: CGFloat) {
        self.init(name: bundleFont.rawValue, size: size)!
    }

}

extension UIFont {

    func withTraits(traits: UIFontDescriptor.SymbolicTraits, size: CGFloat) -> UIFont {
        guard
            let descriptor = fontDescriptor.withSymbolicTraits(traits)
        else {
            return .body1
        }

        return UIFont(descriptor: descriptor, size: size)
    }

    func bold(size: CGFloat) -> UIFont {
        withTraits(traits: .traitBold, size: size)
    }

    func italic(size: CGFloat) -> UIFont {
        withTraits(traits: .traitItalic, size: size)
    }

}
