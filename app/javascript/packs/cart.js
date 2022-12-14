
  window.add_to_cart = function(id) {
    $.ajaxSetup({
      headers: {
        'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
      }
    });
    $.ajax({
      url: '/cart_items',
      method: 'POST',
      data: { id: id },
      success: function (result) {
        alert("OK");
      }
    });
  }


  window.increament= function (id){
      var quantity = $('#quantity'+id).val();
      $('#quantity'+id).val(quantity);
         if(quantity>0){
          $.ajaxSetup({
      headers: {
        'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
      }
    });
      $.ajax({
        url:'/increament',
        method: 'GET',
        data: {id:id},
        success:function(result){
        quantity=+quantity+1;
      $('#quantity'+id).val(quantity);
        }
      });
      }
  }

  window.decreament = function(id) {
    var quantity = $('#quantity' + id).val();
    if (quantity > 0) {
      $.ajaxSetup({
        headers: {
          'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
        }
      });
      $.ajax({
        url: '/decreament',
        method: 'GET',
        data: { id: id },
        success: function (result) {

          quantity = quantity - 1;
          $('#quantity' + id).val(quantity);
        }
      });
    }
  }


  window.remove_product = function (id) {
    if (confirm('Do you want to remove this item?')) {
      $.ajaxSetup({
        headers: {
          'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
        }
      });
      $.ajax({
        url: '/remove_item',
        method: 'GET',
        data: { id: id },
        success: function (result) {
          if (result == 'Deleted') {
            $('#product' + id).remove();
          }
        }
      });
    }
}
