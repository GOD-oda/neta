require_relative('initialize')

issue_id = ARGV[0]
if issue_id.nil? || issue_id.to_i < 1
  puts 'Please type issue_id'
  exit
end

issue = Issue.get(issue_id)
puts issue.title
puts issue.label_names
