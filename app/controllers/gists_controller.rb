class GistsController < ApplicationController
  before_action :set_test_passage, only: :create

  def create
    current_question = @test_passage.current_question

    response = GistFromQuestionCreator.call(current_question)

    hash_id = response.hash_id
    html_url = response.html_url

    gist = Gist.new(user: current_user, question: current_question, hash_id: hash_id)

    if response.success? && gist.save
      flash[:success] = view_context.link_to( t('.success'), html_url)
    else
      flash[:error] = t('.failure')
    end

    redirect_to test_passage_path(@test_passage)
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
