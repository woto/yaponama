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
:content => "<!--LiveInternet counter--><script type=\"text/javascript\"><!--\r\n document.write(\"<a href='http://www.liveinternet.ru/click' \"+\r\n \"target=_blank><img src='//counter.yadro.ru/hit?t16.3;r\"+\r\n escape(document.referrer)+((typeof(screen)==\"undefined\")?\"\":\r\n \";s\"+screen.width+\"*\"+screen.height+\"*\"+(screen.colorDepth?\r\n screen.colorDepth:screen.pixelDepth))+\";u\"+escape(document.URL)+\r\n \";\"+Math.random()+\r\n \"' alt='' title='LiveInternet: показано число просмотров за 24\"+\r\n \" часа, посетителей за 24 часа и за сегодня' \"+\r\n \"border='0' width='88' height='31'><\/a>\")\r\n //--></script><!--/LiveInternet-->\r\n"})

rambler_top100 = Block.find_or_initialize_by_block_name('rambler_top100')
rambler_top100.update_attributes({
:content => "<!-- begin of Top100 code -->\r\n <script id=\"top100Counter\" type=\"text/javascript\" src=\"http://counter.rambler.ru/top100.jcn?2696075\"></script>\r\n <noscript>\r\n <img src=\"http://counter.rambler.ru/top100.cnt?2696075\" alt=\"\" width=\"1\" height=\"1\" border=\"0\" />\r\n </noscript>\r\n <!-- end of Top100 code -->\r\n"})

mail_raiting = Block.find_or_initialize_by_block_name('mail_raiting')
mail_raiting.update_attributes({
:content => "<!-- Rating@Mail.ru counter -->\r\n <script type=\"text/javascript\">//<![CDATA[\r\n var a='';js=10;d=document;\r\n try{a+=';r='+escape(d.referrer);}catch(e){}try{a+=';j='+navigator.javaEnabled();js=11;}catch(e){}\r\n try{s=screen;a+=';s='+s.width+'*'+s.height;a+=';d='+(s.colorDepth?s.colorDepth:s.pixelDepth);js=12;}catch(e){}\r\n try{if(typeof((new Array).push('t'))===\"number\")js=13;}catch(e){}\r\n try{d.write('<a href=\"http://top.mail.ru/jump?from=2156928\"><img src=\"http://d9.ce.b0.a2.top.mail.ru/counter?id=2156928;t=49;js='+js+\r\n a+';rand='+Math.random()+'\" alt=\"Рейтинг@Mail.ru\" style=\"border:0;\" height=\"31\" width=\"88\" \/><\/a>');}catch(e){}//]]></script>\r\n <noscript><p><a href=\"http://top.mail.ru/jump?from=2156928\"><img src=\"http://d9.ce.b0.a2.top.mail.ru/counter?js=na;id=2156928;t=49\" \r\n style=\"border:0;\" height=\"31\" width=\"88\" alt=\"Рейтинг@Mail.ru\" /></a></p></noscript>\r\n <!-- //Rating@Mail.ru counter -->\r\n"})

openstat = Block.find_or_initialize_by_block_name('openstat')
openstat.update_attributes({
:content => ''})

sideblock_1 = Block.find_or_initialize_by_block_name('sideblock_1')
sideblock_1.update_attributes({
:content => '<div class="well"> <p> Самые низкие цены на новые автозапчасти для иномарок, дающие фору лидерам рынка автозапчастей Москвы. </p> <p> Не верите? Убедитесь сами </p> <p> <a href="http://top.mail.ru/Rating/Cars-Spare/week/Visitors/1.html">Ссылка на самые посещаемые интернет магазины автозапчастей Москвы по версии mail.ru</a></p> </div>'})

