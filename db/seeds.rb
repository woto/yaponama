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
  Block.create(:block_name => 'google_analytics', :content => "<!-- Google Analytics -->\r\n <script type=\"text/javascript\">\r\n var _gaq = _gaq || [];\r\n _gaq.push(['_setAccount', 'UA-28167315-1']);\r\n _gaq.push(['_trackPageview']);\r\n \r\n (function() {\r\n var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;\r\n ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';\r\n var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);\r\n })();\r\n </script>\r\n")
  Block.create(:block_name => 'yandex_metrika', :content => "<!-- Yandex.Metrika counter -->\r\n <div style=\"display:none;\"><script type=\"text/javascript\">\r\n (function(w, c) {\r\n (w[c] = w[c] || []).push(function() {\r\n try {\r\n w.yaCounter11728048 = new Ya.Metrika({id:11728048, enableAll: true, trackHash:true, webvisor:true});\r\n }\r\n catch(e) { }\r\n });\r\n })(window, \"yandex_metrika_callbacks\");\r\n </script></div>\r\n <script src=\"//mc.yandex.ru/metrika/watch.js\" type=\"text/javascript\" defer=\"defer\"></script>\r\n <noscript><div><img src=\"//mc.yandex.ru/watch/11728048\" style=\"position:absolute; left:-9999px;\" alt=\"\" /></div></noscript>\r\n")
  Block.create(:block_name => 'live_internet', :content => "<!--LiveInternet counter--><script type=\"text/javascript\"><!--\r\n document.write(\"<a href='http://www.liveinternet.ru/click' \"+\r\n \"target=_blank><img src='//counter.yadro.ru/hit?t16.3;r\"+\r\n escape(document.referrer)+((typeof(screen)==\"undefined\")?\"\":\r\n \";s\"+screen.width+\"*\"+screen.height+\"*\"+(screen.colorDepth?\r\n screen.colorDepth:screen.pixelDepth))+\";u\"+escape(document.URL)+\r\n \";\"+Math.random()+\r\n \"' alt='' title='LiveInternet: показано число просмотров за 24\"+\r\n \" часа, посетителей за 24 часа и за сегодня' \"+\r\n \"border='0' width='88' height='31'><\/a>\")\r\n //--></script><!--/LiveInternet-->\r\n")
  Block.create(:block_name => 'rambler_top100', :content => "<!-- begin of Top100 code -->\r\n <script id=\"top100Counter\" type=\"text/javascript\" src=\"http://counter.rambler.ru/top100.jcn?2696075\"></script>\r\n <noscript>\r\n <img src=\"http://counter.rambler.ru/top100.cnt?2696075\" alt=\"\" width=\"1\" height=\"1\" border=\"0\" />\r\n </noscript>\r\n <!-- end of Top100 code -->\r\n")
  Block.create(:block_name => 'mail_raiting', :content => "<!-- Rating@Mail.ru counter -->\r\n <script type=\"text/javascript\">//<![CDATA[\r\n var a='';js=10;d=document;\r\n try{a+=';r='+escape(d.referrer);}catch(e){}try{a+=';j='+navigator.javaEnabled();js=11;}catch(e){}\r\n try{s=screen;a+=';s='+s.width+'*'+s.height;a+=';d='+(s.colorDepth?s.colorDepth:s.pixelDepth);js=12;}catch(e){}\r\n try{if(typeof((new Array).push('t'))===\"number\")js=13;}catch(e){}\r\n try{d.write('<a href=\"http://top.mail.ru/jump?from=2156928\"><img src=\"http://d9.ce.b0.a2.top.mail.ru/counter?id=2156928;t=49;js='+js+\r\n a+';rand='+Math.random()+'\" alt=\"Рейтинг@Mail.ru\" style=\"border:0;\" height=\"31\" width=\"88\" \/><\/a>');}catch(e){}//]]></script>\r\n <noscript><p><a href=\"http://top.mail.ru/jump?from=2156928\"><img src=\"http://d9.ce.b0.a2.top.mail.ru/counter?js=na;id=2156928;t=49\" \r\n style=\"border:0;\" height=\"31\" width=\"88\" alt=\"Рейтинг@Mail.ru\" /></a></p></noscript>\r\n <!-- //Rating@Mail.ru counter -->\r\n")
  Block.create(:block_name => 'openstat', :content => '')

  Block.create(:block_name => 'sideblock_1', :content => '<p> Самые низкие цены на новые автозапчасти для иномарок, дающие фору лидерам рынка автозапчастей Москвы. </p> <p> Не верите? Убедитесь сами </p> <p> <a href="http://top.mail.ru/Rating/Cars-Spare/week/Visitors/1.html">Ссылка на самые посещаемые интернет магазины автозапчастей Москвы по версии mail.ru</a></p> ')
  Block.create(:block_name => 'sideblock_2', :content => '<h3>Сравните цены!</h3> <br /> <p>Подшибник ступицы<br />(Mitsubishi) MR491449</p> <a href="/searches/MR491449/MITSUBISHI/">yaponama.ru 1853р - 1902р</a><br /> <a href="http://exist.ru/price.aspx?pcode=MR491449">exist.ru 1931р - 2102р</a><br /> <br /> <p>Тяга стабилизатора задняя<br />(Toyota) 48830−48010</p> <a href="/searches/4883048010/TOYOTA">yaponama.ru 1046р - 1170р</a><br /> <a href="http://exist.ru/price.aspx?pid=83002B18&sr=-4">exist.ru 1282р - 1469р</a><br /> <br /> <p>Тормозной диск<br />(Mitsubishi) MR510741</p> <a href="/searches/MR510741/MITSUBISHI/">yaponama.ru 3470р - 3539р</a><br /> <a href="http://exist.ru/price.aspx?pcode=MR510741">exist.ru 4085р - 5299р</a> <br />')

  Block.create(:block_name => 'copyright', :content => "&copy; Yaponama 2012")
  Block.create(:block_name => 'title', :content => "Японама (Yaponama)")
  Block.create(:block_name => 'header', :content => "Yaponama.ru")
  
  Block.create(:block_name => 'hero_unit', :content => "<h1>Добро пожаловать!</h1> <p>Рады, что вы посетили наш магазин автозапчастей <strong>Японама</strong>, надеемся вам понравятся наш ассортимент и цены. Если вы знаете каталожный номер автозапчасти, то можете приступить к поиску прямо сейчас или связаться с нашим менеджером, для консультации и подбора.</p>")
  Block.create(:block_name => 'hero_unit_mobile', :content => "Главная страница")
  Block.create(:block_name => 'about', :content => "Рады, что вы посетили нашу страницу \"О магазине\"!  <br /> <br /> <h2>Контактная информация</h2><div><div>Skype: woto-ru</div><div>ICQ: 109666888</div><div> e-mail: <script> document.write('<a href=\"mai' + 'lto:info@' + 'yaponama.ru\">'+ 'info@' + 'yaponama.ru' + '</a>') </script> </div><div>МТС: +7 (916) 907-27-88</div></div><h2><br></h2><h2>Доставка и оплата</h2><div>Добавить.</div><h2><br></h2><h2>Банковские реквизиты</h2><div>Добавить.</div><h2><br></h2><h2>Сведения о регистрации</h2><div>И.П. Корнев Руслан Михайлович</div><div>ИНН: 245719329605</div><div>ОГРНИП: 312501203100041</div><div><br></div><div><a href=\"/assets/documents/inn.jpg\"><img src=\"/assets/documents/inn_thumb.jpg\"></a>&nbsp;<img><a href=\"/assets/documents/ogrnip.jpg\"><img src=\"/assets/documents/ogrnip_thumb.jpg\"></a></div><div><br></div><div><a href=\"http://service.nalog.ru/uwsfind.do\">Проверка сведений на сайте Федеральной Налоговой Службы</a>&nbsp;</div><div><br></div><div><a href=\"/assets/documents/nalog.jpg\"><img src=\"/assets/documents/nalog_thumb.jpg\"></a></div><div></div>")
  Block.create(:block_name => 'about_mobile', :content => "Рады, что вы посетили нашу страницу \"О магазине\"!  <br /> <br /> <h2>Контактная информация</h2><div><div>Skype: woto-ru</div><div>ICQ: 109666888</div><div> e-mail: <script> document.write('<a href=\"mai' + 'lto:info@' + 'yaponama.ru\">'+ 'info@' + 'yaponama.ru' + '</a>') </script> </div><div>МТС: +7 (916) 907-27-88</div></div><h2><br></h2><h2>Доставка и оплата</h2><div>Добавить.</div><h2><br></h2><h2>Банковские реквизиты</h2><div>Добавить.</div><h2><br></h2><h2>Сведения о регистрации</h2><div>И.П. Корнев Руслан Михайлович</div><div>ИНН: 245719329605</div><div>ОГРНИП: 312501203100041</div><div><br></div><div><a href=\"/assets/documents/inn.jpg\"><img src=\"/assets/documents/inn_thumb.jpg\"></a>&nbsp;<img><a href=\"/assets/documents/ogrnip.jpg\"><img src=\"/assets/documents/ogrnip_thumb.jpg\"></a></div><div><br></div><div><a href=\"http://service.nalog.ru/uwsfind.do\">Проверка сведений на сайте Федеральной Налоговой Службы</a>&nbsp;</div><div><br></div><div><a href=\"/assets/documents/nalog.jpg\"><img src=\"/assets/documents/nalog_thumb.jpg\"></a></div><div></div>")
  Block.create(:block_name => 'meta_description_default', :content => 'Рады, что вы посетили наш магазин автозапчастей Японама (Yaponama), надеемся вам понравятся наш ассортимент и цены. Если вы знаете каталожный номер автозапчасти, то можете приступить к поиску прямо сейчас или связаться с нашим менеджером, для консультации и подбора.')
  Block.create(:block_name => 'checkout_recipient', :content => 'ИП Корнев Руслан Михайлович')
  Block.create(:block_name => 'checkout_inn', :content => '245719329605')
  Block.create(:block_name => 'checkout_account', :content => '40802810300000010946')
  Block.create(:block_name => 'checkout_bik', :content => '044579918')
  Block.create(:block_name => 'checkout_bank', :content => 'СБ Банк (ООО)')
  Block.create(:block_name => 'checkout_correspondent', :content => '30101810600000000918')

