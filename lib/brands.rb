class Brands
  BRANDS = ActiveSupport::OrderedHash[
    "AUDI", { :file => "audi", :title => "AUDI" },
    "BMW", { :file => "bmw", :title => "BMW" },
    "CHERY", { :file => "chery", :title => "CHERY" },
    "CHEVROLET", { :file => "chevrolet", :title => "CHEVROLET" },
    "CHRYSLER", { :file => "chrysler", :title => "CHRYSLER" },
    "CITROEN", { :file => "citroen", :title => "CITROEN" },
    "FIAT", { :file => "fiat", :title => "FIAT" },
    "FORD", { :file => "ford", :title => "FORD" },
    "HONDA", { :file => "honda", :title => "HONDA" },
    "HYUNDAI", { :file => "hyundai", :title => "HYUNDAI" },
    "INFINITI", { :file => "infiniti", :title => "INFINITI" },
    "ISUZU", { :file => "isuzu", :title => "ISUZU" },
    "JAGUAR", { :file => "jaguar", :title => "JAGUAR" },
    "JEEP", { :file => "jeep", :title => "JEEP" },
    "KIA", { :file => "kia", :title => "KIA" },
    "LAND ROVER", { :file => "land_rover", :title => "LAND&#160;ROVER" },
    "LEXUS", { :file => "lexus", :title => "LEXUS" },
    "MAZDA", { :file => "mazda", :title => "MAZDA" },
    "MERCEDES-BENZ", { :file => "mercedes_benz", :title => "MERCEDES&#8209;BENZ" },
    "MINI", { :file => "mini", :title => "MINI" },
    "MITSUBISHI", { :file => "mitsubishi", :title => "MITSUBISHI" },
    "NISSAN", { :file => "nissan", :title => "NISSAN" },
    "OPEL", { :file => "opel", :title => "OPEL" },
    "PEUGEOT", { :file => "peugeot", :title => "PEUGEOT" },
    "RENAULT", { :file => "renault", :title => "RENAULT" },
    "SAAB", { :file => "saab", :title => "SAAB" },
    "SEAT", { :file => "seat", :title => "SEAT" },
    "SKODA", { :file => "skoda", :title => "SKODA" },
    "SSANGYONG", { :file => "ssang_yong", :title => "SSANGYONG" },
    "SUBARU", { :file => "subaru", :title => "SUBARU" },
    "SUZUKI", { :file => "suzuki", :title => "SUZUKI" },
    "TOYOTA", { :file => "toyota", :title => "TOYOTA" },
    "VOLKSWAGEN", { :file => "volkswagen", :title => "VOLKSWAGEN" },
    "VOLVO", { :file => "volvo", :title => "VOLVO" },
  ]
  def self.is_brand? brand
    BRANDS.include? brand
  end
end
