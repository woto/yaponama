module Brands

  class BrandHash < ActiveSupport::OrderedHash
    def defaults(key)
      { 
        :title => key, 
        :catalog => false, 
        :rating => nil, 
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
    "ALFA ROMEO",         {:rating => 10000, :brand => true,  :catalog => true },
    "AUDI",               {:rating => 10000, :brand => true,  :catalog => true },
    "BMW",                {:rating => 10000, :brand => true,  :catalog => true },
    "CADILLAC",           {:rating => 10000, :brand => true,  :catalog => true },
    "CHERY",              {:rating => 10000, :brand => true,  :catalog => true },
    "CHEVROLET",          {:rating => 10000, :brand => true,  :catalog => true },
    "CHRYSLER",           {:rating => 10800, :brand => true,  :catalog => true },
    "CITROEN",            {:rating => 10500, :brand => true,  :catalog => true, :title => "CITRO&#203;N" },
    "DAEWOO",             {:rating => 10000, :brand => true,  :catalog => true },
    "DAIHATSU",           {:rating => 10000, :brand => true,  :catalog => true },
    "DODGE",              {:rating => 10000, :brand => true,  :catalog => true },
    "FIAT",               {:rating => 10000, :brand => true,  :catalog => true },
    "FORD",               {:rating => 10000, :brand => true,  :catalog => true },
    "HONDA",              {:rating => 10000, :brand => true,  :catalog => true },
    "HYUNDAI",            {:rating => 10000, :brand => true,  :catalog => true },
    "HYUNDAI / KIA",      {:rating => 10000, :brand => true, :ref => ["HYUNDAI", "KIA", "MOBIS"]},
    "HYUNDAI/KIA",        {:rating => 10000, :brand => true, :ref => ["HYUNDAI", "KIA", "MOBIS"]},
    "INFINITI",           {:rating => 10000, :brand => true,  :catalog => true },
    "ISUZU",              {:rating => 10000, :brand => true,  :catalog => true },
    "JAGUAR",             {:rating => 10000, :brand => true,  :catalog => true },
    "JEEP",               {:rating => 10000, :brand => true,  :catalog => true },
    "KIA",                {:rating => 10000, :brand => true,  :catalog => true },
    "LAND ROVER",         {:rating => 10000, :brand => true,  :catalog => true, :title => "LAND&#160;ROVER"},
    "LEXUS",              {:rating => 10000, :brand => true,  :catalog => true },
    "MAZDA",              {:rating => 10000, :brand => true,  :catalog => true },
    "MERCEDES-BENZ",      {:rating => 10000, :brand => true,  :catalog => true, :title => "MERCEDES&#8209;BENZ"},
    "MINI",               {:rating => 10000, :brand => true,  :catalog => true },
    "MITSUBISHI",         {:rating => 10900, :brand => true,  :catalog => true },
    "NISSAN",             {:rating => 10000, :brand => true,  :catalog => true },
    "OPEL",               {:rating => 10000, :brand => true,  :catalog => true },
    "PEUGEOT",            {:rating => 10900, :brand => true,  :catalog => true },
    "PEUGEOT / CITROEN",  {:rating => 10800, :brand => true, :ref => ["PEUGEOT", "CITROEN"] },
    "PEUGEOT/CITROEN",    {:rating => 10800, :brand => true, :ref => ["PEUGEOT", "CITROEN"] },
    "RENAULT",            {:rating => 10000, :brand => true,  :catalog => true },
    "SAAB",               {:rating => 10000, :brand => true,  :catalog => true },
    "SEAT",               {:rating => 10000, :brand => true,  :catalog => true },
    "SKODA",              {:rating => 10000, :brand => true,  :catalog => true, :title => "&#352;KODA" },
    "SSANGYONG",          {:rating => 10000, :brand => true,  :catalog => true },
    "SUBARU",             {:rating => 10000, :brand => true,  :catalog => true },
    "SUZUKI",             {:rating => 10000, :brand => true,  :catalog => true },
    "TOYOTA",             {:rating => 10900, :brand => true,  :catalog => true },
    "VOLKSWAGEN",         {:rating => 10000, :brand => true,  :catalog => true },
    "VOLVO",              {:rating => 10000, :brand => true,  :catalog => true },
    "AKEBONO",            {:rating => 9400, :catalog => true },
    "NIBK",               {:rating => 8000 },
    "ALLIED NIPPON",      {:rating => 6000 },
    "SIDEM",              {:rating => 6000 },
    "FEBEST",             {:rating => 6000, :catalog => true },
    "NIPPARTS",           {:rating => 7400, :catalog => true },
    "CHAMPION",           {:rating => 2000, :catalog => true },
    "MOBIS",              {:rating => 10000, :brand => true },
    "GENERAL MOTORS",     {:rating => 10000, :brand => true, :ref => ["CADILLAC", "CHEVROLET", "OPEL"] }, 
    "KYB",                {:rating => 9000, :catalog => true, :title => "KYB/KAYABA" },
    "KAYABA",             {:rating => 9000, :catalog => false, :ref => ["KYB"] },
    "AIKO",               {:rating => 7000, :catalog => true },
    "ASHIKA",             {:rating => 7000, :catalog => true },
    "AVANTECH",           {:rating => 7000 },
    "BOSCH",              {:rating => 9000, :catalog => true },
    "TSN",                {:rating => 3000, :title => "TSN/Triston", :catalog => true },
    "PARTS-MALL",         {:rating => 8000 },
    "JS ASAKASHI",        {:rating => 7000 },
    "DENSO",              {:rating => 8000, :catalog => true },
    "DOLZ",               {:rating => 8000, :catalog => true },
    "DRIVE JOY",          {:rating => 9400 },
    "FILTRON",            {:rating => 7000, :catalog => true },
    "FRAM",               {:rating => 8000 },
    "GOODWILL",           {:rating => 6000 },
    "HENGST",             {:rating => 8000, :catalog => true },
    "HERTH+BUSS",         {:rating => 7400 },
    "JAPAN CARS",         {:rating => 7400, :catalog => true },
    "SCT",                {:rating => 6000 },
    "VAICO",              {:rating => 7000 },
    "VEMO",               {:rating => 7000 },
    "SAKURA",             {:rating => 6000, :catalog => true },
    "KOLBENSCHMIDT",      {:rating => 9400 },
    "MASUMA",             {:rating => 6400, :catalog => true },
    "MANN",               {:rating => 7000, :catalog => true },
    "JAPANPARTS",         {:rating => 6400, :catalog => true },
    "MAHLE / KNECHT",     {:rating => 9000, :catalog => true, :title => "MAHLE/KNECHT" },
    "MAHLE",              {:rating => 9000, :ref => ["MAHLE / KNECHT"] },
    "KNECHT",             {:rating => 9000, :ref => ["MAHLE / KNECHT"] },
    "UNION",              {:rating => 8000 },
    "MICRO",              {:rating => 9000 },
    "VIC",                {:rating => 9000, :catalog => true },
    "VALEO",              {:rating => 8000, :catalog => true },
    "RBI",                {:rating => 5000 },
    "DELTA",              {:rating => 8000 },
    "LYNXAUTO",           {:rating => 7000 },
    "VTR",                {:rating => 5000 },
    "CTR",                {:rating => 7000, :catalog => true },
    "HANSE",              {:rating => 5000, :catalog => true },
    "STELLOX",            {:rating => 6000 },
    "SWAG",               {:rating => 8000, :catalog => true },
    "AKITAKA",            {:rating => 5000, :catalog => true },
    "FEBI",               {:rating => 7000, :catalog => true },
    "MEYLE",              {:rating => 8000, :catalog => true },
    "OPTIMAL",            {:rating => 7000, :catalog => true },
    "MOOG",               {:rating => 8000, :catalog => true },
    "QSTEN",              {:rating => 9000 },
    "LEMFORDER",          {:rating => 9000, :catalog => true },
    "ABS",                {:rating => 7000, :catalog => true },
    "DELPHI",             {:rating => 8000, :catalog => true },
    "BLUE PRINT",         {:rating => 7000 },
    "NK",                 {:rating => 6000, :catalog => true },
    "MAPCO",              {:rating => 6000, :catalog => true },
    "GMB",                {:rating => 8000, :catalog => true },
    "IMPERGOM",           {:rating => 7000, :catalog => true },
    "SNR",                {:rating => 9000, :catalog => true },
    "KOYO",               {:rating => 9400, :catalog => true },
    "SKF",                {:rating => 9000, :catalog => true },
    "LUK",                {:rating => 9000, :catalog => true },
    "INA",                {:rating => 9000, :catalog => true },
    "RUVILLE",            {:rating => 8000, :catalog => true },
    "DAYCO",              {:rating => 8000, :catalog => true },
    "ACDELCO",            {:rating => 9400, :catalog => true},
    "AC DELCO",           {:rating => 9400, :ref => ["ACDELCO"]},
    "AIKO-SAKURA",        {:rating => 6400 },
    "NISSENS",            {:rating => 8000, :catalog => true },
    "AVA",                {:rating => 6000, :catalog => true },
    "LUCAS / TRW",        {:rating => 8000, :catalog => true, :title => "LUCAS/TRW" },
    "TRW",                {:rating => 8000, :ref => ["LUCAS / TRW"] },
    "LUCAS",              {:rating => 8000, :ref => ["LUCAS / TRW"] },
    "NACHI",              {:rating => 9000 },
    "555",                {:rating => 9000, :file => "brand_555", :catalog => true },
    "SINOLAR",            {:rating => 5000 },
    "UFI",                {:rating => 7000 },
    "JUST DRIVE",         {:rating => 6000 },
    "TOPFILS",            {:rating => 6000 },
    "AIRTEX",             {:rating => 8000, :catalog => true },
    "HEPU",               {:rating => 9000, :catalog => true },
    "MANDO",              {:rating => 8000 },
    "AKYOTO",             {:rating => 5000, :catalog => true },
    "KASHIYAMA",          {:rating => 6000 },
    "TEXTAR",             {:rating => 9000 },
    "ICER",               {:rating => 7000, :catalog => true },
    "MINTEX",             {:rating => 7000 },
    "PAGID",              {:rating => 9000 },
    "FERODO",             {:rating => 8000, :catalog => true },
    "GIRLING",            {:rating => 8000, :catalog => true },
    "NISSHINBO",          {:rating => 9000, :catalog => true },
    "JNBK",               {:rating => 6000, :catalog => true },
    "FRICTIONMASTER",     {:rating => 8000 },
    "ATE",                {:rating => 9000, :catalog => true },
    "NTN",                {:rating => 9400, :catalog => true },
    "ASVA",               {:rating => 5000, :catalog => true },
    "ORIPARTS",           {:rating => 7600 },
    "ALCO FILTERS",       {:rating => 7000 },
    "BREMI",              {:rating => 8000, :catalog => true },
    "CORTECO",            {:rating => 8000, :catalog => true },
    "GATES",              {:rating => 9000, :catalog => true },
    # TODO Удалить, когда сделаю нормально производителей
    "ТОЧКА ОПОР",         {:rating => 7000 },
    "ТОЧКА ОПОРЫ",        {:rating => 7000 },
    "HELLA",              {:rating => 9000, :catalog => true },
    "STARMANN",           {:rating => 6000 },
    "FLENNOR",            {:rating => 7000, :catalog => true },
    "TYG",                {:rating => 6000 },
    "TYC",                {:rating => 6000, :catalog => true },
    "DEPO",               {:rating => 8000, :catalog => true },
    "RAYBESTOS",          {:rating => 7000, :catalog => true },
    "LPR",                {:rating => 7000 },
    "BREMBO",             {:rating => 9000, :catalog => true },
    "FACET",              {:rating => 8000 },
    "FAE",                {:rating => 8000 },
    "HANS PRIES",         {:rating => 7400 },
    "GLASER",             {:rating => 8000 },
    "PAYEN",              {:rating => 9000 },
    "VICTOR REINZ",       {:rating => 9000, :catalog => true },
    "AJUSA",              {:rating => 8000, :catalog => true },
    "GOETZE",             {:rating => 8000 },
    "ELRING",             {:rating => 8000, :catalog => true },
    "LAUTRETTE",          {:rating => 8000 },
    "JP",                 {:rating => 8000, :catalog => true },
    "JP GROUP",           {:rating => 8000 },
    "PURFLUX",            {:rating => 8000 },
    "PIERBURG",           {:rating => 9000 },
    "SACHS",              {:rating => 9000, :catalog => true },
    "BEHR",               {:rating => 9000, :catalog => true },
    "BANDO",              {:rating => 9000 },
    "CONTITECH",          {:rating => 9000, :catalog => true },
    "BOSAL",              {:rating => 9000, :catalog => true },
    "MITSUBOSHI",         {:rating => 9000 },
    "SUN",                {:rating => 8000 },
    "BOGE",               {:rating => 9000, :catalog => true },
    "BILSTEIN",           {:rating => 8000, :catalog => true },
    "REMSA",              {:rating => 8000, :catalog => true },
    "FENOX",              {:rating => 5000, :catalog => true },
    "ROADHOUSE",          {:rating => 8000 },
    "TOKICO",             {:rating => 9000, :catalog => true },
    "MONROE",             {:rating => 8000, :catalog => true },
    "METELLI",            {:rating => 8000, :catalog => true },
    "ZIMMERMANN",         {:rating => 9000 },
    "NSK",                {:rating => 9400, :catalog => true },
    "ADVICS",             {:rating => 9400, :catalog => true  },
    "AISIN",              {:rating => 9400, :catalog => true },
    "AL-KO",              {:rating => 6000, :catalog => true },
    "ALKO",               {:rating => 6000, :ref => ["AL-KO"] },
    "SUMITOMO",           {:rating => 9400, :catalog => true },
    "STONE",              {:rating => 9000 },
    "SIGNEDA",            {:rating => 6000 },
    "SEIWA",              {:rating => 9000 },
    "SHINKAI",            {:rating => 5000 },
    "XYG",                {:rating => 7000 },
    "WIX",                {:rating => 7000 },
    "WAHLER",             {:rating => 8000, :catalog => true },
    "VTR",                {:rating => 5000 },
    "VIC",                {:rating => 9000, :catalog => true },
    "VDO",                {:rating => 9000 },
    "JURID",              {:rating => 9000 },
    "NGK",                {:rating => 9000, :catalog => true },
    "AE",                 {:rating => 8000, :catalog => true },
    "BERU",               {:rating => 8000, :catalog => true },
    "MUSASHI",            {:rating => 9000 },
    "API",                {:catalog => true, :title => "AP/API" },
    "AP",                 {:ref => ["API"] },
    "MOUNTAIN",           {:catalog => false},
    "TOKAI",              {:catalog => false },
    "NISSIN",             {:catalog => true },
    "SHINKO",             {:catalog => false },
    "AUTOLITE",           {:catalog => true },
    "FAG",                {:catalog => true },
    "ASAHI",              {:catalog => true },
    "DORMAN",             {:catalog => true },
    "BESTF1TS",           {:catalog => true },
    "BLUE PRINT",         {:catalog => true },
    "MOTGUM",             {:catalog => true },
    "ZF",                 {:catalog => true },
    "PHILIPS",            {:catalog => true },
    "WP",                 {:catalog => true },
    "SASIC",              {:catalog => true },
    "SBS",                {:catalog => true },
    "OSRAM",              {:catalog => true },
    "FRI.TECH.",          {:catalog => true, :file => "fri_tech" },
    "ABE",                {:catalog => true },
    "ADRIAUTO",           {:catalog => true },
    "AGC",                {:catalog => true },
    "ALKAR",              {:catalog => true },
    "AMD",                {:catalog => true },
    "ASSO",               {:catalog => true },
    "BRECK",              {:catalog => true },
    "CARDONE",            {:catalog => true },
    "CX",                 {:catalog => true },
    "DBA",                {:catalog => true },
    "EGR",                {:catalog => true },
    "FERROZ",             {:catalog => true },
    "GKN",                {:catalog => true },
    "GRAF",               {:catalog => true },
    "GTR",                {:catalog => true },
    "JD",                 {:catalog => true }
  ]
end
