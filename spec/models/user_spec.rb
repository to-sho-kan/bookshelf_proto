require 'rails_helper'

describe User, type: :model do
  subject { Fabricate.build(:user) }

  it { should be_respond_to(:first_name) }
  it { should be_respond_to(:last_name) }
  it { should be_respond_to(:memo) }
end
