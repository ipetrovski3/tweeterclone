(function() {
  var ready;

  ready = function() {
    $('#invalid-username').hide();
    $('#valid-username').hide();
    $('#user_username').on('keyup', function(event) {
      $.ajax({
        url: '/username_validator/' + $('#user_username').val(),
        type: 'GET',
        dataType: 'json',
        error: function(jqXHR, textStatus, errorThrown) {},
        success: function(data, textStatus, jqXHR) {
          if (data.valid === true) {
            $('#invalid-username').hide();
            return $('#valid-username').show();
          } else if (data.valid === false) {
            $('#valid-username').hide();
            return $('#invalid-username').show();
          }
        }
      });
      event.stopImmediatePropagation();
      return false;
    });
    return false;
  };

  $(document).ready(ready);

  $(document).on('turbolinks:load', ready);

}).call(this);
