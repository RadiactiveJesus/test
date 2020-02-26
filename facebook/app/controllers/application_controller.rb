# frozen_string_literal: true

class ApplicationController < ActionController::Base
    def requests
        current_user.pending_inverse_friendships.order(:created_at)
    end
end
