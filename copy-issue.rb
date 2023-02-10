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
file_name = "#{issue_id}.md"
file_path = "content/posts/#{file_name}"
if File.exist?(file_path)
  begin
    File.delete(file_path)
  rescue
    p $!
    exit
  end
end
label_names = res_body['labels'].map { |l| l['name'] }.join(',')
if res_body['created_at']
  ENV['TZ'] = 'Asia/Tokyo'
  created_at = Time.parse(res_body['created_at'])
  created_at = created_at + (60 * 60 * 9)
else
  created_at = nil
end

%x(hugo new posts/#{file_name})

buffer = File.open(file_path, "r") { |f| f.read() }
buffer.sub!(/title:.*/, "title: #{title}")
  .sub!(/tags:.*/, "tags: [#{label_names}]")
  .sub!(/draft:.*/, "draft: false")
  .sub!(/date:.*/, "date: date: #{created_at.strftime('%Y-%m-%dT%H:%M:%S')}+09:00")
File.open(file_path, "w") { |f| f.write(buffer) }

if File.exist?("#{file_path}-e")
  File.delete("#{file_path}-e")
end
