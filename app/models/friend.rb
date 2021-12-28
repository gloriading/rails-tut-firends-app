class Friend < ApplicationRecord
    belongs_to :user
    validates(:email, :first_name, :last_name, presence: { message: "must be given" }, uniqueness: true )
    validate :no_asdf
    before_save :title_names
    scope :recent_three, -> { order("created_at DESC").limit(3) }

    private

    def no_asdf
        if first_name.present? && first_name.downcase.include?('asdf')
            errors.add(:first_name, "should not contain asdf!")
        end
    end

    def title_names
        self.first_name = self.first_name.titleize
        self.last_name = self.last_name.titleize
    end
end
