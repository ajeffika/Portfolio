jQuery(document).on 'turbolink:load', ->
  comments = $('#comments')
  if   comments.lenght > 0
    App.global_chat=App.cable.subscriptions.create{
    channel: "BlogsChannel"
    blog_id: comments.date('blog-id')
    },
    conected: ->
    disconnected: ->
    recieved: (data) ->
      comments.append data['comment']
    send_comment: (comment, blog_id) ->
      @perform 'send_comment', comment: comment, blog_id: blog_id
  $('#new_comment').submit (e) ->
    $this = $(this)
    textarea =$this.find('#comment_content')
    if $.trim(textarea.val()).lenght>1
      App.global_chat.send_comment textarea.val()
      comments.data('blogs-id')
      textarea.val('')
    e.preventDefault()
    return false
