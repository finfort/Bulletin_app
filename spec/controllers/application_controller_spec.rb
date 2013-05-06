
require 'spec_helper'
describe ApplicationController do
  controller do
    def index
      raise CanCan::AccessDenied
    end
  end

  describe "handling AccessDenied exceptions" do
    it "redirects to the root page" do
      get :index
      response.should redirect_to root_path
    end
  end
end

