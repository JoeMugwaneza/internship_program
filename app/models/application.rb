class Application < ApplicationRecord
  belongs_to :user
  belongs_to :bank
  belongs_to :field_of_study
  has_one :internship_update
  belongs_to :district
  belongs_to :sector

  scope :got_internship, -> {where(internship_placement: true)}
  scope :looking_internship, -> {where(internship_placement: false) }

  def full_name
    user = self.user
    return full_name =  "#{user.first_name} #{user.last_name}"
  end

  def gender
    if self.is_female == true
      return "Female"
    elsif self.is_female == false
      return "Male"
    else
      return "Unspecified"
    end
  end

  def self.search(searchQuery)
    field_of_study_id = searchQuery['field_of_study_id'].to_i
    district_id = searchQuery['district_id'].to_i
    sector_id = searchQuery['sector_id'].to_i
    if field_of_study_id != 0 && sector_id == 0 && district_id == 0
      where(field_of_study_id: field_of_study_id)
    elsif field_of_study_id == 0 && sector_id == 0 && district_id != 0
      where(district_id: district_id)
    elsif field_of_study_id == 0 && sector_id != 0 && district_id != 0
      where("district_id =? AND district_id =?", district_id, district_id)
    elsif field_of_study_id != 0 && sector_id != 0 && district_id != 0
      where("district_id =? AND field_of_study_id =? AND sector_id =?", district_id, field_of_study_id, sector_id)
    elsif field_of_study_id != 0 && sector_id == 0 && district_id != 0
      where("district_id =? AND field_of_study_id =?", district_id, field_of_study_id)
    end
  end
end
