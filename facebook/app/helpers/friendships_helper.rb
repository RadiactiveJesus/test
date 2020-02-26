# frozen_string_literal: true

module FriendshipsHelper
    def request?(user)
        current_user.pending_requests.include? user
    end
end
