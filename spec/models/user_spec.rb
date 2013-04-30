require 'spec_helper'

describe User do

  before { @user = FactoryGirl.create(:user) }
  subject {@user}

  it {should respond_to(:username)}
  it {should respond_to(:email)}
  it {should respond_to(:full_name)}
  it {should respond_to(:address)}
  it {should respond_to(:city)}
  it {should respond_to(:state)}
  it {should respond_to(:country)}
  it {should respond_to(:zip)}
  it {should respond_to(:birthday)}
end
