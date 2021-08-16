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
title = res_body['title']
body = res_body['body']
file_path = "posts/#{issue_id}.md"

%x(hugo new #{file_path})

system("sed -i -e \"s/title\:.*/title\: #{title}/\" content/#{file_path}")
system("sed -i -e \"s/draft\:.*/draft: false/\" content/#{file_path}")
system("rm content/#{file_path}-e")

File.open("content/#{file_path}", 'a') do |f|
  f.puts res_body['body']
end

