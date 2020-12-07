class API

  BASE_URL = "https://quote-garden.herokuapp.com/api/v2/"

  def collect_quotes
    thousand_quotes = BASE_URL + "quotes?page=1&limit=1000"
    uri = URI(thousand_quotes)
    response = Net::HTTP.get(uri)
    formatted_resp = JSON.parse(response)
    binding.pry
  end

end