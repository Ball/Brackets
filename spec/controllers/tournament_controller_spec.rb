require 'spec_helper'

describe TournamentsController do

  it 'should have 68 seedings after create' do
    post_params = {}
    post_params[:tournament] = {}
    post_params[:tournament][:name] = "test"
    post_params[:tournament][:start_time] = "1/1/2011 12:00:00"
    post_params[:tournament][:seedings_attributes] = {}
    (1..68).each do |i|
      post_params[:tournament][:seedings_attributes][i] = {:team => "team #{i}", :region => "region", :seed => i.to_s}
    end

    post :create, post_params

    assigns(:tournament).seedings.size.should be(68)
  end
end
