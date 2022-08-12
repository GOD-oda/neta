#
# model
#
class Post
  def initialize(id)
    @id = id
    @file_name = "#{@id}.md"
    @file_path = "content/posts/#{@file_name}"
  end

  def exists?
    File.exist?(@file_path)
  end

  def texts
    File.read(@file_path)
  end

  def save_meta(title:, tags: [])
    texts = File.read(@file_path)

    if title
      texts = texts.sub(/title:\s.*\n/, "title: #{title}\n")
    end

    unless tags.empty?
      texts = texts.sub(/tags:\s.*\n/, "tags: [#{tags.join(',')}]\n")
    end

    texts = texts.sub(/draft:\s.*\n/, "draft: false\n")

    File.open(@file_path, 'w+') { |f| f.write(texts) }
  end
end
