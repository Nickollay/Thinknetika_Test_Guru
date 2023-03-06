class GistFromQuestionCreator
  def self.call(question, client = default_client)
    new.call(question, client)
  end

  def call(question, client)
    @question = question
    @test = question.test

    response = client.create_gist(gist_params)

    return OpenStruct.new(success?: false) unless success?(response)

    OpenStruct.new(success?: true, hash_id:  response.id, html_url: response.html_url)
  end

  private

  def self.default_client
    Octokit::Client.new(access_token: ENV.fetch('GITHUB_TOKEN'))
  end

  def gist_params
    {
      'description': I18n.t('.services.gist_question_service.description', title: @test.title),
      'public': true,
      'files': {
        'test_guru_question.txt': {
          'content': gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end

  def success?(response)
    response&.html_url.present?
  end
end
