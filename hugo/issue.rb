class Issue
  attr_reader :issue_id, :title

  def initialize(**params)
    @issue_id = params[:issue_id]
    @title = params[:title]
    @body = params[:body]
    @labels = params[:labels]
    @created_at = Time.parse(params[:created_at]).getlocal("+09:00")
    @updated_at = Time.parse(params[:updated_at]).getlocal("+09:00")
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
      labels: response['labels'],
      created_at: response['created_at'],
      updated_at: response['updated_at']
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
    @created_at.strftime("%Y-%m-%dT%H:%M:%S%z")
  end

  def updated_at
    @updated_at.strftime("%Y-%m-%dT%H:%M:%S%z")
  end
end