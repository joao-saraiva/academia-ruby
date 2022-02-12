class HomeController < ApplicationController
    layout :resolve_layout
    def index
    end

    def about
        #format.html { render :about, layout: 'other_pages_layout'}
    end

    private

    def resolve_layout
        case action_name
        when 'index'
            'application'
        else 'about'
            'other_pages_layout'
        end
    end
end
