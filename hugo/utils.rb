require 'net/http'
require 'json'
require 'time'

class Post
  def initialize(id)
    @id = id
    @file_name = "#{@id}.md"
    @file_path = "content/posts/#{@file_name}"
  end

  def exists?
    File.exist?(@file_path)
  end

  def save_meta(title:, publish_date: '', date: '', tags: [])
    texts = File.read(@file_path)

    if title
      texts = texts.sub(/title:\s.*\n/, "title: #{title}\n")
    end

    unless publish_date.empty?
      if texts =~ /publishDate:\s.*\n/
        texts = texts.sub(/publishDate:\s.*\n/, "publishDate: #{publish_date}\n")
      elsif texts =~ /date:\s.*\n/
        texts = texts.sub(/date:\s(.*)\n/, "date: \1\npublishDate: #{publish_date}\n")
      end
    end

    unless date.empty?
      texts = texts.sub(/date:\s.*\n/, "date: #{date}\n")
    end

    unless tags.empty?
      if texts =~ /tags:\s.*\n/
        texts = texts.sub(/tags:\s.*\n/, "tags: #{tags.join(',')}\n")
      elsif texts =~ /draft:\s.*\n/
        texts = texts.sub(/draft:\s(.*)\n/, "draft: \1\ntags: #{tags.join(',')}\n")
      end
    end

    texts = texts.sub(/draft:\s.*\n/, "draft: false\n")

    File.open(@file_path, 'w+') { |f| f.write(texts) }
  end
end

class Issue
  ISSUE_URL = 'https://api.github.com/repos/GOD-oda/neta/issues/'

  def initialize(id)
    @id = id

    uri = URI.parse("#{ISSUE_URL}#{@id}")
    res = Net::HTTP.get_response(uri)
    @res = JSON.parse(res.body)
  end

  def title
    @res['title']
  end

  def label_names
    @res['labels'].map { |l| l['name'] }
  end

  def created_at
    unless @res['created_at']
      return ''
    end

    created_at = Time.parse(@res['created_at'])
    created_at.getlocal.to_s
  end

  def updated_at
    unless @res['updated_at']
      return ''
    end

    updated_at = Time.parse(@res['updated_at'])
    updated_at.getlocal.to_s
  end
end


