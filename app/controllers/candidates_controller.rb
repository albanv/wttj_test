class CandidatesController < ApplicationController
  def create
    Candidate.create!(params[:candidate])
  end

  def show
    Candidate.find(params[:id])
  end
end
