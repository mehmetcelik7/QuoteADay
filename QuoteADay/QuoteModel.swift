

import Foundation


struct QuoteModel: Codable {
    // ZenQuotes API'sinde alıntı metni "q", yazar "a", HTML içeriği isteğe bağlı "h"
    let q: String
    let a: String
    let h: String?

    // Daha okunabilir hale getirmek için computed properties kullanıyoruz.
    var content: String { q }
    var author: String { a }

    static func defaultQuote() -> QuoteModel {
        return QuoteModel(q: "Default Quote", a: "Unknown", h: nil)
    }
}
