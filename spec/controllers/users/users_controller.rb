require 'rails_helper'

RSpec.describe Users::RegistrationsController do
    before do 
        @request.env['devise.mapping'] = Devise.mappings[:user]
    end

    let (:valids_attributes) { FactoryBot.attributes_for(:user) }
    let (:invalids_attributes) { { cpf: nil} }

    describe '#new' do 
        context 'when create an instnace of a user' do 
            it 'should create an instnace of a user' do 
                get :new
                expect(assigns(:user)).to be_a_new(User)
            end

            it 'should render new' do 
                get :new
                expect(response).to render_template(:new)
            end
        end
    end

    describe '#create' do
        context 'when have valids attributes' do 
            it 'should create an User' do 
                post :create, params: { user: valids_attributes }
                expect(User.last.email).to eq valids_attributes[:email]
            end

            it 'should redirect to root path' do 
                post :create, params: { user: valids_attributes }
                expect(response).to redirect_to(root_path)
            end
        end

        context 'when have invalids attributes' do 
            it 'should not create an User' do 
                post :create, params: { user: invalids_attributes }
                expect(User.last).to be_falsey
            end

            it 'should render new' do
                post :create, params: { user: invalids_attributes }
                expect(response).to render_template(:new)
            end
        end
    end
end