import Foundation


class readSportsDataAPI: ObservableObject  {
   // @Published var sportsData = [httpResponse]()
    
    @Published var dataLoaded = false
    var data_loaded = false
        
    init(){
        if(!self.dataLoaded){
            loadSportsData()
        }
        else{
            print("Data already loaded baby")
        }
    }
    func loadSportsData(){
        let headers = [
            "X-RapidAPI-Key": "0c37025cd0msh58e62666e812cc2p1329ffjsn53b4733438be",
            "X-RapidAPI-Host": "sportscore1.p.rapidapi.com"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://sportscore1.p.rapidapi.com/sports/1/teams?page=1")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print("------------------------------------------- HTTPRESPONSE: -------------------------------------------")
                print(httpResponse)
                print("------------------------------------------- END HTTPRESPONSE: -------------------------------------------")
                
                print("------------------------------------------- HTTP DATA: -------------------------------------------")
                if let unwrapped = data{
                    print("\(unwrapped.count) sports")
                    print(data?.regions)
                }
                else{
                    print("Missing data")
                }
                print("------------------------------------------- END HTTP DATA: -------------------------------------------")
                
                print("------------------------------------------- HTTP RESPONSE: -------------------------------------------")
                print(response)
                print("------------------------------------------- END HTTP RESPONSE: -------------------------------------------")

                self.data_loaded=true
            }
        })

        dataTask.resume()
    }
    
}

