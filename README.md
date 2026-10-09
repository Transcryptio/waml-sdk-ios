# WamlSDK для iOS

Бинарные релизы WAML SDK для проверки криптоадресов. SDK показывает нативный
sheet со встроенной HTML-формой, обращается к WAML API и открывает PDF-отчёт
в системном браузере. Для интеграции нужны адрес API, пользовательский access
token и разрешённые origins отчётов.

Требования: iOS 15+, Xcode 16.4+ и CocoaPods. XCFramework содержит iPhone arm64
и iOS Simulator arm64/x86_64. HTML поставляется в `WamlSDKResources.bundle`.

## Установка

Добавьте зависимость в `Podfile` приложения:

```ruby
platform :ios, '15.0'

target 'YourApp' do
  use_frameworks! :linkage => :static
  pod 'WamlSDK', '0.1.0'
end
```

Из каталога приложения выполните:

```sh
pod install
open YourApp.xcworkspace
```

Замените `YourApp` именем target. После новой публикации индекс CDN обновляется
с задержкой. Дождитесь обновления и выполните `pod install --repo-update`.
Git-доступ к исходному
репозиторию и регистрация в Trunk для установки не нужны.

## Открытие формы

Создавайте контроллер и показывайте sheet на main actor:

```swift
import UIKit
import WamlSDK

@MainActor
func openWaml(from presenter: UIViewController, accessToken: String) throws {
    let configuration = try WamlConfiguration(
        apiBaseURL: URL(string: "https://your-waml-api.example")!,
        accessToken: accessToken,
        network: "eth",
        reportOrigins: [URL(string: "https://your-report-origin.example")!],
        locale: "ru",
        theme: "system"
    )
    let sheet = try WamlSheetViewController(configuration: configuration)
    sheet.onReady = { print("Форма готова") }
    sheet.onEvent = { event in /* completed / reportOpened / error / closed */ }
    presenter.present(sheet, animated: true)
}
```

Передавайте действующий пользовательский токен; обновление авторизации
выполняет приложение. API и отчёты должны использовать HTTPS. Для запросов
из локального `WKWebView` проверьте поддержку origin `null` в CORS API.
`sheet.close()` закрывает форму; `onOpenReport: (URL) -> Void` позволяет
переопределить открытие проверенной ссылки на отчёт.

## Артефакты и лицензия

В [GitHub Releases](https://github.com/Transcryptio/waml-sdk-ios/releases)
доступны XCFramework с ресурсами, podspec, SHA-256 и сведения о сборке.
CocoaPods проверяет SHA-256 архива перед установкой. Репозиторий содержит
только материалы бинарной дистрибуции.

WAML SDK — проприетарное ПО. Публикация не предоставляет права использования;
требуется отдельное письменное соглашение с правообладателем. См. [LICENSE](LICENSE).
