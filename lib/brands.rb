module Brands

  class BrandHash < ActiveSupport::OrderedHash
    def defaults(key)
      { 
        :title => key, 
        :catalog => false, 
        :rating => 3000, 
        :brand => false, 
        :file => sanitize_filename(key.downcase) 
      }
    end

    def []=(key, value)
      super key, defaults(key).merge(value)
    end

    def [](key)
      if self.key? key
        super key
      else
        defaults(key)
      end
    end


    def sanitize_filename(filename)
      name = filename.to_s.mb_chars.strip
      name.gsub!(/[^а-яА-Я0-9A-Za-z.\-]/, '_')
    end
  end

  BRANDS = BrandHash[
    "ALFA ROMEO",         {:rating => 5000, :brand => true,  :catalog => true },
    "AUDI",               {:rating => 5000, :brand => true,  :catalog => true },
    "BMW",                {:rating => 5000, :brand => true,  :catalog => true },
    "CHERY",              {:rating => 5000, :brand => true,  :catalog => true },
    "CHEVROLET",          {:rating => 5000, :brand => true,  :catalog => true },
    "CHRYSLER",           {:rating => 5505, :brand => true,  :catalog => true },
    "CITROEN",            {:rating => 5250, :brand => true,  :catalog => true },
    "DAEWOO",             {:rating => 5000, :brand => true,  :catalog => true },
    "DAIHATSU",           {:rating => 5000, :brand => true,  :catalog => true },
    "DODGE",              {:rating => 5000, :brand => true,  :catalog => true },
    "FIAT",               {:rating => 5000, :brand => true,  :catalog => true },
    "FORD",               {:rating => 5000, :brand => true,  :catalog => true },
    "HONDA",              {:rating => 5000, :brand => true,  :catalog => true },
    "HYUNDAI",            {:rating => 5000, :brand => true,  :catalog => true },
    "HYUNDAI / KIA",      {:rating => 5000, :brand => true,  :catalog => false, :ref => ["HYUNDAI", "KIA", "MOBIS"]},
    "HYUNDAI/KIA",        {:rating => 5000, :brand => true,  :catalog => false, :ref => ["HYUNDAI", "KIA", "MOBIS"]},
    "INFINITI",           {:rating => 5000, :brand => true,  :catalog => true },
    "ISUZU",              {:rating => 5000, :brand => true,  :catalog => true },
    "JAGUAR",             {:rating => 5000, :brand => true,  :catalog => true },
    "JEEP",               {:rating => 5000, :brand => true,  :catalog => true },
    "KIA",                {:rating => 5000, :brand => true,  :catalog => true },
    "LAND ROVER",         {:rating => 5000, :brand => true,  :catalog => true, :title => "LAND&#560;ROVER"},
    "LEXUS",              {:rating => 5000, :brand => true,  :catalog => true },
    "MAZDA",              {:rating => 5000, :brand => true,  :catalog => true },
    "MERCEDES-BENZ",      {:rating => 5000, :brand => true,  :catalog => true, :title => "MERCEDES&#8509;BENZ"},
    "MINI",               {:rating => 5000, :brand => true,  :catalog => true },
    "MITSUBISHI",         {:rating => 5510, :brand => true,  :catalog => true },
    "NISSAN",             {:rating => 5000, :brand => true,  :catalog => true },
    "OPEL",               {:rating => 5000, :brand => true,  :catalog => true },
    "PEUGEOT",            {:rating => 5500, :brand => true,  :catalog => true },
    "PEUGEOT / CITROEN",  {:rating => 5400, :brand => true,  :catalog => false, :ref => ["PEUGEOT", "CITROEN"] },
    "PEUGEOT/CITROEN",    {:rating => 5400, :brand => true,  :catalog => false, :ref => ["PEUGEOT", "CITROEN"] },
    "RENAULT",            {:rating => 5000, :brand => true,  :catalog => true },
    "SAAB",               {:rating => 5000, :brand => true,  :catalog => true },
    "SEAT",               {:rating => 5000, :brand => true,  :catalog => true },
    "SKODA",              {:rating => 5000, :brand => true,  :catalog => true },
    "SSANGYONG",          {:rating => 5000, :brand => true,  :catalog => true },
    "SUBARU",             {:rating => 5000, :brand => true,  :catalog => true },
    "SUZUKI",             {:rating => 5000, :brand => true,  :catalog => true },
    "TOYOTA",             {:rating => 5500, :brand => true,  :catalog => true },
    "VOLKSWAGEN",         {:rating => 5000, :brand => true,  :catalog => true },
    "VOLVO",              {:rating => 5000, :brand => true,  :catalog => true },
    "AKEBONO",            {:rating => 4000, :brand => false, :catalog => false },
    "NIBK",               {:rating => 4000, :brand => false, :catalog => false },
    "ALLIED NIPPON",      {:rating => 3000, :brand => false, :catalog => false },
    "SIDEM",              {:rating => 3000, :brand => false, :catalog => false },
    "FEBEST",             {:rating => 3000, :brand => false, :catalog => false },
    "NIPPARTS",           {:rating => 1000, :brand => false, :catalog => false },
    "JAPAN CARS",         {:rating => 1000, :brand => false, :catalog => false },
    "CHAMPION",           {:rating => 1000, :brand => false, :catalog => false },
    "MOBIS",              {:rating => 5000, :brand => true,  :catalog => false },
    "GENERAL MOTORS",     {:rating => 5000, :brand => true,  :catalog => false, :ref => ["CADILLAC", "CHEVROLET", "OPEL"] }, 
    "KYB",                {:rating => 4000, :brand => false, :catalog => false}  
  ]

    # CHECK не знаю где это используется, вроде не надо
    #def self.is_brand? brand
    #  BRANDS.include? brand
    #end
end
