class Page < ActiveRecord::Base

    belongs_to :wiki
    belongs_to :user

    default_scope { order('created_at DESC') }
end