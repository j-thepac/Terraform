# Fetch JSON data from API
# Fetch Peru capital from REST Countries API
data "http" "json_example" {
  url = "https://restcountries.com/v3.1/name/peru?fields=capital"
}

# Decode JSON response
locals {
  country_data = jsondecode(data.http.json_example.response_body)
  capital      = local.country_data[0].capital[0]  # Array -> first object -> first capital
}

output "peru_capital" {value = local.capital}