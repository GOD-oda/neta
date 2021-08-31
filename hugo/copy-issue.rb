#!/usr/bin/env ruby

require 'net/http'
require 'json'
require 'time'

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
file_name = "#{issue_id}.md"
file_path = "content/posts/#{file_name}"
label_names = res_body['labels'].map { |l| l['name'] }.join(',')
if res_body['created_at']
  ENV['TZ'] = 'Asia/Tokyo'
  created_at = Time.parse(res_body['created_at'])
  created_at = created_at + (60 * 60 * 9)
else
  created_at = nil
end
if res_body['updated_at']
  ENV['TZ'] = 'Asia/Tokyo'
  updated_at = Time.parse(res_body['updated_at'])
  updated_at = updated_at + (60 * 60 * 9)
else
  updated_at = nil
end

%x(hugo new posts/#{file_name})

system("sed -i -e \"s/title\:.*/title\: #{title}/\" #{file_path}")
system("sed -i -e \"s/draft\:.*/draft: false/\" #{file_path}")
unless label_names.empty?
  system("gsed -i -e \"/draft\:.*/a tags: [#{label_names}]\" #{file_path}")
end
if created_at
  system("sed -i -e \"s/date\:.*/date: #{created_at.strftime('%Y-%m-%dT%H:%M:%S')}/\" #{file_path}")
end
if updated_at
  system("gsed -i -e \"/date\:.*/a publishDate: #{updated_at.strftime('%Y-%m-%dT%H:%M:%S')}\" #{file_path}")
end

File.open(file_path, 'a') do |f|
  f.puts res_body['body']
end
