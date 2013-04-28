module CommentsHelper
  def comments_count
    "All "+ pluralize(Comment.count, "comment")
  end
end
