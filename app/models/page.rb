class Page < ActiveRecord::Base
    belongs_to :wiki
    belongs_to :users
end