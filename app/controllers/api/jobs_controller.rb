class Api::JobsController < ApplicationController
  def create
    @job = Job.create!(create_params)
    render :show, status: 201
  end

  def show
    @job = Job.find(params[:id])
    render :show_with_candidates
  end

  def update
    @job = Job.find(params[:id])
    @job.update_attributes(update_params)
    render :show
  end

  def remove
    @job = Job.find(params[:id])
    @job.destroy!
    render nothing: true
  end

  private

    def create_params
      params.permit(:title, :description)
    end

    def update_params
      params.require(:job).permit(:title, :description)
    end
end