sideblock_2 = Block.find_or_initialize_by_block_name('sideblock_2')
sideblock_2.update_attributes({
:content => '<div class="well"> <h3>Сравните цены!</h3> <br /> <p>Подшибник ступицы<br />(Mitsubishi) MR491449</p> <a href="/searches/MR491449/MITSUBISHI/">yaponama.ru 1853р - 1902р</a><br /> <a href="http://exist.ru/price.aspx?pcode=MR491449">exist.ru 1931р - 2102р</a><br /> <br /> <p>Тяга стабилизатора задняя<br />(Toyota) 48830−48010</p> <a href="/searches/4883048010/TOYOTA">yaponama.ru 1046р - 1170р</a><br /> <a href="http://exist.ru/price.aspx?pid=83002B18&sr=-4">exist.ru 1282р - 1469р</a><br /> <br /> <p>Тормозной диск<br />(Mitsubishi) MR510741</p> <a href="/searches/MR510741/MITSUBISHI/">yaponama.ru 3470р - 3539р</a><br /> <a href="http://exist.ru/price.aspx?pcode=MR510741">exist.ru 4085р - 5299р</a> <br /> </div>'})

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

about = Block.find_or_initialize_by_block_name('about')
about.update_attributes({
:content => "<h2> Контактная информация</h2> <div> <div> Skype: woto-ru</div> <div> ICQ: 109666888</div> <div> e-mail: <script> document.write('<a href=\"mai' + 'lto:info@' + 'yaponama.ru\">'+ 'info@' + 'yaponama.ru' + '</a>') </script></div> <div> МТС: +7 (916) 907-27-88</div> </div> <h2> &nbsp;</h2> <h2> Доставка и оплата</h2> <div> Отправления автозапчастей в основном осуществляются Почтой России. Товары до 2,5 кг. отправляются бандеролью первого класса, срок доставки согласно заявленному на почте - 7 рабочих дней, ориентировочная стоимость доставки 300 - 500 рублей (более точная стоимость выставляется после уточнения менеджером по телефону на почте).&nbsp;Запчасти, вес которых превышает 2,5 кг. так же могут отправляться посылкой через Почту России, но сроки выше (точные сроки и стоимость выясняются после получения вашего заказа и адреса доставки), либо транспортной компанией по согласованию с покупателем.</div> <h2> &nbsp;</h2> <h2> Банковские реквизиты</h2> <div> Расчетный счет 40802810300000010946</div> <div> &nbsp;</div> <div> СБ БАНК (ООО) г. Москва</div> <div> БИК 044579918</div> <div> к/сч 30101810600000000918</div> <div> ИНН 7723008300</div> <div> КПП 775001001</div> <div> <br /> &nbsp;</div> <h2> Сведения о регистрации</h2> <div> И.П. Корнев Руслан Михайлович</div> <div> ИНН: 245719329605</div> <div> ОГРНИП: 312501203100041</div> <div> &nbsp;</div> <div> <a href=\"/assets/documents/inn.jpg\"><img src=\"/assets/documents/inn_thumb.jpg\" /></a>&nbsp;<img /><a href=\"/assets/documents/ogrnip.jpg\"><img src=\"/assets/documents/ogrnip_thumb.jpg\" /></a></div> <div> &nbsp;</div> <div> <a href=\"http://service.nalog.ru/uwsfind.do\">Проверка сведений на сайте Федеральной Налоговой Службы</a></div> <div> &nbsp;</div> <div> <a href=\"/assets/documents/nalog.jpg\"><img src=\"/assets/documents/nalog_thumb.jpg\" /></a></div> <div> &nbsp;</div>"})

