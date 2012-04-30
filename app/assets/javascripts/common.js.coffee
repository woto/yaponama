((exports) ->
  exports.toyota_epc_part_number_application_to_models = (data) ->
    if data['caps'] == 'Toyota EPC'
      if data['command'] = 'part_number_application_to_models'
        if $("#toyota_epc_part_number_application_to_models").length <= 0
          content = " 
                      <h1> Таблица применимости детали xxxxx </h1>
                      <p><span class='label important'>К сведению</span> Перед вами отображена таблица применимости детали ... эти сведения используют профессиональные служащие концерна Toyota... описать значение столбцов и пр. Описать что такое PNC (Part Number Catalog); Кол-во; Что если в столбце Кат. номер отображается несколько каталожных номеров; Что значит кол-во, Catalog, Модель, Регион; Каким образом читать Описание, цифры двигателя, кузова; сокращения, что значит регион и т.д. Преподнести таким образом, чтобы действительно убедить, что это 100% сведения. </p>
                      <br />
                      <table class='zebra-striped' id='toyota_epc_part_number_application_to_models'>
                        <tr>
                          <th>№</th>
                          <th>Кат. номер</th>
                          <th>PNC</th>
                          <th>Кол-во</th>
                          <th>Catalog</th>
                          <th>Модель</th>
                          <th>Период пр-ва</th>
                          <th>Описание</th>
                          <th>Регион</th>
                        </tr>
                      </table> "
          $("#info").append(content)
          
        $("#toyota_epc_part_number_application_to_models").append("<tr>
          <td>" + data['data'][0] + "</td>
          <td>" + data['data'][1] + "</td>
          <td>" + data['data'][2] + "</td>
          <td>" + data['data'][3] + "</td>
          <td>" + data['data'][4] + "</td>
          <td>" + data['data'][5] + "</td>
          <td>" + data['data'][6] + "</td>
          <td>" + data['data'][7] + "</td>
          <td>" + data['area'] + "</td>
          </tr>")
) (if (typeof process is "undefined" or not process.versions) then window.common = window.common or {} else exports)
