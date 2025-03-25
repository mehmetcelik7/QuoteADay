
import Foundation

class QuoteViewModel: ObservableObject {
    @Published var quoteModel: QuoteModel = QuoteModel.defaultQuote()
    
    func getRandomQuote() {
        getQuote(urlString: "https://zenquotes.io/api/random")
    }
    
    func getQuote(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            let jsonDecoder = JSONDecoder()
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else {
                print("data was nil")
                return
            }
            
            do {
                // ZenQuotes API bir array döndürüyor
                let quotes = try jsonDecoder.decode([QuoteModel].self, from: data)
                // İlk elemanı alıp quoteModel’e atıyoruz
                if let firstQuote = quotes.first {
                    DispatchQueue.main.async {
                        self.quoteModel = firstQuote
                    }
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
