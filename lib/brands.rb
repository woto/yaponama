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
    "CHERY",              {:rating => 10000, :brand => true,  :catalog => true },
    "CHEVROLET",          {:rating => 10000, :brand => true,  :catalog => true },
    "CHRYSLER",           {:rating => 11010, :brand => true,  :catalog => true },
    "CITROEN",            {:rating => 10500, :brand => true,  :catalog => true },
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
    "LAND ROVER",         {:rating => 10000, :brand => true,  :catalog => true, :title => "LAND&#560;ROVER"},
    "LEXUS",              {:rating => 10000, :brand => true,  :catalog => true },
    "MAZDA",              {:rating => 10000, :brand => true,  :catalog => true },
    "MERCEDES-BENZ",      {:rating => 10000, :brand => true,  :catalog => true, :title => "MERCEDES&#8509;BENZ"},
    "MINI",               {:rating => 10000, :brand => true,  :catalog => true },
    "MITSUBISHI",         {:rating => 11020, :brand => true,  :catalog => true },
    "NISSAN",             {:rating => 10000, :brand => true,  :catalog => true },
    "OPEL",               {:rating => 10000, :brand => true,  :catalog => true },
    "PEUGEOT",            {:rating => 11000, :brand => true,  :catalog => true },
    "PEUGEOT / CITROEN",  {:rating => 10800, :brand => true, :ref => ["PEUGEOT", "CITROEN"] },
    "PEUGEOT/CITROEN",    {:rating => 10800, :brand => true, :ref => ["PEUGEOT", "CITROEN"] },
    "RENAULT",            {:rating => 10000, :brand => true,  :catalog => true },
    "SAAB",               {:rating => 10000, :brand => true,  :catalog => true },
    "SEAT",               {:rating => 10000, :brand => true,  :catalog => true },
    "SKODA",              {:rating => 10000, :brand => true,  :catalog => true },
    "SSANGYONG",          {:rating => 10000, :brand => true,  :catalog => true },
    "SUBARU",             {:rating => 10000, :brand => true,  :catalog => true },
    "SUZUKI",             {:rating => 10000, :brand => true,  :catalog => true },
    "TOYOTA",             {:rating => 11000, :brand => true,  :catalog => true },
    "VOLKSWAGEN",         {:rating => 10000, :brand => true,  :catalog => true },
    "VOLVO",              {:rating => 10000, :brand => true,  :catalog => true },
    "AKEBONO",            {:rating => 9400 },
    "NIBK",               {:rating => 8000 },
    "ALLIED NIPPON",      {:rating => 6000 },
    "SIDEM",              {:rating => 6000 },
    "FEBEST",             {:rating => 6000 },
    "NIPPARTS",           {:rating => 7400 },
    "JAPAN CARS",         {:rating => 2000 },
    "CHAMPION",           {:rating => 2000 },
    "MOBIS",              {:rating => 10000, :brand => true },
    "GENERAL MOTORS",     {:rating => 10000, :brand => true, :ref => ["CADILLAC", "CHEVROLET", "OPEL"] }, 
    "KYB",                {:rating => 9000 },
    "AIKO",               {:rating => 7000 },
    "ASHIKA",             {:rating => 7000 },
    "AVANTECH",           {:rating => 7000 },
    "BOSCH",              {:rating => 9000 },
    "TSN",                {:rating => 3000 },
    "PARTS-MALL",         {:rating => 8000 },
    "JS ASAKASHI",        {:rating => 7000 },
    "DENSO",              {:rating => 8000 },
    "DOLZ",               {:rating => 8000 },
    "DRIVE JOY",          {:rating => 9400 },
    "FILTRON",            {:rating => 7000 },
    "FRAM",               {:rating => 8000 },
    "GOODWILL",           {:rating => 6000 },
    "HENGST",             {:rating => 8000 },
    "HERTH+BUSS",         {:rating => 7400 },
    "JAPAN CARS",         {:rating => 7400 },
    "JS ASAKASHI",        {:rating => 7000 },
    "SCT",                {:rating => 6000 },
    "VAICO",              {:rating => 7000 },
    "VEMO",               {:rating => 7000 },
    "SAKURA",             {:rating => 6000 },
    "KOLBENSCHMIDT",      {:rating => 9400 },
    "MASUMA",             {:rating => 6400 },
    "MANN",               {:rating => 7000 },
    "JAPANPARTS",         {:rating => 6400 },
    "MAHLE / KNECHT",     {:rating => 9000 },
    "MAHLE",              {:rating => 9000, :ref => ["MAHLE / KNECHT"] },
    "KNECHT",             {:rating => 9000, :ref => ["MAHLE / KNECHT"] },
    "UNION",              {:rating => 8000 },
    "MICRO",              {:rating => 9000 },
    "VIC",                {:rating => 9000 },
    "VALEO",              {:rating => 8000 },
    "FEBEST",             {:rating => 6000 },
    "RBI",                {:rating => 5000 },
    "AMC",                {:rating => 2200 },
    "ARROW",              {:rating => 2200 },
    "DIRECT PARTS",       {:rating => 2200 },
    "MV PARTS",           {:rating => 2200 },
    "CONCORD",            {:rating => 2200 },
    "DELTA",              {:rating => 8000 },
    "RST",                {:rating => 2200 },
    "LYNXAUTO",           {:rating => 7000 },
    "VTR",                {:rating => 5000 },
    "CTR",                {:rating => 7000 },
    "TEKNOROT",           {:rating => 2200 },
    "SH AUTO PARTS",      {:rating => 2200 },
    "HANSE",              {:rating => 5000 },
    "SAT",                {:rating => 2200 },
    "STELLOX",            {:rating => 6000 },
    "SWAG",               {:rating => 8000 },
    "AKITAKA",            {:rating => 5000 },
    "FEBI",               {:rating => 7000 },
    "NAKAMOTO",           {:rating => 2200 },
    "MTP KEBONO",         {:rating => 2200 },
    "MTP",                {:rating => 2200 },
    "MEYLE",              {:rating => 8000 },
    "OPTIMAL",            {:rating => 7000 },
    "RTS",                {:rating => 2200 },
    "MOOG",               {:rating => 8000 },
    "QSTEN",              {:rating => 9000 },
    "LEMFORDER",          {:rating => 9000 },
    "ABS",                {:rating => 7000 },
    "DELPHI",             {:rating => 8000 },
    "TRUSTAUTO",          {:rating => 2200 },
    "BLUE PRINT",         {:rating => 7000 },
    "MOTORCRAFT",         {:rating => 2200 },
    "NK",                 {:rating => 6000 },
    "MAPCO",              {:rating => 6000 },
    "LONGHO",             {:rating => 2200 },
    "GMB",                {:rating => 8000 },
    "IMPERGOM",           {:rating => 7000 },
    "SNR",                {:rating => 9000 },
    "KOYO",               {:rating => 9400 },
    "SKF",                {:rating => 9000 },
    "PITWORK",            {:rating => 2200 },
    "LUK",                {:rating => 9000 },
    "TJB",                {:rating => 2200 },
    "INA",                {:rating => 9000 },
    "RUVILLE",            {:rating => 8000 },
    "DAYCO",              {:rating => 8000 },
    "ACDELCO",            {:rating => 9400 },
    "LOGEM",              {:rating => 2200 },
    "KITTO",              {:rating => 2200 },
    "AIKO-SAKURA",        {:rating => 6400 },
    "NISSENS",            {:rating => 8000 },
    "AVA",                {:rating => 6000 },
    "RCL",                {:rating => 2200 },
    "RCL RADIATORS",      {:rating => 2200 },
    "AKS",                {:rating => 2200 },
    "TERMAL",             {:rating => 2200 },
    "RAVENOL",            {:rating => 2200 },
    "LUCAS / TRW",        {:rating => 8000 },
    "TRW",                {:rating => 8000, :ref => ["LUCAS / TRW"] },
    "VEMA",               {:rating => 2200 },
    "NACHI",              {:rating => 9000 },
    "555",                {:rating => 9000 },
    "SINOLAR",            {:rating => 5000 },
    "FORTECH",            {:rating => 2200 },
    "UFI",                {:rating => 7000 },
    "BIG FILTER",         {:rating => 2200 },
    "JUST DRIVE",         {:rating => 6000 },
    "DEXTRIM",            {:rating => 2200 },
    "ALPHA FILTER",       {:rating => 2200 },
    "POWER-Q",            {:rating => 2200 },
    "MITWELL",            {:rating => 2200 },
    "888",                {:rating => 2200 },
    "TOPFILS",            {:rating => 6000 },
    "TECNECO FILTERS",    {:rating => 2200 },
    "AIRTEX",             {:rating => 8000 },
    "SALERI SIL",         {:rating => 2200 },
    "HEPU",               {:rating => 9000 },
    "MANDO",              {:rating => 8000 },
    "FBK",                {:rating => 2200 },
    "AMIWA",              {:rating => 2200 },
    "KONSTEIN",           {:rating => 2200 },
    "AKYOTO",             {:rating => 5000 },
    "SANGSIN BRAKE",      {:rating => 2200 },
    "KASHIYAMA",          {:rating => 6000 },
    "TEXTAR",             {:rating => 9000 },
    "GBS",                {:rating => 2200 },
    "ICER",               {:rating => 7000 },
    "MINTEX",             {:rating => 7000 },
    "PAGID",              {:rating => 9000 },
    "FERODO",             {:rating => 8000 },
    "GIRLING",            {:rating => 8000 },
    "BENDIX",             {:rating => 2200 },
    "NISSHINBO",          {:rating => 9000 },
    "JNBK",               {:rating => 6000 },
    "FRICTIONMASTER",     {:rating => 8000 },
    "ATE",                {:rating => 9000 },
    "KAVO PARTS",         {:rating => 2200 },
    "NTN",                {:rating => 9400 },
    "ASVA",               {:rating => 5000 },
    "ORIPARTS",           {:rating => 7600 },
    "ALCO FILTERS",       {:rating => 7000 },
    "ZAFFO",              {:rating => 2200 },
    "M2",                 {:rating => 2200 },
    "DORIA",              {:rating => 2200 },
    "BREMI",              {:rating => 8000 },
    "SURE FILTER",        {:rating => 2200 },
    "CORTECO",            {:rating => 8000 },
    "NITTO",              {:rating => 2200 },
    "GATES",              {:rating => 9000 },
    "X5 RESOURCE",        {:rating => 2200 },
    # TODO Удалить, когда сделаю нормально производителей
    "ТОЧКА ОПОР",         {:rating => 7000 },
    "ТОЧКА ОПОРЫ",        {:rating => 7000 },
    "BEST GEAR",          {:rating => 2200 },
    "BESTGEAR",           {:rating => 2200 },
    "GTR",                {:rating => 2200 },
    "ПОЛИУРЕТАН",         {:rating => 2200 },
    "CTC",                {:rating => 2200 },
    "AP",                 {:rating => 2200 },
    "TONG YANG",          {:rating => 2200 },
    "HELLA",              {:rating => 9000 },
    "SFEC",               {:rating => 2200 },
    "STARMANN",           {:rating => 6000 },
    "FLENNOR",            {:rating => 7000 },
    "TYG",                {:rating => 6000 },
    "TYC",                {:rating => 6000 },
    "DEPO",               {:rating => 8000 },
    "INTERCARS",          {:rating => 2200 },
    "RAYBESTOS",          {:rating => 7000 },
    "LPR",                {:rating => 7000 },
    "SBS",                {:rating => 2200 },
    "BREMBO",             {:rating => 9000 },
    "WAGNER",             {:rating => 2200 },
    "GREAT WALL",         {:rating => 2200 },
    "FACET",              {:rating => 8000 },
    "FAE",                {:rating => 8000 },
    "HANS PRIES",         {:rating => 7400 },
    "GLASER",             {:rating => 8000 },
    "PAYEN",              {:rating => 9000 },
    "VICTOR REINZ",       {:rating => 9000 },
    "AJUSA",              {:rating => 8000 },
    "GOETZE",             {:rating => 8000 },
    "ELRING",             {:rating => 8000 },
    "CLEAN FILTER",       {:rating => 2200 },
    "SOFIMA",             {:rating => 2200 },
    "LAUTRETTE",          {:rating => 8000 },
    "JP",                 {:rating => 8000 },
    "JP GROUP",           {:rating => 8000 },
    "PURFLUX",            {:rating => 8000 },
    "PIERBURG",           {:rating => 9000 },
    "SACHS",              {:rating => 9000 },
    "EBERSPACHER",        {:rating => 2200 },
    "EBERSPECHER",        {:rating => 2200 },
    "FRIG AIR",           {:rating => 2200 },
    "BEHR",               {:rating => 9000 },
    "XIN TIAN",           {:rating => 2200 },
    "DONGIL",             {:rating => 2200 },
    "GRAND PRIX",         {:rating => 2200 },
    "BESF1TS",            {:rating => 2200 },
    "AMD",                {:rating => 2200 },
    "BANDO",              {:rating => 9000 },
    "CONTITECH",          {:rating => 9000 },
    "BOSAL",              {:rating => 9000 },
    "TOP DRIVE",          {:rating => 2200 },
    "MITSUBOSHI",         {:rating => 9000 },
    "SUN",                {:rating => 8000 },
    "TOYOGUARD",          {:rating => 2200 },
    "FEDERAL MOGUL",      {:rating => 2200 },
    "TOYOPOWER",          {:rating => 2200 },
    "RIB-TOP",            {:rating => 2200 },
    "SAP",                {:rating => 2200 },
    "OPTIBELT",           {:rating => 2200 },
    "BLACKBELT",          {:rating => 2200 },
    "HINO",               {:rating => 2200 },
    "DONALDSON",          {:rating => 2200 },
    "BOGE",               {:rating => 9000 },
    "BILSTEIN",           {:rating => 8000 },
    "REMSA",              {:rating => 8000 },
    "QUICK BRAKE",        {:rating => 2200 },
    "OJD-QUICK BRAKE",    {:rating => 2200 },
    "OCAP",               {:rating => 2200 },
    "NAC",                {:rating => 2200 },
    "SIMER",              {:rating => 2200 },
    "FRI.TECH.",          {:rating => 2200 },
    "FENOX",              {:rating => 5000 },
    "ROADHOUSE",          {:rating => 8000 },
    "ORIGINAL BIRTH",     {:rating => 2200 },
    "LIQUI MOLY",         {:rating => 2200 },
    "TOKICO",             {:rating => 9000 },
    "MONROE",             {:rating => 8000 },
    "METELLI",            {:rating => 8000 },
    "GABRIEL",            {:rating => 2200 },
    "ZIMMERMANN",          {:rating => 9000 },
    "TRUSTING",           {:rating => 2200 },
    "FEL-PRO",            {:rating => 2200 },
    "AUGER",              {:rating => 2200 },
    "NSK",                {:rating => 9400 },
    "MANNOL",             {:rating => 2200 },
    "FBL",                {:rating => 2200 },
    "LUCAS",              {:rating => 8000, :ref => ["LUCAS / TRW"] },
    "MORSE",              {:rating => 2200 },
    "ADVICS",             {:rating => 9400 },
    "AISIN",              {:rating => 9400 },
    "AL-KO",              {:rating => 6000 },
    "ALKO",               {:rating => 6000, :ref => ["AL-KO"] },
    "CEVAM",              {:rating => 2200 },
    "SUMITOMO",           {:rating => 9400 },
    "STONE",              {:rating => 9000 },
    "SIGNEDA",            {:rating => 6000 },
    "SEIWA",              {:rating => 9000 },
    "SHINKAI",            {:rating => 5000 },
    "XYG",                {:rating => 7000 },
    "WIX",                {:rating => 7000 },
    "WAHLER",             {:rating => 8000 },
    "VTR",                {:rating => 5000 },
    "VIC",                {:rating => 9000 },
    "VDO",                {:rating => 9000 },
    "JURID",              {:rating => 9000 },
    "NGK",                {:rating => 9000 },
    "AE",                 {:rating => 8000 },
    "PEX",                {:rating => 2200 },
    "NGN",                {:rating => 2200 },
    "3F QUALITY",         {:rating => 2200 },
    "WINMAX",             {:rating => 2200 },
    "ALLIEDSIGNAL",       {:rating => 2200, :ref => ["ALLIED SIGNAL"] },
    "ALLIED SIGNAL",      {:rating => 2200 },
    "BERU",               {:rating => 8000 },
    "WEEN",               {:rating => 2200 },
    "LUCID",              {:rating => 2200 },
    "YIH SHENG",          {:rating => 2200 },
    "API",                {:rating => 2200 },
    "BODY PARTS",         {:rating => 2200 },
    "MOUNTAIN",           {:rating => 2200 },
    "KORTEX",             {:rating => 2200 },
    "MUSASHI",            {:rating => 9000 },
    "ПРАМО",              {:rating => 2200 },
    "BAW",                {:rating => 2200 },
    "MALO",               {:rating => 2200 },
    "SASIC",              {:rating => 2200 },
  ]
end
