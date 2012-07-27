class Brands

  def self.sanitize_filename(filename)
    name = filename.to_s.mb_chars.strip
    # NOTE: File.basename doesn't work right with Windows paths on Unix
    # get only the filename, not the whole path
    # Strip out the non-ascii character
    name.gsub!(/[^а-яА-Я0-9A-Za-z.\-]/, '_')
  end

  BRANDS = ActiveSupport::OrderedHash.new{|h, k| {
    :file => sanitize_filename(k).downcase,
    :title => sanitize_filename(k).upcase,
    :rating => 3,
    :brand => false,
  }}

  BRANDS.merge!(ActiveSupport::OrderedHash[
    "ALFA ROMEO", { :file => "alfa_romeo", :title => "ALFA ROMEO", :rating => 5, :brand => true },
    "AUDI", { :file => "audi", :title => "AUDI", :rating => 5, :brand => true },
    "BMW", { :file => "bmw", :title => "BMW", :rating => 5, :brand => true },
    "CHERY", { :file => "chery", :title => "CHERY", :rating => 5, :brand => true },
    "CHEVROLET", { :file => "chevrolet", :title => "CHEVROLET", :rating => 5, :brand => true },
    "CHRYSLER", { :file => "chrysler", :title => "CHRYSLER", :rating => 5, :brand => true },
    "CITROEN", { :file => "citroen", :title => "CITROEN", :rating => 5, :brand => true },
    "DAEWOO", { :file => "daewoo", :title => "DAEWOO", :rating => 5, :brand => true },
    "DAIHATSU", { :file => "daihatsu", :title => "DAIHATSU", :rating => 5, :brand => true },
    "DODGE", { :file => "dodge", :title => "DODGE", :rating => 5, :brand => true },
    "FIAT", { :file => "fiat", :title => "FIAT", :rating => 5, :brand => true },
    "FORD", { :file => "ford", :title => "FORD", :rating => 5, :brand => true },
    "HONDA", { :file => "honda", :title => "HONDA", :rating => 5, :brand => true },
    "HYUNDAI", { :file => "hyundai", :title => "HYUNDAI", :rating => 5, :brand => true },
    "INFINITI", { :file => "infiniti", :title => "INFINITI", :rating => 5, :brand => true },
    "ISUZU", { :file => "isuzu", :title => "ISUZU", :rating => 5, :brand => true },
    "JAGUAR", { :file => "jaguar", :title => "JAGUAR", :rating => 5, :brand => true },
    "JEEP", { :file => "jeep", :title => "JEEP", :rating => 5, :brand => true },
    "KIA", { :file => "kia", :title => "KIA", :rating => 5, :brand => true },
    "LAND ROVER", { :file => "land_rover", :title => "LAND&#160;ROVER", :rating => 5, :brand => true },
    "LEXUS", { :file => "lexus", :title => "LEXUS", :rating => 5, :brand => true },
    "MAZDA", { :file => "mazda", :title => "MAZDA", :rating => 5, :brand => true },
    "MERCEDES-BENZ", { :file => "mercedes_benz", :title => "MERCEDES&#8209;BENZ", :rating => 5, :brand => true },
    "MINI", { :file => "mini", :title => "MINI", :rating => 5, :brand => true },
    "MITSUBISHI", { :file => "mitsubishi", :title => "MITSUBISHI", :rating => 5, :brand => true },
    "NISSAN", { :file => "nissan", :title => "NISSAN", :rating => 5, :brand => true },
    "OPEL", { :file => "opel", :title => "OPEL", :rating => 5, :brand => true },
    "PEUGEOT", { :file => "peugeot", :title => "PEUGEOT", :rating => 5, :brand => true },
    "RENAULT", { :file => "renault", :title => "RENAULT", :rating => 5, :brand => true },
    "SAAB", { :file => "saab", :title => "SAAB", :rating => 5, :brand => true },
    "SEAT", { :file => "seat", :title => "SEAT", :rating => 5, :brand => true },
    "SKODA", { :file => "skoda", :title => "SKODA", :rating => 5, :brand => true },
    "SSANGYONG", { :file => "ssang_yong", :title => "SSANGYONG", :rating => 5, :brand => true },
    "SUBARU", { :file => "subaru", :title => "SUBARU", :rating => 5, :brand => true },
    "SUZUKI", { :file => "suzuki", :title => "SUZUKI", :rating => 5, :brand => true },
    "TOYOTA", { :file => "toyota", :title => "TOYOTA", :rating => 5, :brand => true },
    "VOLKSWAGEN", { :file => "volkswagen", :title => "VOLKSWAGEN", :rating => 5, :brand => true },
    "VOLVO", { :file => "volvo", :title => "VOLVO", :rating => 5, :brand => true },
    "FEBEST", { :file => "febest", :title => "febest", :rating => 4, :brand => false },
  ])

  def self.is_brand? brand
    BRANDS.include? brand
  end
end
