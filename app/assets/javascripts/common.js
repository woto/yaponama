(function(exports) {
  return exports.toyota_epc_part_number_application_to_models = function(data, $, _) {
    var content;
    if (data['caps'] == 'Tecdoc') {
      if (data['command'] == 'specifically_number_info')
      {
        if(data['data']) {
          $("#info").prepend('<img style="width: 1024px; height: 768px;" src="' + data['data'] + '" /><br /><br />');
        }
      }
    }
    else if (data['caps'] == 'Toyota EPC') {
      if (data['command'] = 'part_number_application_to_models') {
        if ($("#toyota_epc_part_number_application_to_models").length <= 0) {
          content = "<h1> Информация по " + data['catalog_number']+ " - " + data['manufacturer'] +  "</h1>                      <p><span class='label important'>К сведению</span> Перед вами отображена таблица применимости детали. Эти сведения используют профессиональные служащие концерна Toyota. Если вы боитесь ошибиться при выборе нужной автозапчасти, то настоятельно рекомендуем воспользоваться <a href='/users/variants#jump'>Консультацией на сайте</a>.</p>                      <br />                      <table class='zebra-striped' id='toyota_epc_part_number_application_to_models'>                        <tr>                          <th>№</th>                          <th>Кат. номер</th>                          <th>PNC</th>                          <th>Кол-во</th>                          <th>Catalog</th>                          <th>Модель</th>                          <th>Период пр-ва</th>                          <th>Описание</th>                          <th>Регион</th>                        </tr>                      </table> ";
          $("#info").append(content);
        }
        if(data['data'])
          return $("#toyota_epc_part_number_application_to_models").append("<tr>          <td>" + data['data'][0] + "</td>          <td>" + data['data'][1] + "</td>          <td>" + data['data'][2] + "</td>          <td>" + data['data'][3] + "</td>          <td>" + data['data'][4] + "</td>          <td>" + data['data'][5] + "</td>          <td>" + data['data'][6] + "</td>          <td>" + data['data'][7] + "</td>          <td>" + data['area'] + "</td>          </tr>");
      }
    }
  };
})((typeof process === "undefined" || !process.versions ? window.common = window.common || {} : exports));
