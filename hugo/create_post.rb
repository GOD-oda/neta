#!/usr/bin/env ruby

require './utils'

issue_id = ARGV[0]
if issue_id.nil? || issue_id.to_i < 1
  puts 'Please type issue_id'
  exit
end

post = Post.new(issue_id)
if post.exists?
  puts 'post is already created.'
  exit
end

post.create

