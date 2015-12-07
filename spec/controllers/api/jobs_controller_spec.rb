require 'rails_helper'

RSpec.describe Api::JobsController, type: :controller do
  let(:job) { FactoryGirl.create(:job) }

  describe 'POST #create' do
    let(:params) do
      {
        title: "test",
        description: "je suis un test"
      }
    end

    it 'be successful' do
      post :create, params
      expect(response).to be_success
    end

    it 'has a 201 status' do
      post :create, params
      expect(response).to have_http_status(201)
    end

    it 'assigns @job' do
      post :create, params
      new_job = assigns(:job)
      expect(new_job.attributes.symbolize_keys).to include(params)
    end

    it 'render api/jobs/show.rabl' do
      post :create, params
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #show' do
    it 'be successful' do
      get :show, id: job.id
      expect(response).to be_success
    end

    it 'has a 200 status' do
      get :show, id: job.id
      expect(response).to have_http_status(200)
    end

    it 'assigns @job' do
      get :show, id: job.id
      expect(assigns(:job)).to eq(job)
    end

    it 'render api/jobs/show.rabl' do
      get :show, id: job.id
      expect(response).to render_template(:show_with_candidates)
    end
  end

  describe 'PUT #update' do
    let(:params) do
      {
        id: job.id,
        job: { # For testing strong parameters
          title: job.title,
          description: job.description
        },
        title: "test",
        description: "je suis un test"
      }
    end

    it 'be successful' do
      put :update, params
      expect(response).to be_success
    end

    it 'has a 200 status' do
      put :update, params
      expect(response).to have_http_status(200)
    end

    it 'assigns @job' do
      put :update, params
      expect(assigns(:job)).to eq(job)
    end

    it 'render api/jobs/show.rabl' do
      put :update, params
      expect(response).to render_template(:show)
    end
  end

  describe 'DELETE #remove' do
    it 'be successful' do
      delete :remove, id: job.id
      expect(response).to be_success
    end

    it 'has a 200 status' do
      delete :remove, id: job.id
      expect(response).to have_http_status(200)
    end

    it 'assigns @job' do
      delete :remove, id: job.id
      expect(assigns(:job)).to eq(job)
      # expect(assigns(:job)).to receive(:destroy!)
    end
  end
end