about_mobile = Block.find_or_initialize_by_block_name('about_mobile')
about_mobile.update_attributes({
:content => "<h2> Контактная информация</h2> <div> <div> Skype: woto-ru</div> <div> ICQ: 109666888</div> <div> e-mail: <script> document.write('<a href=\"mai' + 'lto:info@' + 'yaponama.ru\">'+ 'info@' + 'yaponama.ru' + '</a>') </script></div> <div> МТС: +7 (916) 907-27-88</div> </div> <h2> &nbsp;</h2> <h2> Доставка и оплата</h2> <div> Отправления автозапчастей в основном осуществляются Почтой России. Товары до 2,5 кг. отправляются бандеролью первого класса, срок доставки согласно заявленному на почте - 7 рабочих дней, ориентировочная стоимость доставки 300 - 500 рублей (более точная стоимость выставляется после уточнения менеджером по телефону на почте).&nbsp;Запчасти, вес которых превышает 2,5 кг. так же могут отправляться посылкой через Почту России, но сроки выше (точные сроки и стоимость выясняются после получения вашего заказа и адреса доставки), либо транспортной компанией по согласованию с покупателем.</div> <h2> &nbsp;</h2> <h2> Банковские реквизиты</h2> <div> Расчетный счет 40802810300000010946</div> <div> &nbsp;</div> <div> СБ БАНК (ООО) г. Москва</div> <div> БИК 044579918</div> <div> к/сч 30101810600000000918</div> <div> ИНН 7723008300</div> <div> КПП 775001001</div> <div> <br /> &nbsp;</div> <h2> Сведения о регистрации</h2> <div> И.П. Корнев Руслан Михайлович</div> <div> ИНН: 245719329605</div> <div> ОГРНИП: 312501203100041</div> <div> &nbsp;</div> <div> <a href=\"/assets/documents/inn.jpg\"><img src=\"/assets/documents/inn_thumb.jpg\" /></a>&nbsp;<img /><a href=\"/assets/documents/ogrnip.jpg\"><img src=\"/assets/documents/ogrnip_thumb.jpg\" /></a></div> <div> &nbsp;</div> <div> <a href=\"http://service.nalog.ru/uwsfind.do\">Проверка сведений на сайте Федеральной Налоговой Службы</a></div> <div> &nbsp;</div> <div> <a href=\"/assets/documents/nalog.jpg\"><img src=\"/assets/documents/nalog_thumb.jpg\" /></a></div> <div> &nbsp;</div>"})

