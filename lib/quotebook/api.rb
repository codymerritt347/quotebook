class API

  BASE_URL = "https://quote-garden.herokuapp.com/api/v3/"
  PATHS = [
    "quotes?limit=15&genre=age",
    "quotes?limit=15&genre=art",
    "quotes?limit=15&genre=computers", 
    "quotes?limit=15&genre=design",
    "quotes?limit=15&genre=friendship",
    "quotes?limit=15&genre=happiness",
    "quotes?limit=15&genre=history",
    "quotes?limit=15&genre=learning",
    "quotes?limit=15&genre=motivational",
    "quotes?limit=15&genre=nature",
    "quotes?limit=15&genre=success",
    "quotes?limit=15&genre=truth"
  ]

  def collect_quotes
    PATHS.each do |path|
      url = BASE_URL + path
      uri = URI(url)
      response = Net::HTTP.get(uri)
      formatted_resp = JSON.parse(response)
      formatted_resp["data"].each do |quote_hash|
        genre = Genre.new(quote_hash["quoteGenre"])
        author = Author.new(quote_hash["quoteAuthor"])
        Quote.new(quote_hash["quoteText"], author, genre)
      end
    end
  end

end