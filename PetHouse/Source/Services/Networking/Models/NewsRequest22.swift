import Alamofire

struct NewsRequest22 {
    
    /*
     q
     
     Keywords or phrases to search for in the article title and body.

     Advanced search is supported here:

         Surround phrases with quotes (") for exact match.
         Prepend words or phrases that must appear with a + symbol. Eg: +bitcoin
         Prepend words that must not appear with a - symbol. Eg: -bitcoin
         Alternatively you can use the AND / OR / NOT keywords, and optionally group these with parenthesis. Eg: crypto AND (ethereum OR litecoin) NOT bitcoin.

     The complete value for q must be URL-encoded.
     */
    enum Filter {
        case dog
        case cat
    }
    
    /*
     from or to
     
     A date and optional time for the oldest article allowed. This should be in ISO 8601 format (e.g. 2021-05-09 or 2021-05-09T14:08:44)
     */
    enum Freshness {
        case fresh
        case any
    }
    
    /*
     language
     
     The order to sort the articles in. Possible options: relevancy, popularity, publishedAt.
     relevancy = articles more closely related to q come first.
     popularity = articles from popular sources and publishers come first.
     publishedAt = newest articles come first.
     */
    enum Sort {
        case popularity
    }
    
    /*
     The 2-letter ISO-639-1 code of the language you want to get headlines for. Possible options:
     ar de en es fr he it nl no pt ru se ud zh.
     */
    enum Language {
        
    }
    
    var request: Alamofire.Request {
        AF.request(Config.apiUrl, method: .get)
    }
}
