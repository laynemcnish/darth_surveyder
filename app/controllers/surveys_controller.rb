class SurveysController < ApplicationController
  def index
    @surveys = surveys
    @user = user
    @survey = Survey.new
  end

  def save_survey_response
    response = Response.new(response_params)
    if response.valid?
      response.save!
    else
      flash[:message] = "Something has gone wrong: #{response.errors.full_messages.join(", ")}"
    end
    redirect_to index
  end

  def create
    survey = Survey.new(survey_params.except(:category))
    survey.category = Category.find_or_initialize_by(name: survey_params[:category])
    if survey.valid?
      survey.save!
    else
      flash[:message] = "Something has gone wrong: #{survey.errors.full_messages.join(", ")}"
    end
    redirect_to index
  end

  private

  def user
    User.find_or_create_by!(name: "Leia", rank: "Princess") # stubbed for association purposes
  end

  def surveys
    if search_params[:q].present?
      Survey.search(
        search_params[:q],
        page: params[:page],
        per_page: 10,
        order: {_score: :desc},
        includes: [:category, :responses]
      )
    else
      Survey.includes(:responses, :category).paginate(page: params[:page], per_page: 10).order(created_at: :desc)
    end
  end

  def response_params
    params.permit(:survey_id, :answer).merge(user_id: user.id)
  end

  def search_params
    params.permit(:q)
  end

  def survey_params
    params.require(:survey).permit(:question, :category, :q).merge(user_id: user.id)
  end
end
