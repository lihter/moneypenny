import UIKit

public extension UIColor {

    static var paidBorderColor: UIColor {
        .resolveColor(forLightMode: .moneyDiamondBlueLight, forDarkMode: .moneyDiamondBlueLight)
    }

    static var paidCellColors: UIColor {
        .resolveColor(forLightMode: .moneyDiamondBlueLight, forDarkMode: .moneyDiamondBlueLight)
    }

    static var primaryText: UIColor {
        .resolveColor(forLightMode: .moneyBlack, forDarkMode: .moneyWhite)
    }

    static var primaryBackground: UIColor {
        .resolveColor(forLightMode: .moneyWhite, forDarkMode: .moneyDark)
    }

    static var discordPrimary: UIColor {
        UIColor(hex: "#7289DA") ?? .blue
    }

    static var twitterPrimary: UIColor {
        UIColor(hex: "#1DA1F2") ?? .blue
    }

    static var moneyDiamondBlueLight: UIColor {
        UIColor(hex: "#00F0FF") ?? .blue
    }

    static var moneyDark: UIColor {
        UIColor(hex: "#040404") ?? .black
    }

    static var moneyBlack: UIColor {
        .black
    }

    static var moneyWhite: UIColor {
        .white
    }

    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }

    convenience init?(hex: String) {
        guard hex.starts(with: "#") else { return nil }

        let start = hex.index(hex.startIndex, offsetBy: 1)
        let hexColor = String(hex[start...])

        guard hexColor.count == 6 else { return nil }

        let scanner = Scanner(string: hexColor)
        var hexNumber: UInt64 = 0

        guard scanner.scanHexInt64(&hexNumber) else { return nil }

        self.init(rgb: Int(truncatingIfNeeded: hexNumber))
    }

    private convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

    private static func resolveColor(
        forLightMode lightModeColor: UIColor,
        forDarkMode darkModeColor: UIColor
    ) -> UIColor {
        UIColor { (uiTraitCollection: UITraitCollection) -> UIColor in
            switch uiTraitCollection.userInterfaceStyle {
            case .dark:
                return darkModeColor
            case .unspecified, .light:
                return lightModeColor
            @unknown default:
                return lightModeColor
            }
        }
    }

}
