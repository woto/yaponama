# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)
#ten = (1000000000 + rand(8999999999)).to_s
#10.times do
#  user = User.create(:user_name => ten, :phone => ten, :encrypted_password => "$2a$10$Q3cM.pLNZ4bsPV6CtpuZo.JGgXyiCxlClaVavDwdv6NCVSBRwmsDy", :confirmed_at => "2011-12-17 16:01:49.833083")
#  10.times do
#    ten = (1000000000 + rand(8999999999)).to_s
#    car = Car.create(:frame => ten, :vin => '', :model => '', :god => '', :marka => '')
#    user.cars << car
#    car.save
#    10.times do
#      ten = (1000000000 + rand(8999999999)).to_s
#      request = Request.create(:car => car, :user_id => user.id)
#      10.times do
#        ten = (1000000000 + rand(8999999999)).to_s
#        message = Message.create(:request => request, :message => ten, :user_id => user.id)
#        request.messages << message
#        message.save
#      end
#    end
#  end
# end
bottom_right = Block.find_or_initialize_by_block_name('bottom_right')
bottom_right.update_attributes({
:content => '<a href="/обмен-статьями-и-ссылками">Вебмастерам</a><br /><a href="/поставщикам-автозапчастей">Поставщикам автозапчастей</a'})

blockquote = Block.find_or_initialize_by_block_name('blockquote')
blockquote.update_attributes({
:content => '<blockquote> <p>Спасибо коллективу компании. Заказанные запчасти на японца получил в срок и дешево, в следующий раз обязательно вернусь именно к вам.</p> <small>Андрей Иванов, покупатель</small> </blockquote>'})

google_analytics = Block.find_or_initialize_by_block_name('google_analytics')
google_analytics.update_attributes({
:content => "<!-- Google Analytics -->\r\n <script type=\"text/javascript\">\r\n var _gaq = _gaq || [];\r\n _gaq.push(['_setAccount', 'UA-28167315-1']);\r\n _gaq.push(['_trackPageview']);\r\n \r\n (function() {\r\n var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;\r\n ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';\r\n var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);\r\n })();\r\n </script>\r\n"})

yandex_metrika = Block.find_or_initialize_by_block_name('yandex_metrika')
yandex_metrika.update_attributes({
:content => "<!-- Yandex.Metrika counter -->\r\n <div style=\"display:none;\"><script type=\"text/javascript\">\r\n (function(w, c) {\r\n (w[c] = w[c] || []).push(function() {\r\n try {\r\n w.yaCounter11728048 = new Ya.Metrika({id:11728048, enableAll: true, trackHash:true, webvisor:true});\r\n }\r\n catch(e) { }\r\n });\r\n })(window, \"yandex_metrika_callbacks\");\r\n </script></div>\r\n <script src=\"//mc.yandex.ru/metrika/watch.js\" type=\"text/javascript\" defer=\"defer\"></script>\r\n <noscript><div><img src=\"//mc.yandex.ru/watch/11728048\" style=\"position:absolute; left:-9999px;\" alt=\"\" /></div></noscript>\r\n"})

live_internet = Block.find_or_initialize_by_block_name('live_internet')
live_internet.update_attributes({
:content => ""})

rambler_top100 = Block.find_or_initialize_by_block_name('rambler_top100')
rambler_top100.update_attributes({
:content => ""})

mail_raiting = Block.find_or_initialize_by_block_name('mail_raiting')
mail_raiting.update_attributes({
:content => ""})

openstat = Block.find_or_initialize_by_block_name('openstat')
openstat.update_attributes({
:content => ''})

