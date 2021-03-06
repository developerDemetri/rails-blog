function submitComment(post_id, username) {
  var comment_box = $("#comment-box-"+post_id);
  var content = comment_box.val();
  var params = {
    comment: {
      content: content,
      post_id: post_id,
      user: username
    }
  }
  comment_box.val('');
  $.post("/comment", params).done(function(data) {
    if (data.status === 201) {
      appendComment(params.comment);
    }
  });
}

function appendComment(comment) {
  var new_comment_box = $('#new-comments-'+comment.post_id);
  var comment_html = '<p class="left-align">'+comment.content+' - <strong>'+comment.user+'</strong></p>';
  new_comment_box.append(comment_html);
}

function setTime(timestampeId, time) {
  var styledTime = moment.utc(time);
  var curr = moment();
  var cutoff = moment.utc(time).add(25, 'days');
  if (curr.isBefore(cutoff)) {
    styledTime = styledTime.fromNow();
  }
  else {
    styledTime = styledTime.format('MMMM Do YYYY');
  }
  $('#'+timestampeId).append(styledTime);
}
