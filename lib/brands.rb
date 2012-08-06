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
    "HYUNDAI / KIA",      {:rating => 5000, :brand => true, :ref => ["HYUNDAI", "KIA", "MOBIS"]},
    "HYUNDAI/KIA",        {:rating => 5000, :brand => true, :ref => ["HYUNDAI", "KIA", "MOBIS"]},
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
    "PEUGEOT / CITROEN",  {:rating => 5400, :brand => true, :ref => ["PEUGEOT", "CITROEN"] },
    "PEUGEOT/CITROEN",    {:rating => 5400, :brand => true, :ref => ["PEUGEOT", "CITROEN"] },
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
    "AKEBONO",            {:rating => 4700 },
    "NIBK",               {:rating => 4000 },
    "ALLIED NIPPON",      {:rating => 3000 },
    "SIDEM",              {:rating => 3000 },
    "FEBEST",             {:rating => 3000 },
    "NIPPARTS",           {:rating => 3700 },
    "JAPAN CARS",         {:rating => 1000 },
    "CHAMPION",           {:rating => 1000 },
    "MOBIS",              {:rating => 5000, :brand => true },
    "GENERAL MOTORS",     {:rating => 5000, :brand => true, :ref => ["CADILLAC", "CHEVROLET", "OPEL"] }, 
    "KYB",                {:rating => 4500 },
    "AIKO",               {:rating => 3500 },
    "ASHIKA",             {:rating => 3500 },
    "AVANTECH",           {:rating => 3500 },
    "BOSCH",              {:rating => 4500 },
    "TSN",                {:rating => 1500 },
    "PARTS-MALL",         {:rating => 4000 },
    "JS ASAKASHI",        {:rating => 3500 },
    "DENSO",              {:rating => 4000 },
    "DOLZ",               {:rating => 4000 },
    "DRIVE JOY",          {:rating => 4700 },
    "FILTRON",            {:rating => 3500 },
    "FRAM",               {:rating => 4000 },
    "GOODWILL",           {:rating => 3000 },
    "HENGST",             {:rating => 4000 },
    "HERTH+BUSS",         {:rating => 3700 },
    "JAPAN CARS",         {:rating => 3700 },
    "JS ASAKASHI",        {:rating => 3500 },
    "SCT",                {:rating => 3000 },
    "VAICO",              {:rating => 3500 },
    "VEMO",               {:rating => 3500 },
    "SAKURA",             {:rating => 3000 },
    "KOLBENSCHMIDT",      {:rating => 4700 },
    "MASUMA",             {:rating => 3200 },
    "MANN",               {:rating => 3500 },
    "JAPANPARTS",         {:rating => 3200 },
    "MAHLE / KNECHT",     {:rating => 4500 },
    "MAHLE",              {:rating => 4500, :ref => ["MAHLE / KNECHT"] },
    "KNECHT",             {:rating => 4500, :ref => ["MAHLE / KNECHT"] },
    "UNION",              {:rating => 4000 },
    "MICRO",              {:rating => 4500 },
    "VIC",                {:rating => 4500 },
    "VALEO",              {:rating => 4000 },
    "FEBEST",             {:rating => 3000 },
    "RBI",                {:rating => 2500 },
    "AMC",                {:rating => 1100 },
    "ARROW",              {:rating => 1100 },
    "DIRECT PARTS",       {:rating => 1100 },
    "MV PARTS",           {:rating => 1100 },
    "CONCORD",            {:rating => 1100 },
    "DELTA",              {:rating => 4000 },
    "RST",                {:rating => 1100 },
    "LYNXAUTO",           {:rating => 3500 },
    "VTR",                {:rating => 2500 },
    "CTR",                {:rating => 3500 },
    "TEKNOROT",           {:rating => 1100 },
    "SH AUTO PARTS",      {:rating => 1100 },
    "HANSE",              {:rating => 2500 },
    "SAT",                {:rating => 1100 },
    "STELLOX",            {:rating => 3000 },
    "SWAG",               {:rating => 4000 },
    "AKITAKA",            {:rating => 2500 },
    "FEBI",               {:rating => 3500 },
    "NAKAMOTO",           {:rating => 1100 },
    "MTP KEBONO",         {:rating => 1100 },
    "MTP",                {:rating => 1100 },
    "MEYLE",              {:rating => 4000 },
    "OPTIMAL",            {:rating => 3500 },
    "RTS",                {:rating => 1100 },
    "MOOG",               {:rating => 4000 },
    "QSTEN",              {:rating => 4500 },
    "LEMFORDER",          {:rating => 4500 },
    "ABS",                {:rating => 3500 },
    "DELPHI",             {:rating => 4000 },
    "TRUSTAUTO",          {:rating => 1100 },
    "BLUE PRINT",         {:rating => 3500 },
    "MOTORCRAFT",         {:rating => 1100 },
    "NK",                 {:rating => 3000 },
    "MAPCO",              {:rating => 3000 },
    "LONGHO",             {:rating => 1100 },
    "GMB",                {:rating => 4000 },
    "IMPERGOM",           {:rating => 3500 },
    "SNR",                {:rating => 4500 },
    "KOYO",               {:rating => 4700 },
    "SKF",                {:rating => 4500 },
    "PITWORK",            {:rating => 1100 },
    "LUK",                {:rating => 4500 },
    "TJB",                {:rating => 1100 },
    "INA",                {:rating => 4500 },
    "RUVILLE",            {:rating => 4000 },
    "DAYCO",              {:rating => 4000 },
    "ACDELCO",            {:rating => 4700 },
    "LOGEM",              {:rating => 1100 },
    "KITTO",              {:rating => 1100 },
    "AIKO-SAKURA",        {:rating => 3200 },
    "NISSENS",            {:rating => 4000 },
    "AVA",                {:rating => 3000 },
    "RCL",                {:rating => 1100 },
    "RCL RADIATORS",      {:rating => 1100 },
    "AKS",                {:rating => 1100 },
    "TERMAL",             {:rating => 1100 },
    "RAVENOL",            {:rating => 1100 },
    "LUCAS / TRW",        {:rating => 4000 },
    "TRW",                {:rating => 4000, :ref => ["LUCAS / TRW"] },
    "VEMA",               {:rating => 1100 },
    "NACHI",              {:rating => 4500 },
    "555",                {:rating => 4500 },
    "SINOLAR",            {:rating => 2500 },
    "FORTECH",            {:rating => 1100 },
    "UFI",                {:rating => 3500 },
    "BIG FILTER",         {:rating => 1100 },
    "JUST DRIVE",         {:rating => 3000 },
    "DEXTRIM",            {:rating => 1100 },
    "ALPHA FILTER",       {:rating => 1100 },
    "POWER-Q",            {:rating => 1100 },
    "MITWELL",            {:rating => 1100 },
    "888",                {:rating => 1100 },
    "TOPFILS",            {:rating => 3000 },
    "TECNECO FILTERS",    {:rating => 1100 },
    "AIRTEX",             {:rating => 4000 },
    "SALERI SIL",         {:rating => 1100 },
    "HEPU",               {:rating => 4500 },
    "MANDO",              {:rating => 4000 },
    "FBK",                {:rating => 1100 },
    "AMIWA",              {:rating => 1100 },
    "KONSTEIN",           {:rating => 1100 },
    "AKYOTO",             {:rating => 2500 },
    "SANGSIN BRAKE",      {:rating => 1100 },
    "KASHIYAMA",          {:rating => 3000 },
    "TEXTAR",             {:rating => 4500 },
    "GBS",                {:rating => 1100 },
    "ICER",               {:rating => 3500 },
    "MINTEX",             {:rating => 3500 },
    "PAGID",              {:rating => 4500 },
    "FERODO",             {:rating => 4000 },
    "GIRLING",            {:rating => 4000 },
    "BENDIX",             {:rating => 1100 },
    "NISSHINBO",          {:rating => 4500 },
    "JNBK",               {:rating => 3000 },
    "FRICTIONMASTER",     {:rating => 4000 },
    "ATE",                {:rating => 4500 },
    "KAVO PARTS",         {:rating => 1100 },
    "NTN",                {:rating => 4700 },
    "ASVA",               {:rating => 2500 },
    "ORIPARTS",           {:rating => 3800 },
    "ALCO FILTERS",       {:rating => 3500 },
    "ZAFFO",              {:rating => 1100 },
    "M2",                 {:rating => 1100 },
    "DORIA",              {:rating => 1100 },
    "BREMI",              {:rating => 4000 },
    "SURE FILTER",        {:rating => 1100 },
    "CORTECO",            {:rating => 4000 },
    "NITTO",              {:rating => 1100 },
    "GATES",              {:rating => 4500 },
    "X5 RESOURCE",        {:rating => 1100 },
    # TODO Удалить, когда сделаю нормально производителей
    "ТОЧКА ОПОР",         {:rating => 3500 },
    "ТОЧКА ОПОРЫ",        {:rating => 3500 },
    "BEST GEAR",          {:rating => 1100 },
    "BESTGEAR",           {:rating => 1100 },
    "GTR",                {:rating => 1100 },
    "ПОЛИУРЕТАН",         {:rating => 1100 },
    "CTC",                {:rating => 1100 },
    "AP",                 {:rating => 1100 },
    "TONG YANG",          {:rating => 1100 },
    "HELLA",              {:rating => 4500 },
    "SFEC",               {:rating => 1100 },
    "STARMANN",           {:rating => 3000 },
    "FLENNOR",            {:rating => 3500 },
    "TYG",                {:rating => 3000 },
    "TYC",                {:rating => 3000 },
    "DEPO",               {:rating => 4000 },
    "INTERCARS",          {:rating => 1100 },
    "RAYBESTOS",          {:rating => 3500 },
    "LPR",                {:rating => 3500 },
    "SBS",                {:rating => 1100 },
    "BREMBO",             {:rating => 4500 },
    "WAGNER",             {:rating => 1100 },
    "GREAT WALL",         {:rating => 1100 },
    "FACET",              {:rating => 4000 },
    "FAE",                {:rating => 4000 },
    "HANS PRIES",         {:rating => 3700 },
    "GLASER",             {:rating => 4000 },
    "PAYEN",              {:rating => 4500 },
    "VICTOR REINZ",       {:rating => 4500 },
    "AJUSA",              {:rating => 4000 },
    "GOETZE",             {:rating => 4000 },
    "ELRING",             {:rating => 4000 },
    "CLEAN FILTER",       {:rating => 1100 },
    "SOFIMA",             {:rating => 1100 },
    "LAUTRETTE",          {:rating => 4000 },
    "JP",                 {:rating => 4000 },
    "JP GROUP",           {:rating => 4000 },
    "PURFLUX",            {:rating => 4000 },
    "PIERBURG",           {:rating => 4500 },
    "SACHS",              {:rating => 4500 },
    "EBERSPACHER",        {:rating => 1100 },
    "EBERSPECHER",        {:rating => 1100 },
    "FRIG AIR",           {:rating => 1100 },
    "BEHR",               {:rating => 4500 },
    "XIN TIAN",           {:rating => 1100 },
    "DONGIL",             {:rating => 1100 },
    "GRAND PRIX",         {:rating => 1100 },
    "BESF1TS",            {:rating => 1100 },
    "AMD",                {:rating => 1100 },
    "BANDO",              {:rating => 4500 },
    "CONTITECH",          {:rating => 4500 },
    "BOSAL",              {:rating => 4500 },
    "TOP DRIVE",          {:rating => 1100 },
    "MITSUBOSHI",         {:rating => 4500 },
    "SUN",                {:rating => 4000 },
    "TOYOGUARD",          {:rating => 1100 },
    "FEDERAL MOGUL",      {:rating => 1100 },
    "TOYOPOWER",          {:rating => 1100 },
    "RIB-TOP",            {:rating => 1100 },
    "SAP",                {:rating => 1100 },
    "OPTIBELT",           {:rating => 1100 },
    "BLACKBELT",          {:rating => 1100 },
    "HINO",               {:rating => 1100 },
    "DONALDSON",          {:rating => 1100 },
    "BOGE",               {:rating => 4500 },
    "BILSTEIN",           {:rating => 4000 },
    "REMSA",              {:rating => 4000 },
    "QUICK BRAKE",        {:rating => 1100 },
    "OJD-QUICK BRAKE",    {:rating => 1100 },
    "OCAP",               {:rating => 1100 },
    "NAC",                {:rating => 1100 },
    "SIMER",              {:rating => 1100 },
    "FRI.TECH.",          {:rating => 1100 },
    "FENOX",              {:rating => 2500 },
    "ROADHOUSE",          {:rating => 4000 },
    "ORIGINAL BIRTH",     {:rating => 1100 },
    "LIQUI MOLY",         {:rating => 1100 },
    "TOKICO",             {:rating => 4500 },
    "MONROE",             {:rating => 4000 },
    "METELLI",            {:rating => 4000 },
    "GABRIEL",            {:rating => 1100 },
    "ZIMMERMANN",          {:rating => 4500 },
    "TRUSTING",           {:rating => 1100 },
    "FEL-PRO",            {:rating => 1100 },
    "AUGER",              {:rating => 1100 },
    "NSK",                {:rating => 4700 },
    "MANNOL",             {:rating => 1100 },
    "FBL",                {:rating => 1100 },
    "LUCAS",              {:rating => 4000, :ref => ["LUCAS / TRW"] },
    "MORSE",              {:rating => 1100 },
    "ADVICS",             {:rating => 4700 },
    "AISIN",              {:rating => 4700 },
    "AL-KO",              {:rating => 3000 },
    "ALKO",               {:rating => 3000, :ref => ["AL-KO"] },
    "CEVAM",              {:rating => 1100 },
    "SUMITOMO",           {:rating => 4700 },
    "STONE",              {:rating => 4500 },
    "SIGNEDA",            {:rating => 3000 },
    "SEIWA",              {:rating => 4500 },
    "SHINKAI",            {:rating => 2500 },
    "XYG",                {:rating => 3500 },
    "WIX",                {:rating => 3500 },
    "WAHLER",             {:rating => 4000 },
    "VTR",                {:rating => 2500 },
    "VIC",                {:rating => 4500 },
    "VDO",                {:rating => 4500 },
    "JURID",              {:rating => 4500 },
    "NGK",                {:rating => 4500 },
    "AE",                 {:rating => 4000 },
    "PEX",                {:rating => 1100 },
    "NGN",                {:rating => 1100 },
    "3F QUALITY",         {:rating => 1100 },
    "WINMAX",             {:rating => 1100 },
    "ALLIEDSIGNAL",       {:rating => 1100, :ref => ["ALLIED SIGNAL"] },
    "ALLIED SIGNAL",      {:rating => 1100 },
    "BERU",               {:rating => 4000 },
    "WEEN",               {:rating => 1100 },
    "LUCID",              {:rating => 1100 },
    "YIH SHENG",          {:rating => 1100 },
    "API",                {:rating => 1100 },
    "BODY PARTS",         {:rating => 1100 },
    "MOUNTAIN",           {:rating => 1100 },
    "KORTEX",             {:rating => 1100 },
    "MUSASHI",            {:rating => 4500 },
    "ПРАМО",              {:rating => 1100 },
    "BAW",                {:rating => 1100 },
    "MALO",               {:rating => 1100 },
    "SASIC",              {:rating => 1100 },
  ]
end
