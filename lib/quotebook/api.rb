class API

  BASE_URL = "https://quote-garden.herokuapp.com/api/v3/"
  PATHS = [
    "quotes?limit=10&genre=age",
    "quotes?limit=10&genre=art",
    "quotes?limit=10&genre=computers", 
    "quotes?limit=10&genre=design",
    "quotes?limit=10&genre=friendship",
    "quotes?limit=10&genre=happiness",
    "quotes?limit=10&genre=history",
    "quotes?limit=10&genre=learning",
    "quotes?limit=10&genre=motivational",
    "quotes?limit=10&genre=nature",
    "quotes?limit=10&genre=success",
    "quotes?limit=10&genre=truth"
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