class UserGroup < ApplicationRecord
    belongs_to :group, class_name: "group", foreign_key: "group_id"
    belongs_to :user , class_name: "user", foreign_key: "user_id"
end
