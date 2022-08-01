class Issue
  attr_reader :issue_id, :title

  def initialize(**params)
    @issue_id = params[:issue_id]
    @title = params[:title]
    @body = params[:body]
    @labels = params[:labels]
  end

  class Client
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

      case res = http.get(uri.path, @headers)
      when Net::HTTPSuccess
        JSON.parse(res.body)
      else
        res.value
      end
    end

    def patch(id, params: {})
      uri = URI.parse("#{@uri}/#{id}")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.scheme === "https"

      http.patch(uri.path, params.to_json, @headers)
    end
  end

  def self.get(issue_id)
    request = Issue::Client.new
    response = request.get(issue_id)

    self.new(
      issue_id: issue_id,
      title: response['title'],
      body: response['body'],
      labels: response['labels']
    )
  end

  def save(issue_id, title: nil, body: nil)
    request = Issue::Client.new
    @res = request.patch(issue_id, params: {title: title, body: body})
  end

  def label_names
    @labels.map { |l| l['name'] }
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