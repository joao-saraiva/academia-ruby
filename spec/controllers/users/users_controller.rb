require 'rails_helper'

RSpec.describe Users::RegistrationsController do
    describe '#new' do 
        context 'when create an instnace of a user' do 
            it 'should create an instnace of a user' do 
                get :new
                #expect(assigns(:user)).to be_a_new(User)
            end
            it 'should render new' do 
            end
        end
    end
end