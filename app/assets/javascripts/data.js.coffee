$ ->

  # Для мгновенного получения доступа
  # alert $("#data").data("remote-ip")

  # Для получения на стороне сервера
  unless $("#data").data("sent")
    $.ajax({
      type: "POST",
      url: "/data",
      data: 
        {
          screen_width: screen.width,
          screen_height: screen.height
        }
    });
