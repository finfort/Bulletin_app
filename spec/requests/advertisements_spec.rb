require 'spec_helper'

describe Advertisement do
  let(:advertisement) { FactoryGirl.create(:advertisement) }

  subject { advertisement }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  it { should respond_to(:img) }

  it { should be_valid }

end
