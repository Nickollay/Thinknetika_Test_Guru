class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show result update]
  def show; end

  def result
    @rewarded_badges = BadgeRewarder.new.call(@test_passage)

    #TODO: delete comments if don't needed
    # if awarder_result.success?
    #   @awarded_badges = awarder_result.value!
    #
    # end
  end

  def update
    @test_passage.accept!(params[:answers_ids])
    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.eager_load(:test, :user).find(params[:id])
  end
end
