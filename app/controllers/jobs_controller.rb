class JobsController < ApplicationController
  def create
    Job.create!(params[:job])
  end

  def show
    Job.find(params[:id])
  end

  def update
    job = Job.find(params[:id])
    job.update_attributes!(params)
  end

  def remove
    Job.find(params[:id]).destroy!
  end
end
