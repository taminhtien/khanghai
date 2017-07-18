class HomeController < ApplicationController
  layout 'coming_soon', only: [:coming_soon]

  def index
    @posts = New.order(id: :desc).limit(5)
    @forms = Form.order(id: :desc).limit(5)
    @documents = Document.order(id: :desc).limit(5)
    @question_and_answers = QuestionAndAnswer.order(id: :desc).limit(5)
    @services = Service.all.order(priority: :asc)
  end

  def coming_soon; end
end
