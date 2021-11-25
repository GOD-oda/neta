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
  system("gsed -i -e \"/date\:.*/a publishDate: #{updated_at.strftime('%Y-%m-%dT%H:%M:%S')}+09:00\" #{file_path}")
end

message_line = {
  now: false,
  values: []
}

File.open(file_path, 'a') do |f|
  res_body['body'].gsub(/\r/, '').split("\n").each do |line|
    if message_line[:now]
      if line == ':::message'
        message_line[:now] = false
        f.puts "{{<message>}}"
        message_line[:values].each { |v| f.puts v }
        f.puts "{{</message>}}"
        next
      end
      message_line[:values] << line
      next
    else
      if line == ':::message'
        message_line[:now] = true
        next
      end
    end

    if line.include?('<img')
      src = line[/src="(?<src>.*?)"/, 'src'] || ''
      alt = line[/alt="(?<alt>.*?)"/, 'alt'] || 'alt'
      next if src.empty?

      f.puts "![#{alt}](#{src})"
    else
      f.puts line
    end
  end
end

if File.exist?("#{file_path}-e")
  File.delete("#{file_path}-e")
end
