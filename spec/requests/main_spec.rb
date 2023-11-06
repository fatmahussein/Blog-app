require 'rails_helper'

RSpec.describe "Mains", type: :request do
  describe "GET /home" do
    it "returns http success" do
      get "/main/home"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /users" do
    it "returns http success" do
      get "/main/users"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /post" do
    it "returns http success" do
      get "/main/post"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /postid" do
    it "returns http success" do
      get "/main/postid"
      expect(response).to have_http_status(:success)
    end
  end

end
