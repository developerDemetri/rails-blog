function submitComment(post_id, username) {
  let box = $("#comment-box-"+post_id);
  let content = box.val();
  let params = {
    comment: {
      content: content,
      post_id: post_id,
      user: username
    }
  }
  box.val('')
  $.post("/comment", params).done(function(data) {
    if (data.status === 201) {
      appendComment(params.comment);
    }
  });
}

function appendComment(comment) {
  let comment_box = $('#new-comments-'+comment.post_id);
  let comment_html = '<p class="left-align">'+comment.content+' - <strong>'+comment.user+'</strong></p>';
  comment_box.append(comment_html);
}
