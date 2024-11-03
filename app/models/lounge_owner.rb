# frozen_string_literal: true

class LoungeOwner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :date_of_birth, presence: true
  validate :must_be_18_or_older

  private

  def must_be_18_or_older
    return unless date_of_birth.present? && date_of_birth > 18.years.ago

    errors.add(:date_of_birth, 'must be 18 years or older')
  end
end
