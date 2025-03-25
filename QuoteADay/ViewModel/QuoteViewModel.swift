
import Foundation

class QuoteViewModel: ObservableObject {
    @Published var quoteModel: QuoteModel = QuoteModel.defaultQuote()
    
    func getRandomQuote() {
        getQuote(urlString: "https://api.quotable.io/random")
    }
    
    func getQuote(urlString: String) {
        // Try to get url
        guard let url = URL(string: urlString) else { return }
        
        // Send get request from quote API
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // Try to get data and any error information
        let task = URLSession.shared.dataTask(with: request)
        {
            (data, response, error) in
            let jsonDecoder = JSONDecoder()
            // This is called only if error is not nil
            if let error = error {
                print(error)
                return
            }
            
            // Get data if it is not nil
            guard let data = data else {
                print("data was nil")
                return
            }
            
            do {
                let newQuoteModel = try jsonDecoder
                    .decode(QuoteModel.self, from: data)
                
                // Crucial step - update quoteModel
                DispatchQueue.main.async {
                    self.quoteModel = newQuoteModel
                }
                
            } catch {
                print(error)
            }
            
        }
        task.resume()
    }
}
