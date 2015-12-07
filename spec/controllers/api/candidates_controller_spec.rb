require 'rails_helper'

RSpec.describe Api::CandidatesController, type: :controller do
  let(:job) { FactoryGirl.create(:job) }
  let(:candidate) { FactoryGirl.create(:candidate, job: job) }

  describe 'POST #create' do
    let(:params) do
      {
        job_id: job.id,
        firstname: Faker::Name.first_name,
        lastname: Faker::Name.last_name,
        headline: Faker::Lorem.sentence,
        coverletter: Faker::Lorem.paragraph,
        resume: Faker::Internet.url
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

    it 'assigns @candidate' do
      post :create, params
      new_candidate = assigns(:candidate)
      expect(new_candidate.attributes.symbolize_keys).to include(params)
    end

    it 'render api/jobs/show.rabl' do
      post :create, params
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #show' do
    it 'be successful' do
      get :show, id: candidate.id
      expect(response).to be_success
    end

    it 'has a 200 status' do
      get :show, id: candidate.id
      expect(response).to have_http_status(200)
    end

    it 'assigns @candidate' do
      get :show, id: candidate.id
      expect(assigns(:candidate)).to eq(candidate)
    end

    it 'render api/candidates/show.rabl' do
      get :show, id: candidate.id
      expect(response).to render_template(:show)
    end
  end
end
