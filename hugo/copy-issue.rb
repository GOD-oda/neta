#!/usr/bin/env ruby

require 'net/http'
require 'json'

issue_id = ARGV[0]
if issue_id.nil? || issue_id.to_i < 1
  puts 'Please type issue_id'
  exit
end

uri = URI.parse("https://api.github.com/repos/GOD-oda/neta/issues/#{issue_id}")

res = Net::HTTP.get_response(uri)
res_body = JSON.parse(res.body)

%x(hugo new posts/#{issue_id}.md)

File.open("content/posts/#{issue_id}.md", 'a') do |f|
  f.puts res_body['body']
end