meta_description_default = Block.find_or_initialize_by_block_name('meta_description_default')
meta_description_default.update_attributes({
:content => 'Рады, что вы посетили наш магазин автозапчастей Японама (Yaponama), надеемся вам понравятся наш ассортимент и цены. Если вы знаете каталожный номер автозапчасти, то можете приступить к поиску прямо сейчас или связаться с нашим менеджером, для консультации и подбора.'})

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
:default_content => '<h1> Автомобильные каталоги</h1> <p> Ниже вы можете посмотреть ссылки на имеющуюся&nbsp;в интернете справочную информацию по автомобильным каталогам. Вы можете самостоятельно&nbsp;поискать каталожный номер (артикул)&nbsp;интересующей вас запчасти. Сразу оговоримся, что в них&nbsp;не исключены ошибочные сведения. Если вы боитесь ошибиться или не владеете соответствующими знаниями, то рекомендуем просто воспользоваться нашей <a href="/requests">формой по подбору запчастей</a>.&nbsp;Вы будете максимально быстро уведомлены посредством смс о подобранной запчасти.</p> <p> Иначе&nbsp;после перехода по ссылке интересующего вас каталога у вас откроется новое окно браузера, в котором будет представлен автокаталог, т.к. эта справочная информация не принадлежит нам, то непосредственно после щелчка на номере автозапчасти вы попадете в какой-либо магазин, в зависимости от того чьи интересы представляет автокаталог. Далее вам остается вернуться на наш сайт и просто ввести номер найденной детали в строку поиска. Будьте осторожны с выбором цены, очень часто автомобильные сайты с целью завлечения покупателей предлагают заведомо низкие цены, которые могут предложить только оптовым покупателям, осуществляющим закупку на миллионы рублей в месяц.</p> <p> &nbsp;</p> <ul> <li> Alfa-Romeo (<a href="http://goo.gl/xzcJI" target="_blank">каталог 1</a>, <a href="http://goo.gl/oYTWD" target="_blank">каталог 2</a>)</li> <li> Audi (<a href="http://goo.gl/EYTL2" target="_blank">каталог 1</a>, <a href="http://goo.gl/IPqik" target="_blank">каталог 2</a>, <a href="http://goo.gl/gHMVT" target="_blank">каталог 3</a>, <a href="http://goo.gl/wo72o" target="_blank">каталог 4</a>)</li> <li> BMW (<a href="http://goo.gl/yudTj" target="_blank">каталог 1</a>, <a href="http://goo.gl/oIElD" target="_blank">каталог 2</a>, <a href="http://goo.gl/gMDVX" target="_blank">каталог 3</a>, <a href="http://goo.gl/GXY9M" target="_blank">каталог 4</a>, <a href="http://goo.gl/r86P2" target="_blank">каталог 5</a>)</li> <li> CHERY (<a href="http://goo.gl/jVt3S" target="_blank">каталог 1</a>)</li> <li> Chevrolet (<a href="http://goo.gl/G3c1q" target="_blank">каталог 1</a>)</li> <li> Chrysler (<a href="http://goo.gl/VBvRD" target="_blank">каталог 1</a>, <a href="http://goo.gl/4VZyf" target="_blank">каталог 2</a>, <a href="http://goo.gl/cESgK" target="_blank">каталог 3</a>)</li> <li> Citroen (<a href="http://goo.gl/c1hVa" target="_blank">каталог 1</a>, <a href="http://goo.gl/U2fVu" target="_blank">каталог 2</a>)</li> <li> Daewoo (<a href="http://goo.gl/Be5YF" target="_blank">каталог 1</a>, <a href="http://goo.gl/cBh04" target="_blank">каталог 2</a>)</li> <li> Daihatsu (<a href="http://goo.gl/LvJz3" target="_blank">каталог 1</a>)</li> <li> Dodge (<a href="http://goo.gl/e4EPG" target="_blank">каталог 1</a>)</li> <li> Faw (<a href="http://goo.gl/GYz14" target="_blank">каталог 1</a>)</li> <li> FIAT (<a href="http://goo.gl/kJvbP" target="_blank">каталог 1</a>, <a href="http://goo.gl/FBasb" target="_blank">каталог 2</a>)</li> <li> Ford (<a href="http://goo.gl/NuyVq" target="_blank">каталог 1</a>, <a href="http://goo.gl/VS1SF" target="_blank">каталог 2</a>, <a href="http://goo.gl/ofGeq" target="_blank">каталог 3</a>, <a href="http://goo.gl/ODMDN" target="_blank">каталог 4</a>)</li> <li> Geely (<a href="http://goo.gl/yxDrF" target="_blank">каталог 1</a>)</li> <li> Honda (<a href="http://goo.gl/uaop5" target="_blank">каталог 1</a>, <a href="http://goo.gl/1cpyO" target="_blank">каталог 2</a>, <a href="http://goo.gl/wuNnC" target="_blank">каталог 3</a>, <a href="http://goo.gl/z8MWB" target="_blank">каталог 4</a>, <a href="http://goo.gl/x6qRY" target="_blank">каталог 5</a>)</li> <li> Hyundai (<a href="http://goo.gl/VXkj8" target="_blank">каталог 1</a>, <a href="http://goo.gl/eVAem" target="_blank">каталог 2</a>, <a href="http://goo.gl/IS9D6" target="_blank">каталог 3</a>, <a href="http://goo.gl/gDIqV" target="_blank">каталог 4</a>)</li> <li> Infiniti (<a href="http://goo.gl/reBhR" target="_blank">каталог 1</a>, <a href="http://goo.gl/3hiRp" target="_blank">каталог 2</a>)</li> <li> Isuzu (<a href="http://goo.gl/VdrlD" target="_blank">каталог 1</a>, <a href="http://goo.gl/wB9y5" target="_blank">каталог 2</a>)</li> <li> Jaguar (<a href="http://goo.gl/3lu5A" target="_blank">каталог 1</a>)</li> <li> Jeep (<a href="http://goo.gl/wZVH1" target="_blank">каталог 1</a>, <a href="http://goo.gl/0Px5G" target="_blank">каталог 2</a>)</li> <li> KIA (<a href="http://goo.gl/q5iaS" target="_blank">каталог 1</a>, <a href="http://goo.gl/Ii9LS" target="_blank">каталог 2</a>, <a href="http://goo.gl/0trfO" target="_blank">каталог 3</a>, <a href="http://goo.gl/wHF3p" target="_blank">каталог 4</a>)</li> <li> Land Rover (<a href="http://goo.gl/iZBm3" target="_blank">каталог 1</a>)</li> <li> Lexus (<a href="http://goo.gl/Rct7i" target="_blank">каталог 1</a>, <a href="http://goo.gl/DOzhR" target="_blank">каталог 2</a>, <a href="http://goo.gl/3FXt7" target="_blank">каталог 3</a>, <a href="http://goo.gl/CRCei" target="_blank">каталог 4</a>)</li> <li> MAN (<a href="http://goo.gl/DntyD" target="_blank">каталог 1</a>)</li> <li> Mazda (<a href="http://goo.gl/NIejV" target="_blank">каталог 1</a>, <a href="http://goo.gl/zNqf8" target="_blank">каталог 2</a>, <a href="http://goo.gl/wpUr8" target="_blank">каталог 3</a>, <a href="http://goo.gl/dZMoL" target="_blank">каталог 4</a>, <a href="http://goo.gl/yMVMf" target="_blank">каталог 5</a>)</li> <li> Mercedes-Benz (<a href="http://goo.gl/ZnSgY" target="_blank">каталог 1</a>, <a href="http://goo.gl/SjOwu" target="_blank">каталог 2</a>, <a href="http://goo.gl/F5mnQ" target="_blank">каталог 3</a>, <a href="http://goo.gl/yq1Pw" target="_blank">каталог 4</a>)</li> <li> MINI (<a href="http://goo.gl/zLV4Z" target="_blank">каталог 1</a>)</li> <li> Mitsubishi (<a href="http://goo.gl/dGCeX" target="_blank">каталог 1</a>, <a href="http://goo.gl/SCay6" target="_blank">каталог 2</a>, <a href="http://goo.gl/m869g" target="_blank">каталог 3</a>, <a href="http://goo.gl/QplHD" target="_blank">каталог 4</a>, <a href="http://goo.gl/EOeWO" target="_blank">каталог 5</a>)</li> <li> Nissan (<a href="http://goo.gl/sFfI9" target="_blank">каталог 1</a>, <a href="http://goo.gl/vnzqS" target="_blank">каталог 2</a>, <a href="http://goo.gl/PQM8P" target="_blank">каталог 3</a>, <a href="http://goo.gl/mPL1M" target="_blank">каталог 4</a>, <a href="http://goo.gl/qai5o" target="_blank">каталог 5</a>)</li> <li> Opel (<a href="http://goo.gl/jTtmo" target="_blank">каталог 1</a>, <a href="http://goo.gl/GMyEj" target="_blank">каталог 2</a>)</li> <li> Peugeot (<a href="http://goo.gl/48zEt" target="_blank">каталог 1</a>, <a href="http://goo.gl/DzA70" target="_blank">каталог 2</a>)</li> <li> Renault (<a href="http://goo.gl/qnl7C" target="_blank">каталог 1</a>, <a href="http://goo.gl/PJsoh" target="_blank">каталог 2</a>)</li> <li> Rover (<a href="http://goo.gl/H5Mpm" target="_blank">каталог 1</a>)</li> <li> SAAB (<a href="http://goo.gl/RlSZ4" target="_blank">каталог 1</a>, <a href="http://goo.gl/0PXfs" target="_blank">каталог 2</a>)</li> <li> Seat (<a href="http://goo.gl/5jTRe" target="_blank">каталог 1</a>, <a href="http://goo.gl/Mk8rS" target="_blank">каталог 2</a>, <a href="http://goo.gl/Jq0GZ" target="_blank">каталог 3</a>)</li> <li> Skoda (<a href="http://goo.gl/CZfMI" target="_blank">каталог 1</a>, <a href="http://goo.gl/7S29s" target="_blank">каталог 2</a>, <a href="http://goo.gl/ieLDt" target="_blank">каталог 3</a>, <a href="http://goo.gl/nFmPP" target="_blank">каталог 4</a>)</li> <li> SsangYong (<a href="http://goo.gl/ux5FJ" target="_blank">каталог 1</a>, <a href="http://goo.gl/kNQzG" target="_blank">каталог 2</a>, <a href="http://goo.gl/Emw46" target="_blank">каталог 3</a>)</li> <li> Subaru (<a href="http://goo.gl/uLGl4" target="_blank">каталог 1</a>, <a href="http://goo.gl/Mrtm2" target="_blank">каталог 2</a>, <a href="http://goo.gl/7Vj5K" target="_blank">каталог 3</a>, <a href="http://goo.gl/DBdYA" target="_blank">каталог 4</a>)</li> <li> Suzuki (<a href="http://goo.gl/Z13xN" target="_blank">каталог 1</a>, <a href="http://goo.gl/mstvN" target="_blank">каталог 2</a>, <a href="http://goo.gl/4kUgq" target="_blank">каталог 3</a>, <a href="http://goo.gl/SmkKx" target="_blank">каталог&nbsp;4</a>, <a href="http://goo.gl/1qSUZ" target="_blank">каталог 5</a>)</li> <li> Toyota (<a href="http://goo.gl/khlul" target="_blank">каталог 1</a>, <a href="http://goo.gl/RbQhJ" target="_blank">каталог 2</a>, <a href="http://goo.gl/hE6sd" target="_blank">каталог 3</a>, <a href="http://goo.gl/7wm6y" target="_blank">каталог 4</a>, <a href="http://goo.gl/KXmD1" target="_blank">каталог 5</a>, <a href="http://goo.gl/0qqU1" target="_blank">каталог 6</a>)</li> <li> Volkswagen (<a href="http://goo.gl/QVngY" target="_blank">каталог 1</a>, <a href="http://goo.gl/2naU1" target="_blank">каталог 2</a>, <a href="http://goo.gl/xTg65" target="_blank">каталог 3</a>)</li> <li> Volvo&nbsp;(<a href="http://goo.gl/OMCRo" target="_blank">каталог 1</a>, <a href="http://goo.gl/FO0mX" target="_blank">каталог 2</a>)</li> </ul>'})
  misspelled = Page.find_or_initialize_by_path('misspelled')
  misspelled.update_attributes({:default_content => '<h1> Опечатки</h1> <p> Порою, как и все люди мы ошибаемся, в том числе и при наборе текста на компьютере, поэтому мы предусмотрительно собрали здесь самые распространенные опечатки при наборе адреса нашего сайта.</p> <ul> <li> Япона Ма</li> <li> Япона ма ру</li> <li> Япона ма.ру</li> <li> Японамама</li> <li> японамама ру</li> <li> японамама.ру</li> <li> Япона</li> <li> Япона&nbsp;ру</li> <li> Япона.ру</li> <li> Япония</li> <li> Япония ру</li> <li> Япония.ру</li> </ul> <p> Запомнить ардес нашего сайта легко!</p> <h2 style="text-align: center; "> <a href="http://www.yaponama.ru">www.yaponama.ru</a></h2> <p> &nbsp;</p> <p> &nbsp;</p>'})
