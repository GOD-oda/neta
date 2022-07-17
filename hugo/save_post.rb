require_relative 'initialize'

issue_id = ARGV[0]
if issue_id.nil? || issue_id.to_i < 1
  puts 'Please type issue_id'
  exit
end

post = Post.new(issue_id)
unless post.exists?
  puts 'Please create post before importing meta.'
  exit
end

issue = Issue.new
issue.save(issue_id, title: nil, body: post.texts)
