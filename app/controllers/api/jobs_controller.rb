class Api::JobsController < ApplicationController
  def create
    @job = Job.create!(params)
    render :show, status: 201
  end

  def show
    @job = Job.find(params[:id])
    render :show_with_candidates
  end

  def update
    @job = Job.find(params[:id])
    params.delete(:id)
    @job.update_attributes(params)
    render :show
  end

  def remove
    Job.find(params[:id]).destroy!
    render :nothing
  end
end
