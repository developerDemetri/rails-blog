function submitComment(post_id, username) {
  let box = "#comment-box-"+post_id;
  let content = $(box).val();
  let params = {
    comment: {
      content: content,
      post_id: post_id,
      user: username
    }
  }
  console.log(params);
  $.post("/comment", params).done(function(data) {
    console.log(data);
  });
  console.log('comment submitted: ' + content);
}
