const Utils = {
  init: () => {
    Utils.initConfirmation()
  },
  initConfirmation: () => {
    $('[data-toggle="confirmation"]').each(function() {
      let method = $(this).data('link-method') || 'get'
      let remote = $(this).hasClass('remote')

      if($(this).hasClass('delete')) {
        method = 'delete'
      }

      $(this).confirmation({
        onConfirm: function() {
          $(this).attr('data-method', method)
          $(this).attr('data-remote', remote)
        }
      })
    })
  }
}
