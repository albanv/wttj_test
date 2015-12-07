class Api::CandidatesController < ApplicationController
  def create
    @candidate = Candidate.create!(create_params)
    render :show, status: 201
  end

  def show
    @candidate = Candidate.find(params[:id])
  end

  private

    def create_params
      params.permit(:job_id, :firstname, :lastname, :headline, :coverletter, :resume)
    end
end
