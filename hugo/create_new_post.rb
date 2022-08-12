require_relative('initialize')

issue_id = ARGV[0]
if issue_id.nil? || issue_id.to_i < 1
  puts 'Please type issue_id'
  exit
end

issue = Issue.get(issue_id)
post = Post.new(issue.issue_id)

if post.exists?
  puts 'Post already exists.'
  exit
end

%x(hugo new posts/#{issue.issue_id}.md)

post.save_meta(
  title: issue.title,
  tags: issue.label_names,
)