sideblock_1 = Block.find_or_initialize_by_block_name('sideblock_1')
sideblock_1.update_attributes({
:content => '    <h6> Доставляем:</h6>
<p style="text-align: center; ">
<img alt="" src="/assets/delivery/ems.png" style="width: 200px; height: 50px; " /></p>
<p style="text-align: center; ">
<img alt="" src="/assets/delivery/russian_post.png" style="width: 200px; height: 50px; " /></p>
<h6>
Принимаем оплату:</h6>
<p style="text-align: center; ">
<img alt="" src="/assets/payment/PCR.gif" style="width: 135px; height: 80px; " /><br />
<img alt="" src="/assets/payment/WMRM.gif" style="width: 135px; height: 80px; " /></p>
<p style="text-align: center; ">
<img alt="" src="/assets/payment/RapidaOceanSvyaznoyR.gif" style="cursor: default; width: 135px; height: 80px; " /></p>
<p style="text-align: center; ">
<img alt="alt" src="/assets/payment/RapidaOceanEurosetR.gif" style="cursor: default; width: 135px; height: 80px; " /></p>
<p style="text-align: center; ">
<img alt="" src="/assets/payment/QiwiR.gif" style="width: 135px; height: 80px; " /></p>
<p style="text-align: center; ">
<img alt="" src="/assets/payment/BANKOCEANMR.gif" style="width: 135px; height: 80px; " /></p>
'})

sideblock_2 = Block.find_or_initialize_by_block_name('sideblock_2')
sideblock_2.update_attributes({
:content => ''})

copyright = Block.find_or_initialize_by_block_name('copyright')
copyright.update_attributes({
:content => "&copy; Yaponama 2012"})

title = Block.find_or_initialize_by_block_name('title')
title.update_attributes({
:content => "Японама (Yaponama)"})

header = Block.find_or_initialize_by_block_name('header')
header.update_attributes({
:content => "Yaponama.ru"})

hero_unit = Block.find_or_initialize_by_block_name('hero_unit')
hero_unit.update_attributes({
:content => "<h1>Добро пожаловать!</h1> <p>Рады, что вы посетили наш магазин автозапчастей <strong>Японама</strong>, надеемся вам понравятся наш ассортимент и цены. Если вы знаете каталожный номер автозапчасти, то можете приступить к поиску прямо сейчас или связаться с нашим менеджером, для консультации и подбора.</p>"})

hero_unit_mobile = Block.find_or_initialize_by_block_name('hero_unit_mobile')
hero_unit_mobile.update_attributes({
:content => "Главная страница"})

meta_description_default = Block.find_or_initialize_by_block_name('meta_description_default')
meta_description_default.update_attributes({
:content => 'Рады, что вы посетили наш магазин автозапчастей Японама (Yaponama), надеемся вам понравятся наш ассортимент и цены. Если вы знаете каталожный номер автозапчасти, то можете приступить к поиску прямо сейчас или связаться с нашим менеджером, для консультации и подбора.'})

meta_keywords_default = Block.find_or_initialize_by_block_name('meta_keywords_default')
meta_keywords_default.update_attributes({
:content => 'Автозапчасти, Россия, Почта России, Доставка, Москва, TOYOTA, NISSAN, MITSUBISHI'})

checkout_recipient = Block.find_or_initialize_by_block_name('checkout_recipient')
checkout_recipient.update_attributes({
:content => 'ИП Корнев Руслан Михайлович'})

checkout_inn = Block.find_or_initialize_by_block_name('checkout_inn')
checkout_inn.update_attributes({
:content => '245719329605'})

checkout_account = Block.find_or_initialize_by_block_name('checkout_account')
checkout_account.update_attributes({
:content => '40802810300000010946'})

checkout_bik = Block.find_or_initialize_by_block_name('checkout_bik')
checkout_bik.update_attributes({
:content => '044579918'})

checkout_bank = Block.find_or_initialize_by_block_name('checkout_bank')
checkout_bank.update_attributes({
:content => 'СБ Банк (ООО)'})

checkout_correspondent = Block.find_or_initialize_by_block_name('checkout_correspondent')
checkout_correspondent.update_attributes({
:content => '30101810600000000918'})

call_me = Block.find_or_initialize_by_block_name('call_me')
call_me.update_attributes({
:content => '<p>Выбились из сил в поисках нужных деталей? Просто введите номер телефона и ожидайте звонка оператора магазина.</p>'})

manager_free_time = Block.find_or_initialize_by_block_name('manager_free_time')
manager_free_time.update_attributes({
:content => '<p>Извините, мендежер сможет перезвонить вам не ранее чем после 10:00 по московскому времени.</p>'})

catalog = Page.find_or_initialize_by_path("catalog")
catalog.update_attributes({
  :title => "Автомобильные каталоги", 
  :default_content => '<h1> Автомобильные каталоги</h1> <p> Ниже вы можете посмотреть ссылки на имеющуюся&nbsp;в интернете справочную информацию по автомобильным каталогам. Вы можете самостоятельно&nbsp;поискать каталожный номер (артикул)&nbsp;интересующей вас запчасти. Сразу оговоримся, что в них&nbsp;не исключены ошибочные сведения. Если вы боитесь ошибиться или не владеете соответствующими знаниями, то рекомендуем просто воспользоваться нашей <a href="/requests">формой по подбору запчастей</a>.&nbsp;Вы будете максимально быстро уведомлены посредством смс о подобранной запчасти.</p> <p> Иначе&nbsp;после перехода по ссылке интересующего вас каталога у вас откроется новое окно браузера, в котором будет представлен автокаталог, т.к. эта справочная информация не принадлежит нам, то непосредственно после щелчка на номере автозапчасти вы попадете в какой-либо магазин, в зависимости от того чьи интересы представляет автокаталог. Далее вам остается вернуться на наш сайт и просто ввести номер найденной детали в строку поиска. Будьте осторожны с выбором цены, очень часто автомобильные сайты с целью завлечения покупателей предлагают заведомо низкие цены, которые могут предложить только оптовым покупателям, осуществляющим закупку на миллионы рублей в месяц.</p> <p> &nbsp;</p> <ul> <li> Alfa-Romeo (<a href="http://goo.gl/xzcJI" target="_blank">каталог 1</a>, <a href="http://goo.gl/oYTWD" target="_blank">каталог 2</a>)</li> <li> Audi (<a href="http://goo.gl/EYTL2" target="_blank">каталог 1</a>, <a href="http://goo.gl/IPqik" target="_blank">каталог 2</a>, <a href="http://goo.gl/gHMVT" target="_blank">каталог 3</a>, <a href="http://goo.gl/wo72o" target="_blank">каталог 4</a>)</li> <li> BMW (<a href="http://goo.gl/yudTj" target="_blank">каталог 1</a>, <a href="http://goo.gl/oIElD" target="_blank">каталог 2</a>, <a href="http://goo.gl/gMDVX" target="_blank">каталог 3</a>, <a href="http://goo.gl/GXY9M" target="_blank">каталог 4</a>, <a href="http://goo.gl/r86P2" target="_blank">каталог 5</a>)</li> <li> CHERY (<a href="http://goo.gl/jVt3S" target="_blank">каталог 1</a>)</li> <li> Chevrolet (<a href="http://goo.gl/G3c1q" target="_blank">каталог 1</a>)</li> <li> Chrysler (<a href="http://goo.gl/VBvRD" target="_blank">каталог 1</a>, <a href="http://goo.gl/4VZyf" target="_blank">каталог 2</a>, <a href="http://goo.gl/cESgK" target="_blank">каталог 3</a>)</li> <li> Citroen (<a href="http://goo.gl/c1hVa" target="_blank">каталог 1</a>, <a href="http://goo.gl/U2fVu" target="_blank">каталог 2</a>)</li> <li> Daewoo (<a href="http://goo.gl/Be5YF" target="_blank">каталог 1</a>, <a href="http://goo.gl/cBh04" target="_blank">каталог 2</a>)</li> <li> Daihatsu (<a href="http://goo.gl/LvJz3" target="_blank">каталог 1</a>)</li> <li> Dodge (<a href="http://goo.gl/e4EPG" target="_blank">каталог 1</a>)</li> <li> Faw (<a href="http://goo.gl/GYz14" target="_blank">каталог 1</a>)</li> <li> FIAT (<a href="http://goo.gl/kJvbP" target="_blank">каталог 1</a>, <a href="http://goo.gl/FBasb" target="_blank">каталог 2</a>)</li> <li> Ford (<a href="http://goo.gl/NuyVq" target="_blank">каталог 1</a>, <a href="http://goo.gl/VS1SF" target="_blank">каталог 2</a>, <a href="http://goo.gl/ofGeq" target="_blank">каталог 3</a>, <a href="http://goo.gl/ODMDN" target="_blank">каталог 4</a>)</li> <li> Geely (<a href="http://goo.gl/yxDrF" target="_blank">каталог 1</a>)</li> <li> Honda (<a href="http://goo.gl/uaop5" target="_blank">каталог 1</a>, <a href="http://goo.gl/1cpyO" target="_blank">каталог 2</a>, <a href="http://goo.gl/wuNnC" target="_blank">каталог 3</a>, <a href="http://goo.gl/z8MWB" target="_blank">каталог 4</a>, <a href="http://goo.gl/x6qRY" target="_blank">каталог 5</a>)</li> <li> Hyundai (<a href="http://goo.gl/VXkj8" target="_blank">каталог 1</a>, <a href="http://goo.gl/eVAem" target="_blank">каталог 2</a>, <a href="http://goo.gl/IS9D6" target="_blank">каталог 3</a>, <a href="http://goo.gl/gDIqV" target="_blank">каталог 4</a>)</li> <li> Infiniti (<a href="http://goo.gl/reBhR" target="_blank">каталог 1</a>, <a href="http://goo.gl/3hiRp" target="_blank">каталог 2</a>)</li> <li> Isuzu (<a href="http://goo.gl/VdrlD" target="_blank">каталог 1</a>, <a href="http://goo.gl/wB9y5" target="_blank">каталог 2</a>)</li> <li> Jaguar (<a href="http://goo.gl/3lu5A" target="_blank">каталог 1</a>)</li> <li> Jeep (<a href="http://goo.gl/wZVH1" target="_blank">каталог 1</a>, <a href="http://goo.gl/0Px5G" target="_blank">каталог 2</a>)</li> <li> KIA (<a href="http://goo.gl/q5iaS" target="_blank">каталог 1</a>, <a href="http://goo.gl/Ii9LS" target="_blank">каталог 2</a>, <a href="http://goo.gl/0trfO" target="_blank">каталог 3</a>, <a href="http://goo.gl/wHF3p" target="_blank">каталог 4</a>)</li> <li> Land Rover (<a href="http://goo.gl/iZBm3" target="_blank">каталог 1</a>)</li> <li> Lexus (<a href="http://goo.gl/Rct7i" target="_blank">каталог 1</a>, <a href="http://goo.gl/DOzhR" target="_blank">каталог 2</a>, <a href="http://goo.gl/3FXt7" target="_blank">каталог 3</a>, <a href="http://goo.gl/CRCei" target="_blank">каталог 4</a>)</li> <li> MAN (<a href="http://goo.gl/DntyD" target="_blank">каталог 1</a>)</li> <li> Mazda (<a href="http://goo.gl/NIejV" target="_blank">каталог 1</a>, <a href="http://goo.gl/zNqf8" target="_blank">каталог 2</a>, <a href="http://goo.gl/wpUr8" target="_blank">каталог 3</a>, <a href="http://goo.gl/dZMoL" target="_blank">каталог 4</a>, <a href="http://goo.gl/yMVMf" target="_blank">каталог 5</a>)</li> <li> Mercedes-Benz (<a href="http://goo.gl/ZnSgY" target="_blank">каталог 1</a>, <a href="http://goo.gl/SjOwu" target="_blank">каталог 2</a>, <a href="http://goo.gl/F5mnQ" target="_blank">каталог 3</a>, <a href="http://goo.gl/yq1Pw" target="_blank">каталог 4</a>)</li> <li> MINI (<a href="http://goo.gl/zLV4Z" target="_blank">каталог 1</a>)</li> <li> Mitsubishi (<a href="http://goo.gl/dGCeX" target="_blank">каталог 1</a>, <a href="http://goo.gl/SCay6" target="_blank">каталог 2</a>, <a href="http://goo.gl/m869g" target="_blank">каталог 3</a>, <a href="http://goo.gl/QplHD" target="_blank">каталог 4</a>, <a href="http://goo.gl/EOeWO" target="_blank">каталог 5</a>)</li> <li> Nissan (<a href="http://goo.gl/sFfI9" target="_blank">каталог 1</a>, <a href="http://goo.gl/vnzqS" target="_blank">каталог 2</a>, <a href="http://goo.gl/PQM8P" target="_blank">каталог 3</a>, <a href="http://goo.gl/mPL1M" target="_blank">каталог 4</a>, <a href="http://goo.gl/qai5o" target="_blank">каталог 5</a>)</li> <li> Opel (<a href="http://goo.gl/jTtmo" target="_blank">каталог 1</a>, <a href="http://goo.gl/GMyEj" target="_blank">каталог 2</a>)</li> <li> Peugeot (<a href="http://goo.gl/48zEt" target="_blank">каталог 1</a>, <a href="http://goo.gl/DzA70" target="_blank">каталог 2</a>)</li> <li> Renault (<a href="http://goo.gl/qnl7C" target="_blank">каталог 1</a>, <a href="http://goo.gl/PJsoh" target="_blank">каталог 2</a>)</li> <li> Rover (<a href="http://goo.gl/H5Mpm" target="_blank">каталог 1</a>)</li> <li> SAAB (<a href="http://goo.gl/RlSZ4" target="_blank">каталог 1</a>, <a href="http://goo.gl/0PXfs" target="_blank">каталог 2</a>)</li> <li> Seat (<a href="http://goo.gl/5jTRe" target="_blank">каталог 1</a>, <a href="http://goo.gl/Mk8rS" target="_blank">каталог 2</a>, <a href="http://goo.gl/Jq0GZ" target="_blank">каталог 3</a>)</li> <li> Skoda (<a href="http://goo.gl/CZfMI" target="_blank">каталог 1</a>, <a href="http://goo.gl/7S29s" target="_blank">каталог 2</a>, <a href="http://goo.gl/ieLDt" target="_blank">каталог 3</a>, <a href="http://goo.gl/nFmPP" target="_blank">каталог 4</a>)</li> <li> SsangYong (<a href="http://goo.gl/ux5FJ" target="_blank">каталог 1</a>, <a href="http://goo.gl/kNQzG" target="_blank">каталог 2</a>, <a href="http://goo.gl/Emw46" target="_blank">каталог 3</a>)</li> <li> Subaru (<a href="http://goo.gl/uLGl4" target="_blank">каталог 1</a>, <a href="http://goo.gl/Mrtm2" target="_blank">каталог 2</a>, <a href="http://goo.gl/7Vj5K" target="_blank">каталог 3</a>, <a href="http://goo.gl/DBdYA" target="_blank">каталог 4</a>)</li> <li> Suzuki (<a href="http://goo.gl/Z13xN" target="_blank">каталог 1</a>, <a href="http://goo.gl/mstvN" target="_blank">каталог 2</a>, <a href="http://goo.gl/4kUgq" target="_blank">каталог 3</a>, <a href="http://goo.gl/SmkKx" target="_blank">каталог&nbsp;4</a>, <a href="http://goo.gl/1qSUZ" target="_blank">каталог 5</a>)</li> <li> Toyota (<a href="http://goo.gl/khlul" target="_blank">каталог 1</a>, <a href="http://goo.gl/RbQhJ" target="_blank">каталог 2</a>, <a href="http://goo.gl/hE6sd" target="_blank">каталог 3</a>, <a href="http://goo.gl/7wm6y" target="_blank">каталог 4</a>, <a href="http://goo.gl/KXmD1" target="_blank">каталог 5</a>, <a href="http://goo.gl/0qqU1" target="_blank">каталог 6</a>)</li> <li> Volkswagen (<a href="http://goo.gl/QVngY" target="_blank">каталог 1</a>, <a href="http://goo.gl/2naU1" target="_blank">каталог 2</a>, <a href="http://goo.gl/xTg65" target="_blank">каталог 3</a>)</li> <li> Volvo&nbsp;(<a href="http://goo.gl/OMCRo" target="_blank">каталог 1</a>, <a href="http://goo.gl/FO0mX" target="_blank">каталог 2</a>)</li> </ul>'})
  misspelled = Page.find_or_initialize_by_path('misspelled')
  misspelled.update_attributes({
    :title => "Опечатки",
    :default_content => '<h1> Опечатки</h1> <p> Порою, как и все люди мы ошибаемся, в том числе и при наборе текста на компьютере, поэтому мы предусмотрительно собрали здесь самые распространенные опечатки при наборе адреса нашего сайта.</p> <ul> <li> Япона Ма</li> <li> Япона ма ру</li> <li> Япона ма.ру</li> <li> Японамама</li> <li> японамама ру</li> <li> японамама.ру</li> <li> Япона</li> <li> Япона&nbsp;ру</li> <li> Япона.ру</li> <li> Япония</li> <li> Япония ру</li> <li> Япония.ру</li> </ul> <p> Запомнить ардес нашего сайта легко!</p> <h2 style="text-align: center; "> <a href="http://www.yaponama.ru">www.yaponama.ru</a></h2> <p> &nbsp;</p> <p> &nbsp;</p>'})


  contacts = Page.find_or_initialize_by_path('contacts')
  contacts.update_attributes({
    :title => "Контакты",
    :default_content => "<h2> Контактная информация</h2> <div> <div> Skype: woto-ru</div> <div> ICQ: 109666888</div> <div> e-mail: <script> document.write('<a href=\"mai' + 'lto:info@' + 'yaponama.ru\">'+ 'info@' + 'yaponama.ru' + '</a>') </script></div> <div> МТС: +7 (916) 907-27-88</div> </div> <h2> &nbsp;</h2> <h2> Банковские реквизиты</h2> <div> Расчетный счет 40802810300000010946</div> <div> &nbsp;</div> <div> СБ БАНК (ООО) г. Москва</div> <div> БИК 044579918</div> <div> к/сч 30101810600000000918</div> <div> ИНН 7723008300</div> <div> КПП 775001001</div> <div> <br /> &nbsp;</div> <h2> Сведения о регистрации</h2> <div> И.П. Корнев Руслан Михайлович</div> <div> ИНН: 245719329605</div> <div> ОГРНИП: 312501203100041</div> <div> &nbsp;</div> <div> <a href=\"/assets/documents/inn.jpg\"><img src=\"/assets/documents/inn_thumb.jpg\" /></a>&nbsp;<img /><a href=\"/assets/documents/ogrnip.jpg\"><img src=\"/assets/documents/ogrnip_thumb.jpg\" /></a></div> <div> &nbsp;</div> <div> <a href=\"http://service.nalog.ru/uwsfind.do\">Проверка сведений на сайте Федеральной Налоговой Службы</a></div> <div> &nbsp;</div> <div> <a href=\"/assets/documents/nalog.jpg\"><img src=\"/assets/documents/nalog_thumb.jpg\" /></a></div> <div> &nbsp;</div>"})


  delivery = Page.find_or_initialize_by_path('delivery')
  delivery.update_attributes({
    :title => "Доставка",
    :keyword => "Доставка, Почта России, Отправка Почтой России, Отправляем в регионы, Доставка по России, Ценная бандероль первого класса",
    :description => "В нашем интернет магазине вы можете купить автозапчасти с доставкой ценной бандеролью первого класса в кратчайшие сроки по России почтой.",
    :robots => "index, follow",
    :default_content => "<h1> Доставка</h1> <p> Уважаемые покупатели, обратите пожалуйста внимание на то, что мы не взымаем плату за доставку, вы оплачиваете только почтовые расходы. Оценочная стомость доставки будет произведена после совершения заказа. В случае переплаты за почтовые расходы сумма сохраняется на вашем внутреннем счете и учитывается при следующем заказе.</p> <p> Мы стараемся любыми способами сохранить низкую и привлекательную конечную цену для наших покупателей!</p> <hr> <h3 style='text-align: center; '> Бандероль первого класса с объявленной ценностью</h3> <p> <strong>Допустимые вложения:</strong></p> <ul> <li> Вес бандероли не должен превышать 2,5 кг.</li> <li> Размер любой из сторон не должен превышать 36 сантиметров, а сумма трех измерений не должна превышать 70 сантиметров.</li> </ul> <p> <strong>Стоимость:</strong></p> <p> На стоимость отправления влиет только вес и объявленная ценность, независимо от места нахождения получателя. Стоимость доставки складывается таким образом:</p> <ul> <li> Бандероль с объявленной ценностью массой до 100 г - 105,93 р.&nbsp;</li> <li> Дополнительно взимается плата за каждые последующие полные/неполные 100 г массы - 12 р.</li> <li> Дополнительно взимается плата за каждый полный или неполный 1 рубль оценочной стоимости - 0,03 р.</li> </ul> <p> <strong>Сроки:</strong></p> <p> Этот способ доставки является самым быстрым. Доставка производится авиа путём. Средний срок доставки 3-8 дней.</p> <p> <strong>Примеры:</strong></p> <p> <a href='http://www.yaponama.ru/info/MB290013/MITSUBISHI'>Упаковка из двух сальников&nbsp;MB290013 (MITSUBISHI)</a>, стоимость почтовых расходов - 173 р.<br> <a href='http://www.yaponama.ru/info/PN0365/NIBK'>Тормозные колодки PN0365 (NIBK)</a>&nbsp;- стоимость почтовых расходов 369 р.</p> <p> Подробнее о данном способе отправления можете ознакомиться на странице почты России:&nbsp;<a target='_blank' href='http://www.russianpost.ru/rp/servise/ru/home/postuslug/1class'>Отправления 1 класса</a>, <a target='_blank' href='http://www.russianpost.ru/rp/servise/ru/home/postuslug/1class/1class_tariffs'>Тарифы на пересылку</a>, <a target='_blank' href='http://www.russianpost.ru/rp/servise/ru/home/postuslug/1class/1class_deadline'>Контрольные сроки</a></p> <hr> <h3 style='text-align: center; '> Прочие способы доставки</h3> <p> Запчасти, которые невозможно отправить ценной бандеролью отправляются посылкой через Почту России, точные сроки и стоимость выясняются после получения вашего заказа и адреса доставки, т.к. на них влияют и удаленность и сезонность. Так же мы готовы рассмотреть вариант отправки желаемой вами транспортной компанией.</p>"})



  payment = Page.find_or_initialize_by_path('обмен-статьями-и-ссылками')
  payment.update_attributes({
    :title => "Обмен статьями и ссылками",
    :keyword => "обмен ссылками, обмен статьями, обмен материалом, размещу вашу статью, опубликую ваш материал на своем сайте, ссылка на станцию технического обслуживания, обменяюсь ссылкой по тематике автомобилей, сто, магазин шин ",
    :description => "Обменяюсь бесплатно ссылками на интересный контент. Размещу ваш материал или ссылку на своем сайте бесплатно или обменяюсь ссылками с авто тематикой, сто, магазинами шин",
    :default_content => '<h1> Обмен статьями и ссылками</h1> <p> Уважаемые коллеги - веб мастера, SEO оптимизаторы и владельцы сайтов, это обращение нацелено на вас, если вы понимаете значимость обмена полезным материалом, а так же рекомендательными ссылками, то пропустите этот блок и опускайтесь в самый низ страницы.<br> &nbsp;</p> <blockquote> <p> Ссылки &mdash; важнейшая составляющая интернета. Они связывают между собой страницы всемирной паутины и являются тропинками, по которым ходят пользователи. Поэтому очень важно уделить внимание ссылкам, которыми ваш сайт связан с внешним миром</p> <small><a href="http://help.yandex.ru/webmaster/?id=1108950">Цитата из сборника Рекомендаций Яндекса</a></small></blockquote> <p> <br> Обмен ссылками не только полезен для улучшения видимости сайта в поисковых системах, но и полезен для конечных пользователей ищущих ответ на свой вопрос. Злоупотребление размещением платных ссылок на высокотрастовых сайтах заставило потрать немало сил у инженеров, разрабатывающих поисковые системы, с целью &nbsp;отделить не естественные (платные) ссылки, которыми пытаются манипулировать, от естественных, которые разместил реальный человек (порекомендовал, поделился мнением, описал историю и т.д.). Поэтому ручное размещение ссылок достойно заняло нишу в наборе инструментов вебмастеров по развитию сайтов. Немаловажную роль в ручном размещении ссылок так же играет тематика сайта. Согласитесь, если поисковая система видит много ссылок не связанных с тематикой сайта, то начинает воспринимать сайт либо с подозрением, либо относит его к другой категории (например каталог ссылок, доска объявлений и т.д.) Помимо обмена ссылками есть понятие обмена статьями. В нынешнее время, когда поисковые системы становятся все умне и умнее, размещение гостевых публикаций на дружественных сайтах в различных разделах (например новостях, вопросах-ответах и т.д.) является чуть ли не самым лучшим способом улучшения позиций сайта в поисковой выдаче. Но стоит так же помнить, что простой обмен от одного к другому и обратно способен произвести и обратный эффект, вот мнение Google<br> &nbsp;</p> <blockquote> <p> Однако некоторые веб-мастера используют схемы обмена ссылками и создают партнерские страницы исключительно с целью образования перекрестных ссылок, не принимая во внимание качество ссылок, источники, а также влияние, которое они будут оказывать на их сайты в долгосрочной перспективе. Это является нарушением требований&nbsp;<a style="color: rgb(17, 85, 204); " href="http://support.google.com/webmasters/bin/answer.py?answer=35769">руководства для веб-мастеров Google</a>&nbsp;и может негативно сказаться на рейтинге сайта в результатах поиска</p> <small><a href="http://support.google.com/webmasters/bin/answer.py?hl=ru&amp;answer=66356">Цитата из статьи Google, "Схемы построения ссылок"</a></small></blockquote> <h2> Бонус</h2> <p> В качестве приятного дополнения, предлагаю вам воспользоваться инструментом, который будет полезен для ручного обмена ссылок. С помощью него вы сможете проверять наличие нужного вам материала на партнерском сайте. Таким образом вы можете занести в список все ссылки, присутствие которых вам интересно на сайте партнеров и в случае их исчезновения принимать соответствующие меры. Кстати вы можете проверять присутствие абсолютно любого тега. Будть то просто текст, картинка или даже мета описание страницы.</p> <p> Например мне необходимо проверять, присутствует ли на странице&nbsp;<a href="http://www.yaponama.ru/about/">Контакты</a>&nbsp;этого сайта ccылка на "<a href="http://service.nalog.ru/uwsfind.do">Проверку сведений на сайте ФНС</a>"</p> <p> Нам необходимо будет написать CSS Path (не путать с каскадными таблицами стилей) или&nbsp;<a href="http://ru.wikipedia.org/wiki/XPath">XPath</a>&nbsp;для вычленения проверяемого элемента на странице.</p> <ol style="padding-top: 0px; padding-right: 40px; padding-bottom: 0px; padding-left: 40px; "> <li> Открываем Firefox,</li> <li> В нем открываем экстеншн FirePath</li> <li> Выбриаем в нем предпочитаемый способ проверки XPath или CSS Path<br> <br> <a href="/assets/ckeditor_assets/pictures/19/content_1.jpg"><img style="width: 400px; height: 250px; " src="/assets/ckeditor_assets/pictures/19/content_1.jpg" alt=""></a><br> &nbsp;</li> <li> Находим нужный селектор в данном случае этот CSS Path выглядит как&nbsp;.content&gt;div&gt;a</li> <li> И пишем выражение для его использования &nbsp;на языке&nbsp;Ruby<br> <code>doc.css(\'.content &gt; div &gt; a\').any? {|a| a.attr(\'href\') == \'http://service.nalog.ru/uwsfind.do\'}</code>&nbsp;<br> сохраняем и запускаем проверку, в результате которые мы видим успешное обновление статуса, что нужная ссылка найдена<br> <br> <a href="/assets/ckeditor_assets/pictures/20/content_2.jpg"><img style="width: 400px; height: 246px; " src="/assets/ckeditor_assets/pictures/20/content_2.jpg" alt=""></a><br> <br> Количество неудачных попыток подряд - 0 и дата последней успешной проверки - сейчас</li> </ol> <p> Я показал не самый простой пример специально акцентрировав внимание на том, что проверять можно абсолютно что угодно, где угодно и как угодно немножно зная язык Ruby. Если вы будете испытывать трудности с написанием, то я готов вам помочь.</p> <h2> Свяжитесь со мной</h2> <p> Если все вышеописанное вас убедило, то предлагаю вам бесплатный обмен ссылками, свяжитесь со мной любым доступным способом, описанным на странице&nbsp;<a href="http://www.yaponama.ru/about">Контакты</a>. Либо, если ваш контент интересный, то я готов на безвозмездной основе разместить ваш материал с ссылкой на ваш сайт (В большей степени это касается СТО (Станции Технического Обслуживания, интернет магазины Шин, Аксессуаров, Масел и прочих жидкостей к авто)). В любом случае, пишите, если вам не безразлична судьба вашего сайта.</p>'})

  payment = Page.find_or_initialize_by_path('поставщикам-автозапчастей')
  payment.update_attributes({
    :title => "Поставщикам автозапчастей",
    :default_content => '<h1> Поставщикам автозапчастей</h1> <p> Интернет магазин Японама является молодой компанией, образованной в конце 2011 года. Несмотря на высокую конкуренцию рынка автозапчастей мы используем современные технологии и пытаемся занять достойную нишу в этой области. Приглашаем к сотрдничеству поставщиков и производителей автозапчастей и аксессуаров для иномарок. Особенный интерес вызывают компании, которые могут предложить нам:</p> <ul> <li> регулярные розничные продажи автозапчастей по оптовым ценам;</li> <li> возможность доставки товара (заказчику, транспортной компании, на наш склад).</li> </ul> <p> В целях привлечения клиентов и предоставления им большого выбора автозапчастей в минимальные сроки, готовы осуществлять прием товара в любое время суток. С удовольствием рассмотрим все предложения.</p>'})

  payment = Page.find_or_initialize_by_path('payment')
  payment.update_attributes({
    :title => "Оплата",
    :default_content => '<h1>Оплата</h1><p>Уважаемые покупатели, на данный момент вы можете приобрести в нашем интернет магазине запчасти только по безналичной оплате (например с вашего лицевого счета или пластиковой карты, открытых в банке)</p><p>Купить запчасти за наличные деньги на данный момент нельзя.</p> <p>Заказы отправляются в работу только после полной оплаты, для ускорения процесса вышлите нам копию платежного поручения на электронный адрес, который вы можете посмотреть на странице <a href="/contacts">Контактов</a>.</p><p>Торговля осуществляется согласно Постановлению Правительства Российской Федерации от 27 сентября 2007 г. № 612 "Правила продажи товаров дистанционным способом", Гражданскому Кодексу и Закону о Защите Прав Потребителей.<br /><br /><p>Совсем скоро вам станет доступна оплата через Робокассу, которая позволит принимать от вас платежи наиболее удобным для вас способом Qiwi, Yandex Деньги, Webmoney, Связной, Евросеть и т.д.</p>'})
