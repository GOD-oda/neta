#
# client
#
class Issue
  class Request
    def initialize
      @uri = "https://api.github.com/repos/GOD-oda/neta/issues"
      @headers =  {
        "Content-Type" => "application/vnd.github+json",
        "Authorization" => "token #{ENV['GITHUB_TOKEN']}"
      }
    end

    def get(id)
      uri = URI.parse("#{@uri}/#{id}")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.scheme === "https"

      http.get(uri.path, @headers)
    end

    def patch(id, title: nil, body: nil)
      uri = URI.parse("#{@uri}/#{id}")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.scheme === "https"

      params = {}.tap do |this|
        this['title'] = title if title
        this['body'] = body if body
      end

      http.patch(uri.path, params.to_json, @headers)
    end
  end

  def get(issue_id)
    request = Issue::Request.new
    @res = request.get(issue_id).body
  end

  def save(issue_id, title: nil, body: nil)
    request = Issue::Request.new
    @res = request.patch(issue_id, title: title, body: body)
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