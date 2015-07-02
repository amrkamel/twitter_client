class CreateCountryService
  COUNTRIES_PATH = 'http://openconcept.ca/sites/openconcept.ca/files/country_code_drupal_0.txt'

  def call
    require 'open-uri'

    open(COUNTRIES_PATH) do |countries|
      countries.read.each_line do |country|
        code, name = country.chomp.split("|")
        Country.find_or_create_by(name: name,code: code)
      end
    end
  end
end
