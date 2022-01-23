require 'rails_helper'

RSpec.describe User, type: :model do
  [:email, :password, :password_confirmation, :cpf].each do |attribute| 
    it { is_expected.to  validate_presence_of(attribute) }
  end
end
