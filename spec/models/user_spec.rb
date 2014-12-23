require 'rails_helper'

describe User, type: :model do
  subject { User.new }

  it { should be_respond_to(:first_name) }
  it { should be_respond_to(:last_name) }
  it { should be_respond_to(:memo) }
end
